@echo off
REM ============================================================
REM 🚀 Gravar bitstream com openFPGALoader no projeto blink_onboard_led
REM ============================================================

set OSSCAD=C:\oss-cad-suite
set PROJETO=C:\Lattice_Diamond\TarefaU7C2\impl1
set BIT=TarefaU7C2_impl1.bit
set BOARD=colorlight-i9

REM Ativa ambiente do OSS CAD Suite
call "%OSSCAD%\environment.bat"

REM Vai para a pasta do projeto
cd /d "%PROJETO%"

REM Executa a gravação
openFPGALoader.exe -b %BOARD% --unprotect-flash -f --verify "%BIT%"

echo ============================================================
echo ✅ Processo finalizado!
echo ============================================================
pause
