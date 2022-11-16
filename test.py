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

def DoAssign(body,N):
#定义函数处理Assign类型
    N=Node_ID(N)
    print('Dst      :',j.dst)
    print('Operation:',j.src.fn)
    print('Input    :',j.src.ops)
    return N

def DoBlock(body,N):
    

    return N

def DoIf(body,N):
#定义函数处理If类型
#cond类型：
    N=Node_ID(N)
    print('Operation:',body.cond.fn)
    print('Input:',body.cond.ops)
#elif类型：
    N=Node_ID(N)
    body.elifs[0]=list(body.elifs[0])
    #print('type of body.elifs: ',type(body.elifs[0]))
    print('Operation: ',body.elifs[0][0].fn)
    DoAssign(body.elifs[0][1].fn,N)


    return N

def DoWhile(nody,N):
#定义函数处理While类型
    N=Node_ID(N)
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
                for j in i.body.body:
                    if isinstance(j,HdlStmAssign):
                        N=DoAssign(j,N)
                    if isinstance(j,HdlStmIf):
                        N=DoIf(j,N)
                    # if isinstance(j,HdlStmIf):
                    # #进入循环
                    #     for k in range[j]:
                    #         if isinstance(k,HdlOp):
                    #             N=N+1
                    #             print('Node_ID  :',N)
                    #             print('type of cond:',type(k))
                    #             print('Operation:',j.cond.fn)
                    #             print('Input    :',j.cond.ops)
                    #         elif k == 'elifs':
                    #             print(k[0][0].fn)

                    #         elif k == 'if_false':
                    #             print('1')


                    #         elif k == 'if_true':    
                    #             print('2')
                                

                        
                    #输出条件
                        
                         
            #HdlStmProcess的body是HdlStmBlock
            #HdlStmBlock的body是[],列表类型list  
                    