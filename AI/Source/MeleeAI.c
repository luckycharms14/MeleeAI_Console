static int8_t active = 0;

void _main(void)
{
    /* toggle AI to run when game is entered with CPU P2 */
    if (!active && IN_GAME && P2_TYPE == 0x01)
    {
        active = 1;
        P2_TYPE = 0x00;
    }
    if (active && !IN_GAME)
    {
        active = 0;
        P2_TYPE = 0x01;
    }
  
    if (IN_GAME && active) {



    }

}

