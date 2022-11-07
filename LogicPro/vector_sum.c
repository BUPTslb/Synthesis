//
// Created by shenlibo on 22-11-3.
//
#include <malloc.h>
#include <stdio.h>
#include <stdlib.h>
void vector_sum(int length,float *in1,float *in2,float *out)
{
    for (int i = 0; i < length; ++i) {
        out[i] =in1[i] + in2[i];}

}
int main(int argc, char * argv[])
{
    if(argc!=2) return 1;
    int length = atoi(argv[1]);
    float *in1=(float *) malloc(length * sizeof (float ));
    float *in2=(float *) malloc(length * sizeof (float ));
    float *out=(float *) malloc(length * sizeof (float ));
    for (int i = 0; i < length; ++i) {
        in1[i]=drand48();
        in2[i]=drand48();
    }
    vector_sum(length,in1,in2,out);
    printf("%f\n",out[length-1]);
    return 0;
}