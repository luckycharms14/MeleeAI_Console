#include <mml/ai.h>
#include <mml/system.h>
#include <mml/gctypes.h>

#include "cpuLogic.h"

static bool init_run = false;

void boot()
{
    limitGameMemory((void*) 0x81780000);
}

static void init()
{
    initHeap((void*) 0x81780000, (void*) 0x817f8ab0);
    init_run = true;
}

static void loadDefaultLogic()
{
    addLogic(&cpuPlayer, &respawnLogic);
    addLogic(&cpuPlayer, &hitTechLogic);
    addLogic(&cpuPlayer, &getOffGroundLogic);
    addLogic(&cpuPlayer, &hitDiLogic);
    addLogic(&cpuPlayer, &throwDiLogic);
    addLogic(&cpuPlayer, &recoveryLogic);
    addLogic(&cpuPlayer, &onLedgeLogic);
    addLogic(&cpuPlayer, &exitHitstunLogic);
}

void _main()
{
    if (!init_run) {init();}

    if (needLogic(&cpuPlayer)) {loadDefaultLogic();}

    updateAI(&cpuPlayer);
}



