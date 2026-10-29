@echo off
chcp 65001 >nul
title 올라마 재시작
echo ==========================================
echo   올라마(Ollama) 완전히 끄고 다시 켜기
echo   (HTML 앱에 "연결 안 됨"이 뜰 때 사용)
echo ==========================================
set OLLAMA_ORIGINS=*
C:\Windows\System32\taskkill.exe /F /IM "ollama app.exe" /IM ollama.exe >nul 2>&1
C:\Windows\System32\timeout.exe /t 2 /nobreak >nul
start "" "%LOCALAPPDATA%\Programs\Ollama\ollama app.exe"
set /a n=0
:wait
C:\Windows\System32\timeout.exe /t 2 /nobreak >nul
C:\Windows\System32\curl.exe -s http://localhost:11434/api/version >nul 2>&1
if %errorlevel%==0 goto ok
set /a n+=1
if %n% lss 15 goto wait
echo [실패] 다시 켜지지 않았습니다. PC를 재부팅해 보세요.
pause
exit /b 1
:ok
echo [OK] 다시 켜졌습니다. HTML 앱에서 F5(새로고침)를 누르세요.
C:\Windows\System32\timeout.exe /t 5 >nul
