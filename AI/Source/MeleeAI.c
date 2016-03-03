#include "GlobalHeader.h"

void do_main() {

    //Initialize values
    if (INIT_KEY != 0x00C589EF) {
        INIT_KEY = 0x00C589EF;
        AI_ON = 0;
    }

    //toggle AI to run when game is entered with CPU P2
    if (AI_ON && !IN_GAME) {
        AI_ON = 0;
        P2_TYPE = 0x01;
    } else if (!AI_ON && IN_GAME && P2_TYPE == 0x01) {
        AI_ON = 1;
        IQ_SIZE = 0;
        EQ_SIZE = 0;
        P2_TYPE = 0x00;
    }

    if (IN_GAME && AI_ON) {

       if (EQ_SIZE > 0) {
            void (*CheckEQ)() = (void*) CHECK_EQ_FPTR;
            CheckEQ();
        }
        if (IQ_SIZE > 0) { 
            void (*CheckIQ)() = (void*) CHECK_IQ_FPTR;
            CheckIQ();
        }
        if (EQ_SIZE == 0 && IQ_SIZE == 0) {
            void (*LoadQueue)() = (void*) LOAD_QUEUE_FPTR;
            LoadQueue();
        }
        
        void (*WriteController)() = (void*) WRITE_CONTROLLER_FPTR;
        WriteController();

    }

}

