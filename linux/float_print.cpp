#include<stdio.h>

int main(void){
    float flotaari = 2.345;
    char bufferi [100];
    snprintf(bufferi, 100, "Liukuluku: %f", flotaari);
    printf("Testiarvo: %s", bufferi);
    return 0;
}