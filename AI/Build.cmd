@echo OFF
setlocal ENABLEDELAYEDEXPANSION

IF "%1"=="" (

    echo FloatHandler     801910e0>>file_list.txt    REM 283
    echo Controller         8019154c>>file_list.txt    REM 295
    echo GameInfo         801919e8>>file_list.txt    REM 198
    echo EventQueue      80191d00>>file_list.txt     REM 98
    echo InputQueue      80191e88>>file_list.txt    REM 138
    echo MeleeAI            801920B0>>file_list.txt     REM 150
    
    echo Events              803001dc>>file_list.txt    REM 700
    echo MoveSet           80300ccc>>file_list.txt    REM 546
    echo AI                    80301554>>file_list.txt    REM 500

    echo FoxRecovery     803fc420>>file_list.txt   REM 900
            
    for /F "tokens=1,2" %%A in (file_list.txt) do (
        call:buildRawCode %%A
        call:buildInjectionCode %%A %%B
        del "Codes\%%A_RAW.txt"
    )
                       
    call:buildRawCode MainBranch
    call:buildBranchCode MainBranch 80377998 7ee3bb78 REM still need to insert ASM at end of code
    del "Codes\MainBranch_RAW.txt"

    del "..\MCM\MCM\Mods Library\MeleeAI_Codes.txt"
    type Codes\DefaultCodes.txt>>"..\MCM\MCM\Mods Library\MeleeAI_Codes.txt"
    for /F "tokens=1,2" %%A in (file_list.txt) do (
        type Codes\%%A.txt>>"..\MCM\MCM\Mods Library\MeleeAI_Codes.txt"
    )
    del "file_list.txt"
    goto:eof
)

REM function to build the raw machine code
:buildRawCode
    
    REM get file name and clear previous version
    set file_name=%~1
    if exist "Codes\!file_name!_RAW.txt" del "Codes\!file_name!_RAW.txt"
    
    REM compile controller code to assembly
    powerpc-eabi-gcc -S -std=c99 Source\!file_name!.c -o Assembly\!file_name!.s	

    REM assemble to machine code
    cd pyiiasmh
    pyiiasmh_cli.py -a ..\Assembly\!file_name!.s>>..\Codes\!file_name!_temp_1.txt
    cd ..

    REM convert to single column
    for /F "tokens=1,2" %%A in (Codes\!file_name!_temp_1.txt) do (
        echo %%A>>Codes\!file_name!_temp_2.txt
        if NOT "%%B"=="" echo %%B>>Codes\!file_name!_temp_2.txt
    )
    del "Codes\!file_name!_temp_1.txt"
    
    REM count number of lines
    FINDSTR /R /N "^.*$" Codes\!file_name!_temp_2.txt | FIND /C ":">>x.txt
    set /p num_lines=<x.txt
    del x.txt
    echo !file_name! !num_lines!

    REM convert text file to 8 columns
    set count=0
    for /F %%A in (Codes\!file_name!_temp_2.txt) do (
        IF NOT !count!==0 set data=!data! %%A
        IF !count!==0 set data=%%A
        set /A count=!count!+1
        IF !count!==8 (
            set count=0
            echo !data!>>Codes\!file_name!_RAW.txt
        )
    )
    if not !count!==0 echo !data!>>Codes\!file_name!_RAW.txt
    del "Codes\!file_name!_temp_2.txt"
                  
    goto:eof

REM function to build code for injection
:buildInjectionCode
    
    REM get file name and injection point, clear previous version
    set file_name=%~1
    set inject_addr=%~2
    if exist "Codes\!file_name!.txt" del "Codes\!file_name!.txt"
    
    REM write code header
    echo !file_name!>>Codes\!file_name!.txt
    echo [luckycharms14]>>Codes\!file_name!.txt
    echo 1.02 ----- 0x!inject_addr! --->>Codes\!file_name!.txt
    echo.>>Codes\!file_name!.txt
    
    REM find which section of code to inject to
    if !inject_addr! LSS 803001dc (
        set replaced_code=801910e0.txt
    
    ) else if !inject_addr! LSS 803fa3e8 (
        set replaced_code=803001dc.txt

    ) else if !inject_addr! LSS 803fc420 (
        set replaced_code=803fa3e8.txt

    ) else (
        set replaced_code=803fc420.txt

    )

    REM write replaced code section
    set count=0
    set line_count=0
    for /F "tokens=1,2 delims=-" %%A in (MeleeCode\!replaced_code!) do (
        if %%A GEQ !inject_addr! (
        if !line_count! LSS !num_lines! (
            IF NOT !count!==0 set data=!data! %%B
            IF !count!==0 set data=%%B
            set /A count=!count!+1
            IF !count!==8 (
                set count=0
                echo !data!>>Codes\!file_name!.txt
            )
            set /A line_count=!line_count!+1
        )
        )
    )
    if not !count!==0 echo !data!>>Codes\!file_name!.txt
    echo.>>Codes\!file_name!.txt
    echo -^>^ >>Codes\!file_name!.txt
    echo.>>Codes\!file_name!.txt
    type Codes\!file_name!_RAW.txt>>Codes\!file_name!.txt
    echo.>>Codes\!file_name!.txt
    echo     -==->>Codes\!file_name!.txt
    echo.>>Codes\!file_name!.txt
    
    goto:eof
    
REM function to build the code for a branch
:buildBranchCode

    REM get file name and injection point, clear previous version
    set file_name=%~1
    set inject_addr=%~2
    set orig_code=%~3
    if exist "Codes\!file_name!.txt" del "Codes\!file_name!.txt"

    REM write code header
    echo !file_name!>>Codes\!file_name!.txt
    echo [luckycharms14]>>Codes\!file_name!.txt
    echo 1.02 ----- 0x!inject_addr! ---- !orig_code! -^>^ Branch>>Codes\!file_name!.txt
    echo.>>Codes\!file_name!.txt

    type Codes\!file_name!_RAW.txt>>Codes\!file_name!.txt
    echo.>>Codes\!file_name!.txt
    echo     -==->>Codes\!file_name!.txt
    echo.>>Codes\!file_name!.txt
    
    goto:eof
