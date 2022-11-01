//
// Created by shenlibo on 22-10-28.
//
/// file 1.c
#include "iostream"

using namespace std;
//int x = 10;
//int y = 11;
bool bit_get(unsigned char *bits, int i) {
    bool bx;
    if(((*bits >> i) & 1) == 1)
        bx = 1;
    else
        bx = 0;
    return bx;
}
int main(){
    char b='cc';
    unsigned char *a=11111111;
    cout<<a<<endl;
    cout<<*a<<endl;
    cout<<bit_get(a,2);
    return 0;
}
