/*简化版本的DES算法*/
#include "iostream"
using namespace std;
#include "string.h"
/*需要存储的表一共有4个，密钥三个，明文一个*/
//表一：64位密钥转为56位密钥的转换表
int initial_key_permutaion[] = {57, 49,  41, 33,  25,  17,  9,
                                1, 58,  50, 42,  34,  26, 18,
                                10,  2,  59, 51,  43,  35, 27,
                                19, 11,   3, 60,  52,  44, 36,
                                63, 55,  47, 39,  31,  23, 15,
                                7, 62,  54, 46,  38,  30, 22,
                                14,  6,  61, 53,  45,  37, 29,
                                21, 13,   5, 28,  20,  12,  4};
//表二：56位子密钥转48位子密钥的转换表
int sub_key_permutation[] =    {14, 17, 11, 24,  1,  5,
                                3, 28, 15,  6, 21, 10,
                                23, 19, 12,  4, 26,  8,
                                16,  7, 27, 20, 13,  2,
                                41, 52, 31, 37, 47, 55,
                                30, 40, 51, 45, 33, 48,
                                44, 49, 39, 56, 34, 53,
                                46, 42, 50, 36, 29, 32};
//表三：将明文右32位拓展为48位的拓展表
int message_expansion[] =  {32,  1,  2,  3,  4,  5,
                            4,  5,  6,  7,  8,  9,
                            8,  9, 10, 11, 12, 13,
                            12, 13, 14, 15, 16, 17,
                            16, 17, 18, 19, 20, 21,
                            20, 21, 22, 23, 24, 25,
                            24, 25, 26, 27, 28, 29,
                            28, 29, 30, 31, 32,  1};
//表四：将48位异或结果转为32位R的S盒子
int S[4][16] = {14,  4, 13,  1,  2, 15, 11,  8,  3, 10,  6, 12,  5,  9,  0,  7,
            0, 15,  7,  4, 14,  2, 13,  1, 10,  6, 12, 11,  9,  5,  3,  8,
            4,  1, 14,  8, 13,  6,  2, 11, 15, 12,  9,  7,  3, 10,  5,  0,
            15, 12,  8,  2,  4,  9,  1,  7,  5, 11,  3, 14, 10,  0,  6, 13};

