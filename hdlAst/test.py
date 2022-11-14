import os
import sys

from hdlConvertorAst.language import Language
from hdlConvertor import HdlConvertor

# TEST_DIR = os.path.join("..", "tests", "verilog")

filenames = "test.vhd"
include_dirs = []
c = HdlConvertor()
# note that there is also Language.VERILOG_2005, Language.SYSTEM_VERILOG_2017 and others
d = c.parse(filenames, Language.VHDL_2008, include_dirs, hierarchyOnly=False, debug=True)
from hdlConvertorAst.to.vhdl.vhdl2008 import ToVhdl2008

tv = ToVhdl2008(sys.stdout)
tv.visit_HdlContext(d)
from hdlConvertorAst.to.json import ToJson
import json
tj = ToJson()
j = tj.visit_HdlContext(d)
# pretty print json
# print(json.dumps(j, sort_keys=True,
#                  indent=4, separators=(',', ': ')))
# each HDL AST object __repr__ returns json like string
for o in d.objs:
    print(o)

from hdlConvertorAst.hdlAst import HdlModuleDec
from hdlConvertorAst.hdlAst import HdlIdDef
# print port names
for o in d.objs:
#     print(type(o))
    if isinstance(o, HdlModuleDec):
        for  i in o.ports:
            # if isinstance(i , HdlIdDef):
                print(i.name)
#         print(o.dec)
#         print(o.name)
#         for x in o.dec.ports:
#             print(x.name)
from hdlConvertorAst.to.hdl_ast_visitor import HdlAstVisitor
from hdlConvertorAst.hdlAst import HdlValueId, HdlOp

class PortNamesToUpperCase(HdlAstVisitor):
    """
    Make port names upper case HDL AST

    :note: this is just a stupid rewrite of all variable names to upper case
    """
    def visit_HdlIdDef(self, o):
        o.name = o.name.upper()

    def visit_HdlStmProcess(self, o):
        if o.sensitivity:
            o.sensitivity = [self.visit_iHdlExpr(s) for s in o.sensitivity]
        self.visit_iHdlStatement(o.body)

    def visit_iHdlExpr(self, o):
        if isinstance(o, HdlValueId):
            return HdlValueId(o.val.upper(), obj=o.obj)
        elif isinstance(o, HdlOp):
            o.ops = [self.visit_iHdlExpr(s) for s in o.ops]
            return o
        else:
            return super(PortNamesToUpperCase, self).visit_iHdlExpr(o)

    def visit_HdlStmIf(self, o):
        o.cond = self.visit_iHdlExpr(o.cond)
        super(PortNamesToUpperCase, self).visit_HdlStmIf(o)

    def visit_HdlStmAssign(self, o):
        o.src = self.visit_iHdlExpr(o.src)
        o.dst = self.visit_iHdlExpr(o.dst)

PortNamesToUpperCase().visit_HdlContext(d)

tv = ToVhdl2008(sys.stdout)
tv.visit_HdlContext(d)