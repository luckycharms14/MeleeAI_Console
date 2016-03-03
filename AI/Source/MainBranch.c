// Injected from 0x800032E0 - 0x8000332C

#include "GlobalHeader.h"

int _main() {
    
    void (*do_main)() = (void*) DO_MAIN_FPTR;
    do_main();

}