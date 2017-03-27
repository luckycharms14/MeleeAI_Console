#include <mml/state_check.h>
#include <mml/ai.h>
#include <mml/moves.h>
#include <mml/action_state.h>
#include <mml/game_state.h>
#include <mml/math.h>
#include <mml/random.h>

#include "DI.h"
#include "cpuLogic.h"

#define SAKURAI_ANGLE 0x0169

static float getKnockBackAngle(u32 port)
{
    u32 rawAngle = _gameState.playerData[port]->knockbackAngle;
    float direction = _gameState.playerData[port]->damageDirection;

    if (rawAngle == SAKURAI_ANGLE) {rawAngle = 45;}

    return (float) rawAngle - (1.f + direction) * 90.f;
}

#define AI_X     (_gameState.playerData[player->port]->coordinates.x)
#define OPP_X    (_gameState.playerData[player->opponent]->coordinates.x)
static float getComboDI(AI* player, float knockback)
{
    return AI_X < OPP_X ? 225.f : 315.f;
}

static float getSurvivalDI(AI* player, float knockback)
{
    return AI_X < OPP_X ? 45.f : 135.f;
}

void hitDI(AI* player)
{
    float knockback = getKnockBackAngle(player->port);
    float percent = _gameState.playerData[player->port]->percent;

    float comboProb = 120.f - (percent * percent / 400.f) * 7.f;
    comboProb = fmin(comboProb, 100.f);
    comboProb = fmax(comboProb, 10.f) / 100.f;

    SET_HIT_DI_DIR(chance(comboProb) ? 
        getComboDI(player, knockback) : getSurvivalDI(player, knockback));

    addMove(player, &_mv_hitDI);
}

void throwDI(AI* player)
{
    SET_THROW_DI_DIR(chance(0.5f) ? 0.f : 180.f);        
    addMove(player, &_mv_throwDI);
    addLogic(player, &stopThrowDiLogic);
}

void stopThrowDI(AI* player)
{
    resetAfterFrameLogic.condition.arg1.u = CURRENT_FRAME + 10;
    addLogic(player, &resetAfterFrameLogic);
}

