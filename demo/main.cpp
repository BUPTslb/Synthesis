#include "main.h"
void Include::clear() {

    //初始化Include信息
    headerfile.clear();
    is_quotation = false;
    is_angle = false;
}
//流输出函数，重载<<，
std::ostream &operator<<(std::ostream&s,const Include&I)
{
    if (I.is_angle)
        s<<"尖括号";
    if (I.is_quotation)
        s<<"双引号";
    s<<"头文件：["<<I.headerfile<<"]";
    return s;
}