#include "GlobalHeader.h"

void EQ_AddEvent(uint32_t condition, uint32_t callback) {

    struct Event* queue = EQ_PTR;
    queue[EQ_SIZE].condition_fptr = condition;
    queue[EQ_SIZE++].callback_fptr = callback;

}

void EQ_CheckQueue() {

    struct Event* queue = EQ_PTR;

    for (unsigned int i = 0; i < EQ_SIZE; i++) {

        bool (*Condition)() = (void*) queue[i].condition_fptr;
        
        if (Condition()) {

            void (*ResetStick)() = (void*) RESET_STICK_FPTR;
            void (*Release)() = (void*) RELEASE_FPTR;
            ResetStick();
            Release();
            IQ_SIZE = 0;

            EQ_SIZE = 0;
            void (*Callback)() = (void*) queue[i].callback_fptr;
            Callback();
            break;

        }    

    }

}
