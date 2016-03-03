#include "GlobalHeader.h"

//returns random integer in [1,1000], won't change within one frame
unsigned int RNG() {
    return RANDOM_NUMBER % 100;
}

void Tech() {

    unsigned int rand = RNG();
    signed int dir;

    if (rand < 33) {
        dir = 90;
    } else if (rand < 66) {
        dir = 0;
    } else {
        dir = 180;
    }
    
    void (*HitTech)(signed int) = (void*) HIT_TECH_FPTR;
    HitTech(dir);

}

void DI() {

    signed int prob = 120 - ((P2_PERCENT * P2_PERCENT) / 400) * 7;
    if (prob > 100) {
        prob = 100;
    } else if (prob < 5) {
        prob = 5;
    }

    signed int dir;
    
    fl32_t (*itof)(uint32_t) = (void*) INT_TO_FLOAT_FPTR;
    fl32_t p1x = itof(P1_X_INT);
    fl32_t p2x = itof(P2_X_INT);

    if (RNG() > prob)  {//DI up and in
        if (p1x  < p2x) {
            dir = 135;
        } else {
            dir = 45;
        }
    } else {//DI away
        if (p1x  < p2x) {
            dir = 0;
        } else {
            dir = 180;
        }
    }

    void (*InputDI)(signed int) = (void*) INPUT_DI_FPTR;
    InputDI(dir);

}

void ExitHitstun() {

    void (*Jump)() = (void*) DOUBLE_JUMP_FPTR;
    Jump(180 - (P2_X_INT > 0xB0000000) * 180);

}

void GetOffLedge() {

    void (*LedgeDash)() = (void*) LEDGE_DASH_FPTR;
    LedgeDash();

}

void Recover() {

    void (*FoxRecovery)() = (void*) FOX_RECOVERY_FPTR;
    FoxRecovery();

}

void LoadQueue() {

    void (*AddEQ)(uint32_t, uint32_t) = (void*) ADD_EQ_FPTR;

    EQ_SIZE = 0;

    AddEQ(TECH_SITUATION_FPTR, TECH_FPTR);
    AddEQ(HITSTUN_END_FPTR, EXIT_HITSTUN_FPTR);
    AddEQ(ON_LEDGE_FPTR, GET_OFF_LEDGE_FPTR);
    AddEQ(DI_SITUATION_FPTR, DI_FPTR);
    AddEQ(RESPAWNING_FPTR, DOUBLE_JUMP_FPTR);
    AddEQ(FALLEN_DOWN_FPTR, TECH_FPTR);
    AddEQ(FALL_SPECIAL_FPTR, FADE_AFTER_FIREFOX_FPTR);
    AddEQ(RECOVERY_SITUATION_FPTR, RECOVER_FPTR);

}

