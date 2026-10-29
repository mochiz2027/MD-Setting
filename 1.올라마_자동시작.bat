@echo off
chcp 65001 >nul
title 올라마 자동 시작
echo ==========================================
echo   올라마(Ollama) 서버 자동 시작
echo ==========================================

:: 1) 브라우저(HTML 앱)에서 접속 허용 - 처음 한 번 저장되고, 이번 실행에도 바로 적용
set OLLAMA_ORIGINS=*
C:\Windows\System32\setx.exe OLLAMA_ORIGINS "*" >nul

:: 2) 이미 켜져 있는지 확인
C:\Windows\System32\curl.exe -s http://localhost:11434/api/version >nul 2>&1
if %errorlevel%==0 (
  echo [OK] 올라마가 이미 켜져 있습니다.
  goto done
)

:: 3) 꺼져 있으면 실행
echo 올라마를 켜는 중입니다...
start "" "%LOCALAPPDATA%\Programs\Ollama\ollama app.exe"

:: 4) 최대 30초 동안 2초마다 확인
set /a n=0
:wait
C:\Windows\System32\timeout.exe /t 2 /nobreak >nul
C:\Windows\System32\curl.exe -s http://localhost:11434/api/version >nul 2>&1
if %errorlevel%==0 goto ok
set /a n+=1
if %n% lss 15 goto wait
echo [실패] 30초 안에 켜지지 않았습니다. 올라마 설치 위치를 확인하세요.
pause
exit /b 1

:ok
echo [OK] 올라마 서버가 켜졌습니다.

:done
C:\Windows\System32\curl.exe -s http://localhost:11434/api/version
echo.
echo 설치된 모델:
ollama list
echo.
echo 5초 뒤 이 창은 자동으로 닫힙니다.
C:\Windows\System32\timeout.exe /t 5 >nul