/*定义结构体key_set,其中包含k\c\d*/
typedef struct {
    unsigned char k[8];//0-7
    unsigned char c[4];//0-3
    unsigned char d[4];//0-3
} key_set;
/*函数一，根据输入的字符，将其转化位二进制*/
void print_char_as_binary(char input) {
    int i;
    for (i=0; i<8; i++) {
        char shift_byte = 0x01 << (7-i);
        if (shift_byte & input) {
            printf("1");
        } else {
            printf("0");
        }
    }
}
/*根据转换表，N位密钥生成M位子密钥，返回值设置为void，输入要包含规定的子密钥，*keyset*/
void subkey_generation(const char *key,key_set *key_sets){
    int i, j;//for循环中使用，先定义
    int shift_size;//转换表中的位置
    unsigned char shift_byte, first_shift_bits, second_shift_bits, third_shift_bits, fourth_shift_bits;
    //进行64位到56位的转换
    for (i=0; i<56; i++) {
        shift_size = initial_key_permutaion[i];//从转换表中取数字
        shift_byte = 0x80 >> ((shift_size - 1)%8);//10000000为基，右移
        shift_byte &= key[(shift_size - 1)/8];//k0-7中的一位与1 &，取出此位=shift_byte
        shift_byte <<= ((shift_size - 1)%8);//向左移动，=放在对应的位置上
        /*key_sets.k是8个char，64位，初始为0,通过或来赋值，给k0-6，共56位*/
        key_sets[0].k[i/8] |= (shift_byte >> i%8);
    }
    //转换后的56位密钥是key_set.k[0-6],k[7]全0，作为初始密钥k0
    //将56位密钥分为左右两部分，各28位，L左旋1位，R右旋1位
    //L:012共24位
    for (i=0; i<3; i++) {
        key_sets[0].c[i] = key_sets[0].k[i];
    }
    //与11110000相与，得到后四位
    key_sets[0].c[3] = key_sets[0].k[3] & 0xF0;
    //00001111与11110000取后四位左移，前四位右移
    for (i=0; i<3; i++) {
        key_sets[0].d[i] = (key_sets[0].k[i+3] & 0x0F) << 4;
        key_sets[0].d[i] |= (key_sets[0].k[i+4] & 0xF0) >> 4;
    }
    key_sets[0].d[3] = (key_sets[0].k[6] & 0x0F) << 4;
    //分好后的c前28位是L，d前28位是R
    /*分别进行旋转，原本的加密算法是要依靠旋转表进行，而且要进行16次操作，我们只进行一次，左1*/
    shift_size = 1;
    shift_byte = 0x80;//10000000
    //对左侧进行处理：c，共32位置，前28位置可用，按位与，与初始0或赋值给k1
    //左移，把四个字节的第一位都取出来，然后整体移动，在把第一位赋过去
    first_shift_bits = shift_byte & key_sets[0].c[0];
    second_shift_bits = shift_byte & key_sets[0].c[1];
    third_shift_bits = shift_byte & key_sets[0].c[2];
    fourth_shift_bits = shift_byte & key_sets[0].c[3];
    key_sets[0].c[0] <<= shift_size;
    key_sets[0].c[0] |= (second_shift_bits >> (8 - shift_size));

    key_sets[0].c[1] <<= shift_size;
    key_sets[0].c[1] |= (third_shift_bits >> (8 - shift_size));

    key_sets[0].c[2] <<= shift_size;
    key_sets[0].c[2] |= (fourth_shift_bits >> (8 - shift_size));

    key_sets[0].c[3] <<= shift_size;
    key_sets[0].c[3] |= (first_shift_bits >> (4 - shift_size));
    //对右侧进行处理，同样的操作
    first_shift_bits = shift_byte & key_sets[0].d[0];
    second_shift_bits = shift_byte & key_sets[0].d[1];
    third_shift_bits = shift_byte & key_sets[0].d[2];
    fourth_shift_bits = shift_byte & key_sets[0].d[3];
    key_sets->d[0] <<= shift_size;
    key_sets->d[0] |= (second_shift_bits >> (8 - shift_size));

    key_sets->d[1] <<= shift_size;
    key_sets->d[1] |= (third_shift_bits >> (8 - shift_size));

    key_sets->d[2] <<= shift_size;
    key_sets->d[2] |= (fourth_shift_bits >> (8 - shift_size));

    key_sets->d[3] <<= shift_size;
    key_sets->d[3] |= (first_shift_bits >> (4 - shift_size));
    //当前得到L和R，组合形成56位子密钥
    /*根据48位转换表，将其转换位48位数字*/
    for (j=0; j<48; j++) {
        shift_size = sub_key_permutation[j];
        //用28作界限，分别从c和d中取数字
        if (shift_size <= 28) {
            shift_byte = 0x80 >> ((shift_size - 1)%8);
            shift_byte &= key_sets->c[(shift_size - 1)/8];
            shift_byte <<= ((shift_size - 1)%8);
        } else {
            shift_byte = 0x80 >> ((shift_size - 29)%8);
            shift_byte &= key_sets->d[(shift_size - 29)/8];
            shift_byte <<= ((shift_size - 29)%8);
        }

        key_sets->k[j/8] |= (shift_byte >> j%8);
    }

}
/*对明文进行操作，生成密文。输入有明文，规定的密文，子密钥*/
void process_message(const char * message_piece, unsigned char* processed_piece, key_set* key_sets){
    int i;
    int shift_size;
    unsigned char shift_byte;
    //对密文进行初始化，64位0
    memset(processed_piece, 0, 8);

    unsigned char er[6], ser[4];

    //首先对明文进行划分处理，左右各自32位，不再进行初始置换
    unsigned char l[4], r[4];
    for (i=0; i<4; i++) {
        l[i] = message_piece[i];//前32位
        r[i] = message_piece[i+4];//后32位
    }


    //memset，将前n个字节设置为c
    memset(er, 0, 6);

    //对后32位拓展到48位，按message_expansion,得到48位er
    for (i=0; i<48; i++) {
        shift_size = message_expansion[i];
        shift_byte = 0x80 >> ((shift_size - 1)%8);
        shift_byte &= r[(shift_size - 1)/8];
        shift_byte <<= ((shift_size - 1)%8);

        er[i/8] |= (shift_byte >> i%8);
    }


    //48位er和子密钥的48位进行XOR运算,得到XOR后的48的er
    for (i=0; i<6; i++) {
        er[i] ^= key_sets->k[i];
    }
    /*进行S盒替换，er一共48位，每6位为一组，第一位和最后一位组成行号，剩下四位组成列号
     * S盒子中的数据都<16,作为替换后的四位数字
     * */
    unsigned char row, column;//行号、列号
    for (i=0; i<4; i++) {
        ser[i] = 0;//S盒处理后的er，32位
    }
    // Byte 1
    row = 0;
    row |= ((er[0] & 0x80) >> 6);
    row |= ((er[0] & 0x04) >> 2);

    column = 0;
    column |= ((er[0] & 0x78) >> 3);

    ser[0] |= ((unsigned char)S[row][column] << 4);

    row = 0;
    row |= (er[0] & 0x02);
    row |= ((er[1] & 0x10) >> 4);

    column = 0;
    column |= ((er[0] & 0x01) << 3);
    column |= ((er[1] & 0xE0) >> 5);

    ser[0] |= (unsigned char)S[row][column];
    // Byte 2
    row = 0;
    row |= ((er[1] & 0x08) >> 2);
    row |= ((er[2] & 0x40) >> 6);

    column = 0;
    column |= ((er[1] & 0x07) << 1);
    column |= ((er[2] & 0x80) >> 7);

    ser[1] |= ((unsigned char)S[row][column] << 4);

    row = 0;
    row |= ((er[2] & 0x20) >> 4);
    row |= (er[2] & 0x01);

    column = 0;
    column |= ((er[2] & 0x1E) >> 1);

    ser[1] |= (unsigned char)S[row][column];

    // Byte 3
    row = 0;
    row |= ((er[3] & 0x80) >> 6);
    row |= ((er[3] & 0x04) >> 2);

    column = 0;
    column |= ((er[3] & 0x78) >> 3);

    ser[2] |= ((unsigned char)S[row][column] << 4);

    row = 0;
    row |= (er[3] & 0x02);
    row |= ((er[4] & 0x10) >> 4);

    column = 0;
    column |= ((er[3] & 0x01) << 3);
    column |= ((er[4] & 0xE0) >> 5);

    ser[2] |= (unsigned char)S[row][column];

    // Byte 4
    row = 0;
    row |= ((er[4] & 0x08) >> 2);
    row |= ((er[5] & 0x40) >> 6);

    column = 0;
    column |= ((er[4] & 0x07) << 1);
    column |= ((er[5] & 0x80) >> 7);

    ser[3] |= ((unsigned char)S[row][column] << 4);

    row = 0;
    row |= ((er[5] & 0x20) >> 4);
    row |= (er[5] & 0x01);

    column = 0;
    column |= ((er[5] & 0x1E) >> 1);

    ser[3] |= (unsigned char)S[row][column];
    //32位ser已经生成，现在将其与32位L组合成为密文即可
    for (i = 0; i < 4; ++i) {
        processed_piece[i+4]=ser[i];//直接复制即可
        processed_piece[i]=l[i];
    }
}
/*一76543210一  排列方式  二76543210二*/
int main()
{
    const char * P="shenlibo";//明文
    const char * K="12345678";//密钥
    unsigned char *processed_block=(unsigned char* )malloc(8*sizeof(char));//密文，不用初始化

    key_set *key_sets=(key_set*)malloc(8*sizeof(char)); ;//定义子密钥,不用初始化

    subkey_generation(K, key_sets);
    process_message(P,processed_block,key_sets);
    //cout<<processed_block<<endl;
    return 0;
}
//
// Created by shenlibo on 22-11-2.
//
