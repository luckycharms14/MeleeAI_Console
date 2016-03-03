#define MAKE_PTR(x) ((uint32_t*) (x))
#define DREF_PTR(x) (*MAKE_PTR(x))

/** Game Data **/

#define RANDOM_NUMBER    DREF_PTR(0x804D5F90)

#define STAGE_ID                        (DREF_PTR(0x804D6CAC) >> 8)
#define CUR_FRAME                     DREF_PTR(0x80479D60)
#define IN_GAME                         (((DREF_PTR(0x8065CC14) >> 20) & 0x0F) == 0x0D)

#define IN_AIR                      DREF_PTR(DREF_PTR(0x80453FC0) + 0x140)
#define JUMPS_USED            (DREF_PTR(DREF_PTR(0x80453FC0) + 0x19C8) >> 24)
#define ACTION_STATE         DREF_PTR(DREF_PTR(0x80453FC0) + 0x70) 

#define HITSTUN_FRAMES    DREF_PTR(DREF_PTR(0x80453FC0) + 0x23A0)
#define HITLAG_FRAMES      DREF_PTR(DREF_PTR(0x80453FC0) + 0x19BC)
#define SHIELD_SIZE           DREF_PTR(DREF_PTR(0x80453FC0) + 0x19F8))
#define VERT_VELOCITY       DREF_PTR(DREF_PTR(0x80453FC0) + 0x12C)

#define P1_X_INT    DREF_PTR(0x80453090)
#define P1_Y_INT    DREF_PTR(0x80453094)
#define P2_X_INT    DREF_PTR(0x80453F20)
#define P2_Y_INT    DREF_PTR(0x80453F24)

#define P1_STOCKS        DREF_PTR(0x8045310E)
#define P2_STOCKS        DREF_PTR(0x80453F9E)
#define P1_PERCENT       DREF_PTR(0x804530E0)
#define P2_PERCENT       (DREF_PTR(0x80453F70) >> 16)
#define P1_CHAR            DREF_PTR(0x803F0E08)
#define P2_CHAR            DREF_PTR(0x803F0E2C)

#define P2_TECH_WINDOW_PTR    ((uint8_t*)(DREF_PTR(0x80453FC0) + 0x6E0))

/** Controller Data **/

#define P2_CONTR1_PTR     MAKE_PTR(0x804C1FF0)
#define P2_CONTR2_PTR     MAKE_PTR(DREF_PTR(0x80453FC0) + 0x680)

#define BUTTONS      DREF_PTR(0x80003FF0)
#define STICK_X       DREF_PTR(0x80003FF4)
#define STICK_Y       DREF_PTR(0x80003FF8)

/** Heap **/
#define IQ_PTR                ((struct Input*) 0x80001B04)
#define IQ_SIZE               DREF_PTR(0x80001B00)
#define EQ_PTR                ((struct Event*) 0x80001804)
#define EQ_SIZE              DREF_PTR(0x80001800)
#define INIT_KEY              DREF_PTR(0x80001BA4)
#define AI_ON                  DREF_PTR(0x80001BA8)
#define P2_TYPE               DREF_PTR(0x80453F18)
#define SIDE_PLAT_PTR    ((struct Platform*) 0x80001BAC)
#define TOP_PLAT_PTR     ((struct Platform*) 0x80001BB8)



