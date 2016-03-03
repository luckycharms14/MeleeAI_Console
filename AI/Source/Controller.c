#include "GlobalHeader.h"

void Press(char button) {

    if (button == 'A') {BUTTONS = 0x00000100;}
    else if (button == 'B') {BUTTONS = 0x00000200;}
    else if (button == 'X') {BUTTONS = 0x00000400;}
    else if (button == 'Z') {BUTTONS = 0x00000010;}
    else {BUTTONS = 0x00000040;} 

}

void Release() {

    BUTTONS = 0;

}

//all degrees between -180 and 180
void SetStick(int32_t ang) {

    fl32_t ang_sin = SIGN(ang) * SIN(ABS(ang));
    fl32_t ang_cos;
    
    if (ABS(ang) <= 90) {
        ang_cos = COS(ABS(ang));
    } else {
        ang_cos = -1 * SIN(ABS(ang) - 90);
    }

    uint32_t (*float_to_int)(fl32_t) = (void*) FLOAT_TO_INT_FPTR;

    STICK_X = float_to_int(ang_cos);
    STICK_Y = float_to_int(ang_sin);

}

void ResetStick() {

    STICK_X = 0;
    STICK_Y = 0;

}

void WriteControllerState() {
    
    uint32_t* p2_contr1 = P2_CONTR1_PTR;
    p2_contr1[0] = BUTTONS;
    p2_contr1[8] = STICK_X;
    p2_contr1[9] = STICK_Y;

    uint32_t* p2_contr2 = P2_CONTR2_PTR;
    p2_contr2[0] = STICK_X;
    p2_contr2[1] = STICK_Y;
    
}

