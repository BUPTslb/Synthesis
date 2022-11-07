# 问题
## 重写DES算法，化简
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
定义结构体的名称
-int main(int argc, char* argv[])
argc为程序运行时候发送给main函数的命令行参数的个数，在VS中默认值为1
char*型的argv[]，为字符串数组，用来存放指向的字符串参数的指针数组，每一个元素指向一个参数。各成员含义如下：
argv[0]指向程序运行的全路径名
argv[1]指向在DOS命令行中执行程序名后的第一个字符串
argv[2]指向执行程序名后的第二个字符串
argv[3]指向执行程序名后的第三个字符串
argv[argc]为NULL
-char[]与char*的定义
char[]是字符数组，可以{,,,}定义，“”定义时数量比数字小1,末尾默认为0
\*指针只有const char*能直接用字符串定义，其余的指向定义的空间即可-
## 生成算法的CDFG图
### 从LLVM IR到CDFG
首先将Sampledes编译成LLVM IR
clang++ -S -emit-llvm desSample.cpp -o desSample.ll -O3
473行
生成汇编代码
clang++ -S desSample.cpp -o desSample.s
800行
用完整的一个应用/高级算法生成CDFG大概率看不懂，应该从小函数开始，可以选择向量相加
-opt: unknown pass name 'dot-callgraph'
似乎和版本有关，暂时找不到生成以算子为节点的方法。
1. 从使用高级语言作为输入的HLS论文中找CDFG生成方法
2. 从HDL语言开始生成CDFG 这里容易被吐槽与现有高层次综合不太一样
-安装版本的LLVM似乎存在很多工具缺失，重新进行编译版本的LLVM 
使用其DAG图生成功能：
llc -mtriple=mips-linux-gnu –view-dag-combine1-dags sum.ll
-发现一个NYU的做CGRA的
其中工具包含使用LLVM pass生成CDFG

### 从Verilog/VHDL到CDFG
还需寻找现有工具,应该能找到


## 高层次综合
输入：算法级行为描述、约束条件和目标集合
输出：在目标集合中找到一个满足约束条件，实现系统行为的**结构**
行为：系统与外界的作用和联系（如输入到输出的映射关系）
结构：组成系统的部件和他们的连接关系







