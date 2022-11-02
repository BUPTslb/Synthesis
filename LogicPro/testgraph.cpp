//
// Created by shenlibo on 22-10-28.
//
/// file 1.c
#include "iostream"
#include "string"

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
