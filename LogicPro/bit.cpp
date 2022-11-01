//
// Created by shenlibo on 22-11-1.
//
/*bit.c  位操作的实现*/

/*bit_get  获取缓冲区bits中处于pos位的状态*/
int bit_get(const unsigned char *bits, int pos)
{
    unsigned char  mask;
    int            i;

    /*设置掩码*/
    mask = 0x80;
    for(i=0; i<(pos % 8); i++)
        mask = mask >> 1;
    /*用位与运算获取对应的位*/
    return (((mask & bits[(int)(pos / 8)]) == mask)? 1:0);
}
/*bit_set  设置缓冲区bits中位于pos位的状态*/
void bit_set(unsigned char *bits, int pos, int state)
{
    unsigned char mask;
    int           i;

    /*设置掩码*/
    mask = 0x80;
    for(i=0; i<(pos % 8); i++)
        mask=mask>>1;

    /*依据state设置位*/
    if(state)
        bits[pos/8] = bits[pos/8] | mask;
    else
        bits[pos/8] = bits[pos/8] & (~mask);

    return;
}
/*bit_xor  按位异或运算*/
void bit_Xor(const unsigned char *bits1,const unsigned char *bits2,unsigned char *bitsx,int size)
{
    int i;
    /*计算两个缓冲区的按位异或*/
    for(i=0;i<size;i++)
    {
        if(bit_get(bits1,i) != bit_get(bits2,i))
            bit_set(bitsx,i,1);
        else
            bit_set(bitsx,i,0);
    }
    return;
}
/*bit_rot_left 轮转缓冲区bits(含size位)，将位值向左移count位*/
void bit_rot_left(unsigned char *bits,int size,int count)
{
    int  fbit,lbit,i,j;

    /*将缓冲区向左轮转指定位数*/
    if(size > 0)
    {
        for(j=0; j<count; j++)
        {
            for(i=0; i<=((size-1)/8); i++)
            {
                /*获得要从当前字节偏移的位*/
                lbit = bit_get(&bits[i],0);
                if(i==0)
                {
                    /*保存要从首字节移动到后面的位*/
                    fbit = lbit;
                }
                else
                {
                    /*将前一字节最右边的位设置为当前字节最左边的位*/
                    bit_set(&bits[i-1],7,lbit);
                }

                /*将当前字节向左移动*/
                bits[i] = bits[i] << 1;
            }
            /*将缓冲区最右边的位设置为从第一个字节偏移的位*/
            bit_set(bits,size-1,fbit);
        }
    }
    return;
}