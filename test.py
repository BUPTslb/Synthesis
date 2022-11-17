import os
import sys

from hdlConvertor import HdlConvertor
from hdlConvertorAst.language import Language

# TEST_DIR = os.path.join("..", "tests", "verilog")

filenames = "test.vhd"
include_dirs = []
c = HdlConvertor()
#c为HdlConvertor类的实例化
# note that there is also Language.VERILOG_2005, Language.SYSTEM_VERILOG_2017 and others
#d是对文件test.vhd的VHDL2008解析，这里应该已经生成了AST
d = c.parse(filenames, Language.VHDL_2008, include_dirs, hierarchyOnly=False, debug=False)
from hdlConvertorAst.to.vhdl.vhdl2008 import ToVhdl2008

# tv = ToVhdl2008(sys.stdout)
# #这个函数：将AST重新转到VHDL2008
# #tv是类ToVhdl2008的实例化对象，d是HdlContext,tv调用输出
# tv.visit_HdlContext(d)


import json

from hdlConvertorAst.to.json import ToJson

tj = ToJson()
j = tj.visit_HdlContext(d)
#j就是解析之后的VHDL代码,输出其类型为<list>
print('type of j=:',type(j),'\n')
# pretty print json
print(json.dumps(j, sort_keys=True,
                  indent=4, separators=(',', ': ')))
#以上函数会对生成的json进行可视化友好的输出
# each HDL AST object __repr__ returns json like string
for o in d.objs:
    print('type of d.objs:\n',type(o),'\n',o)
print('\n','type of d: ',type(d),'\n')

#d的类型<'hdlConvertorAst.hdlAst._structural.HdlContext'>
from hdlConvertorAst.hdlAst import HdlIdDef, HdlModuleDec,HdlModuleDef,HdlStmProcess,\
        HdlStmBlock,HdlStmAssign,HdlOp,HdlStmIf,HdlStmWhile,iHdlExpr

# print port names
# obj有两种类型：
#<class 'hdlConvertorAst.hdlAst._structural.HdlModuleDec'> 声明，entity部分
#<class 'hdlConvertorAst.hdlAst._structural.HdlModuleDef'> 定义，architecture部分
def Node_ID(N):
    N=N+1
    print('Node_ID  :',N)
    return N

def DoOp(src,N):
    N=Node_ID(N)
    print('Input    : ',src.ops)
    print('Operation: ',src.fn,'\n')
    return N

def DoAssign(body,N):
#定义函数处理Assign类型
    if isinstance(body.src,HdlOp):
        N=DoOp(body.src,N)
    N=Node_ID(N)
    print('Dst      :',body.dst)
    print('Input    :',body.src)
    #print('Operation:','SEQ','\n')
    return N

def DoIf(body,N):
#定义函数处理If类型
#cond类型：if不是节点，条件是节点
    print('Type     : If')
    print('Condition:',body.cond)
    N=DoOp(body.cond,N)
    print('\n');
#elif类型：列表[元组]，现将其改成list类型。可能为空，要先做判断
    if body.elifs:#列表不为空
        body.elifs[0]=list(body.elifs[0])
        #print('type of body.elifs: ',type(body.elifs[0]))
        print('Type     : Elsif')
        N=DoOp(body.elifs[0][0],N)
        N=DoBlock(body.elifs[0][1],N)
    if body.if_true:
        print('Statements When True:')
        N=DoBlock(body.if_true,N)
    if body.if_false:
        print('Statements When False:')
        N=DoBlock(body.if_false,N)
    return N

def DoWhile(body,N):
#定义函数处理While类型
    print('Type     : While')
    print('Condition:',body.cond)
    N=DoOp(body.cond,N)
    print('\n');
    N=DoBlock(body.body,N)
    print('End Loop\n')
    return N

def DoBlock(block,N):
    for m in block.body:
    #需要递归调用Block，加上对body类型的条件判断引用其他函数
        if isinstance(m,HdlStmAssign):
                N=DoAssign(m,N)
                print('Operation: ',block.join_t,'\n')
        if isinstance(m,HdlStmIf):
                N=DoIf(m,N)
        if isinstance(m,HdlStmWhile):
                N=DoWhile(m,N)
        if isinstance(m,HdlStmBlock):
                N=DoBlock(m,N)
    return N

for o in d.objs:
    # print('obj =',o)
    # print('type of obj= ',type(o))
    
    #如果obj是声明，即为entity，输出port名
    #isinstance函数，判断实例对象是否是已知的类型
    if isinstance(o, HdlModuleDec):
        for  i in o.ports:
            print(i.name)
    #如果obj是定义，即为architecture
    if isinstance(o,HdlModuleDef):
        print('\n')
        for i in o.objs:
            if isinstance(i,HdlStmProcess):
            #找到HdlStmProcess
                N=0;
                DoBlock(i.body,N)
                                        
                        
                         
    #HdlStmProcess的body是HdlStmBlock
    #HdlStmBlock的body是[],列表类型list  
                    