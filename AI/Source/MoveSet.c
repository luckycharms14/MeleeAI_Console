#include "GlobalHeader.h"

//inputs entered in reverse order of execution

void HitTech(unsigned int dir) {
    
    void (*AddIQ)(uint32_t, int32_t, uint32_t, int32_t) = (void*) ADD_IQ_FPTR;
    void (*AddEQ)(uint32_t, uint32_t) = (void*) ADD_EQ_FPTR;
    uint32_t frame = CUR_FRAME;

    P2_TECH_WINDOW_PTR[0] = 0;
    P2_TECH_WINDOW_PTR[1] = 0xFF;
    

    AddEQ(IN_HITLAG_FPTR, LOAD_QUEUE_FPTR);
    AddEQ(ON_GROUND_FPTR, LOAD_QUEUE_FPTR);

    AddIQ(WAIT_FPTR, frame + 10, LOAD_QUEUE_FPTR, 0);    
    AddIQ(WAIT_FPTR, frame + 10, RESET_STICK_FPTR, 0);    
    //AddIQ(WAIT_FPTR, frame + 2, RELEASE_FPTR, 0);    
    //AddIQ(WAIT_FPTR, frame, PRESS_FPTR, 'L');    
    AddIQ(WAIT_FPTR, frame, SET_STICK_FPTR, dir);  

}

void InputDI(signed int dir) {

    void (*AddIQ)(uint32_t, int32_t, uint32_t, int32_t) = (void*) ADD_IQ_FPTR;
    uint32_t frame = CUR_FRAME;

    AddIQ(WAIT_FPTR, frame + 4, RESET_STICK_FPTR, 0);    
    AddIQ(WAIT_FPTR, frame + 1, SET_STICK_FPTR, dir);    

}

void LoadRecoveryInterrupts();

void UpB(signed int dir) {

    void (*AddIQ)(uint32_t, int32_t, uint32_t, int32_t) = (void*) ADD_IQ_FPTR;
    void (*AddEQ)(uint32_t, uint32_t) = (void*) ADD_EQ_FPTR;
    uint32_t frame = CUR_FRAME;

    LoadRecoveryInterrupts();
    AddEQ(FALL_SPECIAL_FPTR, LOAD_QUEUE_FPTR);
    
    AddIQ(WAIT_FPTR, frame + 44, RESET_STICK_FPTR, 0);
    AddIQ(WAIT_FPTR, frame + 3, RELEASE_FPTR, 0);
    AddIQ(WAIT_FPTR, frame + 3, SET_STICK_FPTR, dir);
    AddIQ(WAIT_FPTR, frame, SET_STICK_FPTR, 90);
    AddIQ(WAIT_FPTR, frame, PRESS_FPTR, 'B');
    
}

void SideB() {

    void (*AddIQ)(uint32_t, int32_t, uint32_t, int32_t) = (void*) ADD_IQ_FPTR;
    uint32_t frame = CUR_FRAME;

    int32_t dir = 180 - (P2_X_INT > 0xB0000000) * 180;

    LoadRecoveryInterrupts();

    AddIQ(WAIT_FPTR, frame + 3, RESET_STICK_FPTR, 0);
    AddIQ(WAIT_FPTR, frame + 3, RELEASE_FPTR, 0);    
    AddIQ(WAIT_FPTR, frame, SET_STICK_FPTR, dir);    
    AddIQ(WAIT_FPTR, frame, PRESS_FPTR, 'B');    

}

void LedgeDash() {

    void (*AddIQ)(uint32_t, int32_t, uint32_t, int32_t) = (void*) ADD_IQ_FPTR;
    uint32_t frame = CUR_FRAME;

    int32_t ang;
    if (P2_X_INT > 0xB0000000) {
        ang = -30;
    } else {
        ang = -150;
    }
    
    AddIQ(WAIT_FPTR, frame + 20, RESET_STICK_FPTR, 0);
    AddIQ(WAIT_FPTR, frame + 20, RELEASE_FPTR, 0);
    AddIQ(WAIT_FPTR, frame + 7, PRESS_FPTR, 'L');
    AddIQ(WAIT_FPTR, frame + 5, SET_STICK_FPTR, ang);    
    AddIQ(WAIT_FPTR, frame + 5, RELEASE_FPTR, 0);    
    AddIQ(WAIT_FPTR, frame + 3, PRESS_FPTR, 'X');    
    AddIQ(WAIT_FPTR, frame + 1, SET_STICK_FPTR, -90);    

}

void DoubleJump(int32_t dir) {

    void (*AddIQ)(uint32_t, int32_t, uint32_t, int32_t) = (void*) ADD_IQ_FPTR;
    uint32_t frame = CUR_FRAME;

    LoadRecoveryInterrupts();

    AddIQ(WAIT_FPTR, frame + 20, LOAD_QUEUE_FPTR, 0);    
    AddIQ(WAIT_FPTR, frame + 20, RESET_STICK_FPTR, 0);
    AddIQ(WAIT_FPTR, frame + 2, RELEASE_FPTR, 0);    
    AddIQ(WAIT_FPTR, frame, PRESS_FPTR, 'X');    
    AddIQ(WAIT_FPTR, frame, SET_STICK_FPTR, dir);    

}

void LoadRecoveryInterrupts() {

    void (*AddEQ)(uint32_t, uint32_t) = (void*) ADD_EQ_FPTR;

    AddEQ(IN_HITLAG_FPTR, LOAD_QUEUE_FPTR);
    AddEQ(ON_LEDGE_FPTR, LOAD_QUEUE_FPTR);
    AddEQ(RESPAWNING_FPTR, LOAD_QUEUE_FPTR);
    AddEQ(ON_GROUND_FPTR, LOAD_QUEUE_FPTR);

}

void Fade(fl32_t height, int32_t dir) {

    void (*AddIQ)(uint32_t, int32_t, uint32_t, int32_t) = (void*) ADD_IQ_FPTR;
    uint32_t frame = CUR_FRAME;

    LoadRecoveryInterrupts();

    AddIQ(HEIGHT_FPTR, height, SET_STICK_FPTR, dir);    

}



