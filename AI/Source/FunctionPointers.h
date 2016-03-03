/** Inject Addresses **/
#define FLOAT_HANDLER_ADDR   0x801910E0
#define CONTROLLER_ADDR        0x8019154C
#define GAME_INFO_ADDR          0x801919E8
#define EVENT_QUEUE_ADDR      0x80191D00
#define INPUT_QUEUE_ADDR      0x80191E88
#define MELEE_AI_ADDR              0x801920B0

#define EVENTS_ADDR                 0x803001DC
#define MOVE_SET_ADDR            0x80300CCC
#define AI_ADDR                         0x80301554

#define FOX_RECOVERY_ADDR    0x803FC420

/** FloatHandler.c **/
#define FLOAT_TO_INT_FPTR       (FLOAT_HANDLER_ADDR + 0x138)
#define INT_TO_FLOAT_FPTR       (FLOAT_HANDLER_ADDR + 0x314)

/** Controller.c **/
#define PRESS_FPTR                                   (CONTROLLER_ADDR)
#define RELEASE_FPTR                                (CONTROLLER_ADDR + 0xC4)
#define SET_STICK_FPTR                             (CONTROLLER_ADDR + 0xF0)
#define RESET_STICK_FPTR                         (CONTROLLER_ADDR + 0x32C)
#define WRITE_CONTROLLER_FPTR               (CONTROLLER_ADDR + 0x368)

/** GameInfo.c **/
#define GET_STAGE_LIMIT_FPTR        (GAME_INFO_ADDR)
#define GET_SIDE_PLATFORM_FPTR   (GAME_INFO_ADDR + 0xB0)
#define GET_TOP_PLATFORM_FPTR    (GAME_INFO_ADDR + 0x1FC)

/** EventQueue.c **/
#define ADD_EQ_FPTR        (EVENT_QUEUE_ADDR)
#define CHECK_EQ_FPTR    (EVENT_QUEUE_ADDR + 0x78)

/** InputQueue.c **/
#define ADD_IQ_FPTR         (INPUT_QUEUE_ADDR)
#define CHECK_IQ_FPTR     (INPUT_QUEUE_ADDR + 0x15C)

/** MeleeAI.c **/
#define DO_MAIN_FPTR (MELEE_AI_ADDR)

/** Events.c **/
#define IN_HITSTUN_FPTR                    (EVENTS_ADDR + 0x144)
#define ON_LEDGE_FPTR                      (EVENTS_ADDR + 0x234)
#define RESPAWNING_FPTR                  (EVENTS_ADDR + 0x278)
#define WAIT_FPTR                               (EVENTS_ADDR + 0x2BC)
#define IN_HITLAG_FPTR                      (EVENTS_ADDR + 0x304)
#define ON_GROUND_FPTR                   (EVENTS_ADDR + 0x364)
#define HITSTUN_END_FPTR                  (EVENTS_ADDR + 0x3A8)
#define DI_SITUATION_FPTR                 (EVENTS_ADDR + 0x440)
#define RECOVERY_SITUATION_FPTR    (EVENTS_ADDR + 0x4A8)
#define TECH_SITUATION_FPTR            (EVENTS_ADDR + 0x8D4)
#define FALLEN_DOWN_FPTR                 (EVENTS_ADDR + 0x964)
#define FALL_SPECIAL_FPTR                  (EVENTS_ADDR + 0x9D0)
#define HEIGHT_FPTR                            (EVENTS_ADDR + 0xA3C)

/** MoveSet.c **/
#define HIT_TECH_FPTR           (MOVE_SET_ADDR)
#define INPUT_DI_FPTR            (MOVE_SET_ADDR + 0x14C)
#define UP_B_FPTR                   (MOVE_SET_ADDR + 0x1F8)
#define SIDE_B_FPTR               (MOVE_SET_ADDR  + 0x350)
#define LEDGE_DASH_FPTR      (MOVE_SET_ADDR + 0x474)
#define DOUBLE_JUMP_FPTR     (MOVE_SET_ADDR + 0x638)
#define FADE_FPTR                   (MOVE_SET_ADDR + 0x810)

/** AI.c **/
#define RNG_FPTR                      (AI_ADDR)
#define TECH_FPTR                     (AI_ADDR + 0x44)
#define DI_FPTR                         (AI_ADDR + 0xCC)
#define EXIT_HITSTUN_FPTR       (AI_ADDR + 0x22C) 
#define GET_OFF_LEDGE_FPTR    (AI_ADDR + 0x29C) 
#define RECOVER_FPTR              (AI_ADDR + 0x2E0)
#define LOAD_QUEUE_FPTR         (AI_ADDR + 0x324) 

/** FoxRecovery.c **/
#define FADE_AFTER_FIREFOX_FPTR     (FOX_RECOVERY_ADDR)
#define FOX_RECOVERY_FPTR              (FOX_RECOVERY_ADDR + 0x118)

