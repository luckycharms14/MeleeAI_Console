#define FL_MULT_P(a,b,prec)   (((a) * (b)) / prec)
#define FL_DIV_P(a,b,prec)      ((prec * (a)) / (b))

#define FL_MULT(a,b)   (((a) * (b)) / 100)
#define FL_DIV(a,b)      ((100 * (a)) / (b))

typedef int32_t fl32_t;

struct Event {

    uint32_t condition_fptr;
    uint32_t callback_fptr;

};

struct Input {

    uint32_t cond_fptr;
    int32_t cond_arg;
    uint32_t contr_fptr;
    int32_t contr_arg;

};

struct Platform {
    fl32_t x_left;
    fl32_t x_right;
    fl32_t height;
};
