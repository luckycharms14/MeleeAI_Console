#include "GlobalHeader.h"

#define GET_BIT(n,k)            (((n) & (1 << (k))) >> (k))

uint32_t bit_mask(unsigned int a, unsigned int b) {

    uint32_t mask = 0;
    for (unsigned int i=a; i<=b; i++) {
        mask |= 1 << i;
    }
    return mask;

}

//integer base and exponent, returns float 
//can pass in a different precision than 100
fl32_t fl_pow(signed int base, signed int exp, unsigned int prec) {

    fl32_t result = prec;
    fl32_t f_base = base * prec;

    for (int i = 0; i < ABS(exp); i++) {    
        if (exp > 0) {result = FL_MULT_P(result,f_base,prec);}
        else {result = FL_DIV_P(result,f_base,prec);}
    }
    return result;

}

uint32_t float_to_int(fl32_t num) { //used for storing in memory

    uint32_t ret_val = 0;
    if (ABS(num) <= fl_pow(2,-6,100)) {return 0;}

    if (num < 0) {ret_val |= 1 << 31;} //set 31st bit to 1
    
    num = ABS(num);
    int32_t  exp = -6;
    while (fl_pow(2,exp,100) < num) {
        exp++;
    }
    exp--;
    ret_val |= (bit_mask(23,30) & ((exp + 127) << 23));

    //can afford more precision here since we raise to negative powers (this is significant)
    uint32_t frac = FL_DIV((100*num), fl_pow(2,exp,100)) - 10000; //get fractional part
    for (int i = 1; i <= 13; i++) {
        if (frac > fl_pow(2,-i,10000)) {
            frac -= fl_pow(2,-i,10000);
            ret_val |= 1 << (23 - i);
        }
    }
    return ret_val;

}

fl32_t int_to_float(uint32_t num) { //used for reading from memory

    int sign = GET_BIT(num,31); 
    int32_t exp = ((bit_mask(23,30) & num) >> 23) - 127;
    
    //can afford more precision
    uint32_t frac = 10000;
    for (int i = 1; i <= 13; i++) {
        frac += FL_MULT_P(GET_BIT(num,23-i) * 10000, fl_pow(2,-i,10000), 10000);
    }
    
    return (1-2*sign) * FL_MULT(frac / 100, fl_pow(2,exp,100));
    
}