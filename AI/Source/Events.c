#include "GlobalHeader.h"

#define TECH_HEIGHT 100 

#define P1_X    int_to_float(P1_X_INT)
#define P1_Y    int_to_float(P1_Y_INT)
#define P2_X    int_to_float(P2_X_INT)
#define P2_Y    int_to_float(P2_Y_INT)

fl32_t int_to_float(uint32_t num) {

    fl32_t (*itof)(uint32_t) = (void*) INT_TO_FLOAT_FPTR;
    return itof(num);

}

bool Offstage() {
    
    fl32_t (*GetStageLimit)() = (void*) GET_STAGE_LIMIT_FPTR;
    return (ABS(P2_X) - 1000 > GetStageLimit()) || (P2_Y < -1000);

}

bool InHitstun() {

    return int_to_float(HITSTUN_FRAMES) > 0;

}

bool InAir() {

    return IN_AIR;

}

bool Falling() {

    return VERT_VELOCITY > 0xB0000000;

}


bool OnLedge() {

    return ACTION_STATE == 0xFD;

}

bool Respawn() {

    return ACTION_STATE == 0x0D;

}

bool Wait(unsigned int frame) {
 
   return CUR_FRAME >= frame;

}

bool InHitlag() {

    return int_to_float(HITLAG_FRAMES) > 0;

}

bool OnGround() {

    return !IN_AIR;

}

bool HitstunEnd() {

    return (int_to_float(HITSTUN_FRAMES) / 100 == 1) && InAir() && !Offstage();

}

bool DISituation() {

    return int_to_float(HITLAG_FRAMES) / 100 == 2;

}

bool Height(fl32_t);

bool RecoverySituation() {

    return Offstage() &&  !InHitstun() && !OnLedge() && Height(3500);

}

bool NearSurface() {

    fl32_t p2x = ABS(P2_X);
    
    struct Platform (*GetSidePlatform)() = (void*) GET_SIDE_PLATFORM_FPTR;
    struct Platform (*GetTopPlatform)() = (void*) GET_TOP_PLATFORM_FPTR;
    struct Platform side = GetSidePlatform();
    struct Platform top = GetTopPlatform();

    bool x_side_plat = (ABS(P2_X) > side.x_left) && (ABS(P2_X) < side.x_right);
    bool y_side_plat = (P2_Y > side.height) && (P2_Y < side.height + TECH_HEIGHT);

    bool top_plat = (ABS(P2_X) < top.x_right) && (P2_Y > top.height) && (P2_Y < top.height + TECH_HEIGHT);
    bool stage = !Offstage() && (P2_Y < TECH_HEIGHT);

    return (x_side_plat && y_side_plat) || top_plat || stage;

}

bool TechSituation() {
    
    return Falling() && NearSurface() && (InHitstun() || ACTION_STATE == 0x26);

}

bool FallenDown() {

    return ACTION_STATE == 0xB8 || ACTION_STATE == 0xC0;

}

bool FallSpecial() {

    return ACTION_STATE > 0x22 && ACTION_STATE < 0x26;

}

bool Height(fl32_t h) {

    return int_to_float(P2_Y_INT) < h;

}
