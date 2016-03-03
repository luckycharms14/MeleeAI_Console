#define ABS(x)      ((x)<0 ? -(x) : (x))
#define SIGN(x)    (((x) >= 0) - (x < 0))

#define SIN(x)     ((100 * (4 * (x) * (180 - (x)))) / (40500 - (x) * (180 - (x))))
#define COS(x)    SIN(((x)+90))
