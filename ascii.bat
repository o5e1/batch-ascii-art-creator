@echo off
setlocal EnableDelayedExpansion

rem List all folders in the current directory
echo Available folders:
set "folderCount=0"
for /d %%F in (*) do (
    set /a folderCount+=1
    echo !folderCount!: %%F
    set "folder[!folderCount!]=%%F"
)

rem Prompt user to select a folder
set /p "folderIndex=Select a folder by number: "
if not defined folder[%folderIndex%] (
    echo Invalid selection.
    goto :EOF
)

set "selectedFolder=!folder[%folderIndex%]!"

rem Define the file names corresponding to each letter in the selected folder
for %%L in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do (
    set "%%L_file=%selectedFolder%\%%L.txt"
)

:loop
set /p input="Type a letter: "

rem Convert input to lowercase
set "input=%input:~0,1%"
set "input=%input:A=a%"
set "input=%input:B=b%"
set "input=%input:C=c%"
set "input=%input:D=d%"
set "input=%input:E=e%"
set "input=%input:F=f%"
set "input=%input:G=g%"
set "input=%input:H=h%"
set "input=%input:I=i%"
set "input=%input:J=j%"
set "input=%input:K=k%"
set "input=%input:L=l%"
set "input=%input:M=m%"
set "input=%input:N=n%"
set "input=%input:O=o%"
set "input=%input:P=p%"
set "input=%input:Q=q%"
set "input=%input:R=r%"
set "input=%input:S=s%"
set "input=%input:T=t%"
set "input=%input:U=u%"
set "input=%input:V=v%"
set "input=%input:W=w%"
set "input=%input:X=x%"
set "input=%input:Y=y%"
set "input=%input:Z=z%"

rem Determine the file to read based on input
set "file="
if "%input%"=="a" set "file=%a_file%"
if "%input%"=="b" set "file=%b_file%"
if "%input%"=="c" set "file=%c_file%"
if "%input%"=="d" set "file=%d_file%"
if "%input%"=="e" set "file=%e_file%"
if "%input%"=="f" set "file=%f_file%"
if "%input%"=="g" set "file=%g_file%"
if "%input%"=="h" set "file=%h_file%"
if "%input%"=="i" set "file=%i_file%"
if "%input%"=="j" set "file=%j_file%"
if "%input%"=="k" set "file=%k_file%"
if "%input%"=="l" set "file=%l_file%"
if "%input%"=="m" set "file=%m_file%"
if "%input%"=="n" set "file=%n_file%"
if "%input%"=="o" set "file=%o_file%"
if "%input%"=="p" set "file=%p_file%"
if "%input%"=="q" set "file=%q_file%"
if "%input%"=="r" set "file=%r_file%"
if "%input%"=="s" set "file=%s_file%"
if "%input%"=="t" set "file=%t_file%"
if "%input%"=="u" set "file=%u_file%"
if "%input%"=="v" set "file=%v_file%"
if "%input%"=="w" set "file=%w_file%"
if "%input%"=="x" set "file=%x_file%"
if "%input%"=="y" set "file=%y_file%"
if "%input%"=="z" set "file=%z_file%"

rem Check if the file exists and output its contents
if defined file (
    if exist "%file%" (
        echo Response:
        for /f "usebackq delims=" %%i in ("%file%") do (
            set "line=%%i"
            if not "!line!"=="" echo !line!
        )
    ) else (
        echo File %file% not found.
    )
) else (
    echo No response mapped for %input%.
)

goto loop
