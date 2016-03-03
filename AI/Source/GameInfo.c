#include "GlobalHeader.h"

/**
Yoshi's - 0x06
Fountain of Dreams - 0x08
Pokemon Stadium - 0x12
Battlefield - 0x18
Final Destination - 0x19
Dreamland - 0x1A
*/

fl32_t GetStageLimit() {

    unsigned int id = STAGE_ID;
    if (id == 0x06) {return 5792;} 
    else if (id == 0x08) {return 6523;} 
    else if (id == 0x12) {return 8967;} 
    else if (id == 0x18) {return 7032;} 
    else if (id == 0x19) {return 8802;} 
    else if (id == 0x1A) {return 7972;} 
    else {return 0;} //error, this should cause weird behavior, alerting user to error

}

struct Platform GetSidePlatform() {
 
    unsigned int id = STAGE_ID;
    struct Platform ret_val;

    if (id == 0x06) { 
        ret_val.x_left = 2800; 
        ret_val.x_right = 5950;
        ret_val.height = 2345;
    } else if (id == 0x08) { 
        ret_val.x_left = 0; 
        ret_val.x_right = 6523;
        ret_val.height = 0; 
    } else if (id == 0x12) {
        ret_val.x_left = 2500; 
        ret_val.x_right = 5500;
        ret_val.height = 2500; 
    } else if (id == 0x18) {
        ret_val.x_left = 2000; 
        ret_val.x_right = 5760;
        ret_val.height = 2720;
    } else if (id == 0x19) {
        ret_val.x_left = 0;
        ret_val.x_right = 8802;
        ret_val.height = 0;
    } else if (id == 0x1A) {
        ret_val.x_left = 3173;
        ret_val.x_right = 6139;
        ret_val.height = 3014;
    } else {
        ret_val.x_right = 0; //error behavior
    }
    return ret_val;

}

struct Platform GetTopPlatform() {

    unsigned int id = STAGE_ID;
    struct Platform ret_val;

    if (id == 0x06) { 
        ret_val.x_right = 1575;
        ret_val.height = 4200;
    } else if (id == 0x08) { 
        ret_val.x_right = 1425;
        ret_val.height = 4275;
    } else if (id == 0x12) {
        ret_val.x_right = 8967;
        ret_val.height = 0; 
    } else if (id == 0x18) {
        ret_val.x_right = 1880;
        ret_val.height = 5440;
    } else if (id == 0x19) {
        ret_val.x_right = 8802;
        ret_val.height = 0;
    } else if (id == 0x1A) {
        ret_val.x_right = 1902;
        ret_val.height = 5143;
    } else {
        ret_val.x_right = 0; //error behavior
    }
    return ret_val;

}



