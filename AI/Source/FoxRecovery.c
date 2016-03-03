#include "GlobalHeader.h"

#define FADE_ANGLE            80
#define TAN_FADE_ANGLE     567
#define CONSTANT               576                        
#define FIREFOX_DIST          8800
#define FIREFOX_PROB         65

int32_t ReflectAngle(int32_t);
int32_t LedgeAngle(fl32_t, fl32_t);
int32_t HighestAngle(fl32_t, fl32_t);
int32_t GetFadeDirection();
void Firefox(fl32_t, fl32_t);
void Illusion(fl32_t, fl32_t);

void FadeAfterFirefox() {
    
    fl32_t (*itof)(uint32_t) = (void*) INT_TO_FLOAT_FPTR;
    fl32_t (*stage_lim)() = (void*) GET_STAGE_LIMIT_FPTR;

    int32_t height = FL_MULT(TAN_FADE_ANGLE, ABS(itof(P2_X_INT)) - stage_lim());

    void (*Fade)(fl32_t, int32_t) = (void*) FADE_FPTR;

    Fade(height, GetFadeDirection());

}

void Recover() {

    fl32_t (*itof)(uint32_t) = (void*) INT_TO_FLOAT_FPTR;
    fl32_t p2x = itof(P2_X_INT);
    fl32_t p2y = itof(P2_Y_INT);
    
    unsigned int (*rng)() = (void*) RNG_FPTR;

    if (rng() < FIREFOX_PROB) {
        Firefox(p2x, p2y);
    } else {
        Illusion(p2x,p2y);
    }

}

int32_t GetFadeDirection() {

    fl32_t (*itof)(uint32_t) = (void*) INT_TO_FLOAT_FPTR;
    fl32_t (*stage_lim)() = (void*) GET_STAGE_LIMIT_FPTR;

    fl32_t p2x = itof(P2_X_INT);
    fl32_t lim = stage_lim();

    if (p2x < 0) {
        if (-p2x > lim) {
            return 0;
        }
    } else {
        if (p2x < lim) {
            return 0;
        }
    }
    
    return 180;

}

//reflect angle if on the right side
int32_t ReflectAngle(int32_t ang) {

    if (P2_X_INT < 0xB0000000) {
        return SIGN(ang) * (180 - ABS(ang));
    } else {
        return ang;
    }

}

//angle calculated from left side
//alternative input for controller set stick?? would allow for
//no approzmation of trig functions
int32_t LedgeAngle(fl32_t p2x, fl32_t p2y) {

    fl32_t (*stage_lim)() = (void*) GET_STAGE_LIMIT_FPTR;

    fl32_t x = ABS(p2x) - stage_lim();
    fl32_t y = ABS(p2y);
    fl32_t x2 = FL_MULT(x,x);
    fl32_t y2 = FL_MULT(y,y);
    fl32_t xy = FL_MULT(x,y);


    uint32_t arctan;
    if (y > x) {
        arctan = FL_DIV(xy, y2 + (9 * x2) / 32);
        arctan = 157 - arctan;
    } else {
        arctan = FL_DIV(xy, x2 + (9 * y2) / 32);
    }

    arctan *= 5730;
    arctan /= 10000;

    if (p2y > 0) {
        return arctan *= -1;
    }
    
    if (arctan > -73) {
        arctan = -73;
    } else if (arctan > 0 && arctan < 17) {
        arctan = 17;
    }
    return arctan;

}

fl32_t m_sqrt(fl32_t num) {

    fl32_t ret_val = 50;

    for (int i = 0; i < 3; i++) {
        ret_val = FL_MULT(50, ret_val + FL_DIV(num, ret_val));
    }
    return ret_val;

}

//takes number between 0 and 1 (0 and 100)
int32_t arc_cos(fl32_t num) {

    if (num > 70) {
        return (5730 * 141 * m_sqrt(100 - num)) / 1000000;
    } else {
        return 90 - ((5730 * (num + (num*num*num) / 60000)) / 10000);
    }

}

int32_t HighestAngle(fl32_t p2x, fl32_t p2y) {

    fl32_t (*stage_lim)() = (void*) GET_STAGE_LIMIT_FPTR;

    fl32_t x = stage_lim() - ABS(p2x);
    
    fl32_t NUMER = FL_DIV(ABS(FL_MULT(TAN_FADE_ANGLE, x) + p2y), CONSTANT);

    int32_t arccos = arc_cos(FL_DIV(NUMER, FIREFOX_DIST));

    arccos = 90 - FADE_ANGLE + arccos;
    
    if (arccos > 90) {
        arccos = 90;
    } else if (arccos > 73) {
        arccos = 73;
    }
    
    return arccos;

}

fl32_t LedgeDistance2(fl32_t p2x, fl32_t p2y) {

    fl32_t (*stage_lim)() = (void*) GET_STAGE_LIMIT_FPTR;
    fl32_t x = ABS(p2x) - stage_lim();

    return FL_MULT(x,x) + FL_MULT(p2y,p2y);

}

void Firefox(fl32_t p2x, fl32_t p2y) {

    unsigned int (*rng)() = (void*) RNG_FPTR;
    unsigned int rnd = rng() % 10; //get a random number independent of original
    
    unsigned int jumps_used = JUMPS_USED;
    int32_t ledge_ang = LedgeAngle(p2x, p2y);
    int32_t highest_ang = HighestAngle(p2x, p2y);
    int32_t angle;

    if (jumps_used < 2) {
        void (*Jump)() = (void*) DOUBLE_JUMP_FPTR;
        Jump(180 - (p2x < 0) * 180);
    } else {
        if (LedgeDistance2(p2x, p2y) > 774400) {
            angle = 45;
        } else if (ledge_ang < 0) {
            if (rnd < 6) {
                angle = ledge_ang;
            } else {
                angle  = ledge_ang + (rnd - 5) * 9;
            }
        } else if (p2y < -5000) {
            angle = highest_ang;
        } else {
            angle = ledge_ang + (highest_ang - ledge_ang) / rnd;
        }
        void (*UpB)(int32_t) = (void*) UP_B_FPTR;
        UpB(ReflectAngle(angle));
    }
    
}

void Illusion(fl32_t p2x, fl32_t p2y) {

    unsigned int jumps_used = JUMPS_USED;
    unsigned int (*rng)() = (void*) RNG_FPTR;
    unsigned int rnd = rng() % 10; //get a random number independent of original
    void (*Jump)() = (void*) DOUBLE_JUMP_FPTR;
    fl32_t (*stage_lim)() = (void*) GET_STAGE_LIMIT_FPTR;

    if (p2y < -5500 || (p2y < -1200 && jumps_used > 1)) {
        Firefox(p2x, p2y);
    } else if ((p2y < -1200 || ABS(p2x) - stage_lim() > 8800) && jumps_used < 2) {
        int32_t dir = 180 - (p2x < 0) * 180;
        Jump(90 - (90 - dir) * (ABS(p2x) - stage_lim() > 7500));
    } else if (jumps_used < 2 && rnd > 7) {
        Jump(90);
    } else {   
        int32_t height = -500; //ledge
        if (rnd < 3) {
            struct Platform (*GetSidePlatform)() = (void*) GET_SIDE_PLATFORM_FPTR;            
            height = GetSidePlatform().height;
        }
        void (*AddIQ)(uint32_t, int32_t, uint32_t, int32_t) = (void*) ADD_IQ_FPTR;
        AddIQ(HEIGHT_FPTR, height, SIDE_B_FPTR, 0);    
    }

}


