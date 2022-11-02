//
// Created by shenlibo on 22-10-28.
//
/// file 1.c
#include "iostream"
#include "string"
#include "bitset"

using namespace std;
std::string print_char_as_binary(char input) {
    int i;
    std::string input_bin;
    for (i=0; i<8; i++) {
        char shift_byte = 0x01 << (7-i);
        if (shift_byte & input) {
            input_bin+= '1';
        } else {
            input_bin+= '0';
        }
    }
    return input_bin;
}
/*
bool bit_get(std::string bits, int i) {
    std::string a = bitset::bitset<>();
    a.size();
    for (int j = 0; j < a.size(); ++j)
    {
        a[j];
    }
    bool bx;
    if(((bits >> i) & 0) == 0)
    {
        cout<<"bits移位之前为："<<bitset<sizeof(unsigned char)>(bits)<<endl;
        cout<<"bits移位之后为："<<bitset<sizeof(unsigned char)>(bits>>4)<<endl;
        bx = 1;
    }
    else
        bx = 0;
    return bx;
}

static bool bit_set(unsigned char *pString, int i, bool get){
    unsigned char A[8];//
    A=0b1<<i;
    if(get)
    {
        pString=pString | A;
    }
    else
    {
        A=~A;
        pString=pString & A;
    }

}*/
int main(){
    std::string plaintext="shenlibo";
    std::string plaintext_bin;//默认为空
    std::string key="12345678";
    std::string cipher;
    for(int i=0;i<plaintext.size();i++)
    {
        plaintext_bin += print_char_as_binary(plaintext[i]);
    }
    //cout<<"size of plainbin: "<<plaintext_bin.size()<<endl<<"plain_bin: "<<endl<<plaintext_bin<<endl;
    for(int i=0;i<plaintext_bin.size();i++)
    cout<<(~plaintext_bin[i]);
    return 0;
}
