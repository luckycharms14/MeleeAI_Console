#include "GlobalHeader.h"

void IQ_AddInput(uint32_t f1, int32_t f1_arg, uint32_t f2, int32_t f2_arg) {

    struct Input* queue = IQ_PTR;
    queue[IQ_SIZE].cond_fptr = f1;
    queue[IQ_SIZE].cond_arg = f1_arg;
    queue[IQ_SIZE].contr_fptr = f2;
    queue[IQ_SIZE++].contr_arg = f2_arg;

}

bool CheckCondition() {

    struct Input* queue = IQ_PTR;
    bool (*Condition)(int32_t) = (void*) queue[IQ_SIZE - 1].cond_fptr;
    return Condition(queue[IQ_SIZE - 1 ].cond_arg);

}

void IQ_CheckQueue() {

    if (IQ_SIZE > 0) {
        
        //CheckForInterupt();
        struct Input* queue = IQ_PTR;

        while (IQ_SIZE > 0 && CheckCondition()) {
            void (*Controller)(int32_t) = (void*) queue[--IQ_SIZE].contr_fptr;
            Controller(queue[IQ_SIZE].contr_arg);
        }

    }

}
