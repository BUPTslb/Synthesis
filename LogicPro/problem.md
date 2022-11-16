# 问题
## 一些工程问题
Git上传文件夹方法总结：  
首先保证能够连接到GitHub：ssh -T git@github.com，记得输入yes
## 重写DES算法，化简
multiple definition of：  
不要把全局变量及全局方法的定义放在头文件。  
-测试LLVM的CDFG图生成能力
使用测试函数，testgraph.cpp
llvm生成call graph和DFG的脚本：  
`clang $1.c -emit-llvm -S //生成IR`   
`opt -dot-cfg $1.ll > /dev/null  //生成CFG`
`opt -dot-callgraph $1.ll > /dev/null`  
`dot -Tpng -o $1.png cfg.main.dot`  
`dot -Tpng -o $1.callgraph.png callgraph.dot`  
`clang -S $1.c -o $1.s //生成汇编代码`  
**当前无法使用LLVM生成CDFG**  
[clang参数](https://www.jianshu.com/p/96058bf1ecc2)  
-双系统ubuntu无法访问其他盘，使用如下命令  
sudo  ntfsfix /dev/sda3  
在此之前要安装NTFSfix：sudo apt install ntfs-3g -y  
-typedef struct含义：定义结构体的名称  
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

**11月5日，放弃使用LLVM作为前端**
1. 从使用高级语言作为输入的HLS论文中找CDFG生成方法，基本没有详细介绍
2. 从HDL语言开始生成CDFG 这里容易被吐槽与现有高层次综合不太一样
-安装版本的LLVM似乎存在很多工具缺失，重新进行编译版本的LLVM 
使用其DAG图生成功能：
llc -mtriple=mips-linux-gnu –view-dag-combine1-dags sum.ll
-发现一个NYU的做CGRA的
其中工具包含使用LLVM pass生成CDFG，无果而终

### 从VHDL到CDFG
南佛洛丽达大学的毕业论文CHESS  
香港理工大学毕业论文中提到一个工具Hardware Petri Nets：通过佩特里网生成CDFG,P71/114  
   上文说chess严重依赖VHDL高级语法，而我们设定了编程模型，不用考虑通用型问题，因此证明CHESS可用
CHESS：
1. 词法分析lexical analysis
   将源程序转换为标记流，其中每个标记是具有集体意义的字符序列，如标识符、关键字、操作符或标点符号
   使用Lex,生成tokens
   编译命令：
   flex example1.l
   cc lex.yy –o example –lfl
   生成可执行文件example，-lfl是编译选项，没有定义main函数时候使用
2. 语法分析
   对它们施加层次结构，以验证程序的语法
   使用YACC,YACC程序包含显式函数，用于在语法层次结构中的每个步骤创建节点
   YACC可以解析输入流中的标识符(token)，生成解析树
3. 截断 解析树【truncate(parse tree)】
   解析树压缩成为语法树，语法树变换为CDFG  

词法分析和句法分析即使是对于VHDL也是一个比较复杂的工作，而且已经有较多的反编译前端现有工具，他们的目的是从HDL生成高级语言，中间会生成AST，不必去做重复的工作，可以参考的Github：https://github.com/Nic30/hdlConvertor  
上述工具得到VHDL的AST，我们要做的工作就是将AST转化为CDFG，依据：CHESS中的算法  
**当前目的**
读懂python代码，分析抽象语法树的结构，从中抽取出算子，绘制CDFG




### 设定编程模型
选择使用能够描述行为级的硬件描述语言VHDL，Verilog级别相对低级，适合描述RTL。  
在写VHDL时，使用architecture Behavioral of XXX is，结构体的行为命名，对应行为级描述。采用进程语句顺序描述实体行为，抽象程度高，大量使用逻辑运算（算术运算、关系运算），为高层次描述，不用关注电路组织和门级实现。  
我们决定规定只能使用硬件相关的算子进行编程,类似于Rolf Drechsler的论文LIM-HDL。  
其中支持的算子有：RM3,&，|，～，^，由于这篇文章是基于PLIM架构的，有MAJ操作，我们的逻辑组中使用MAGIC，将RM3更换为NOR。  
常见的逻辑操作之 shift：文中没有给转换，因为有语义意义--最终图中的操作数与操作的连接（**这一点不太理解**）  
另外存在LUT可以进行其他操作。
算子支持：
1. 外围电路SA：XOR、OR、AND、INV（只处理行间操作）
2. RRAM性质，基于MAGIC逻辑族：NOR（只处理行内操作）
由于底层都是逻辑算子，必然会有常用而且无法解决的情况，我们选择使用LUT来弥补
3. 基于LUT：常用的、无法用以上算子综合的算子
使用以上算子对算法重新书写，写成VHDL语言




## 高层次综合
输入：算法级行为描述、约束条件和目标集合  
输出：在目标集合中找到一个满足约束条件，实现系统行为的**结构**  
行为：系统与外界的作用和联系（如输入到输出的映射关系）  
结构：组成系统的部件和他们的连接关系  



## 当前的问题
-CDFG-：  
使用存内计算时必须先将两个操作数写进同一个阵列中，计算完之后的中间结果如果需要再和其他操作数执行运算，则需要再写回，但RRAM存在写效率低的问题，而且一个阵列同一时间只能串行使用SA，读、写、执行运算都会占用SA，相当于很多操作数都只能单发射串行，效率很低下且有写耐久问题、阵列大小限制。  
如果放进其他阵列处理，则更慢且不会减小写次数，唯一好处就是分担了耐久。这个问题是当前遇到的最大问题。