# 问题
multiple definition of
不要把全局变量及全局方法的定义放在头文件
-首先
测试LLVM的CDFG图生成能力
使用测试函数，testgraph.cpp
llvm生成call graph和DFG的脚本：
`clang $1.c -emit-llvm -S //生成IR
opt -dot-cfg $1.ll > /dev/null  //生成CFG
opt -dot-callgraph $1.ll > /dev/null
dot -Tpng -o $1.png cfg.main.dot
dot -Tpng -o $1.callgraph.png callgraph.dot
clang -S $1.c -o $1.s //生成汇编代码`
当前无法生成
[clang参数](https://www.jianshu.com/p/96058bf1ecc2)
-双系统ubuntu无法访问其他盘，使用如下命令
sudo  ntfsfix /dev/sda3
在此之前要安装NTFSfix：sudo apt install ntfs-3g -y
-typedef struct含义：
