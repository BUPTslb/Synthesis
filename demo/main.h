#pragma once
//C++预处理命令，保证头文件只被编译一次
#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <iterator>

struct Include
{
    void clear();
    std::string headerfile;
    bool is_quotation;
    bool is_angle;
    //友元函数对运算符重载
    friend std::ostream&operator<<(std::ostream&s,const Include&I);

};
std::ostream&operator<<(std::ostream&s,const Include&I);
#define YYSTYPE Include
