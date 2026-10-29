@echo off
chcp 65001 >nul
title 스킬 폴더 만들기
echo ==========================================
echo   에이전트 스킬 폴더 + SKILL.md 만들기
echo ==========================================
echo.
echo 스킬 이름을 영어 소문자로 짧게 입력하세요.
echo   예: cs / review / booking
echo.
set "NAME="
set /p NAME=스킬 이름: 
if "%NAME%"=="" (
  echo [취소] 이름이 비어 있습니다.
  pause
  exit /b 1
)
set "DIR=C:\sj-ai\.agent\skills\%NAME%"
if not exist "%DIR%" mkdir "%DIR%"
if exist "%DIR%\SKILL.md" (
  echo [안내] 이미 SKILL.md가 있습니다. 덮어쓰지 않고 그대로 엽니다.
  goto open
)
> "%DIR%\SKILL.md" (
  echo ---
  echo name: %NAME%
  echo description: 이 스킬을 언제 쓰는지 한 문장으로 적으세요
  echo ---
  echo.
  echo # 역할
  echo - 이 에이전트가 하는 일을 한 줄로 적으세요
  echo.
  echo # 입력
  echo - 받는 정보: 고객 문의 원문 등
  echo.
  echo # 작업 순서
  echo 1. 
  echo 2. 
  echo 3. 
  echo.
  echo # 꼭 지킬 규칙
  echo - 존댓말로 짧고 친절하게 답한다
  echo - 내 노하우 한 줄: 
  echo.
  echo # 절대 하지 말 것
  echo - 가격이나 일정을 확정해서 약속하지 않는다
  echo - 개인정보를 묻거나 적지 않는다
  echo - 모르는 내용은 추측하지 않고 [확인필요]로 표시한다
  echo.
  echo # 대표에게 넘길 상황
  echo - 금액 확정, 클레임, 판단이 애매한 문의
  echo.
  echo # 출력 형식
  echo - 고객에게 보낼 답장 초안
  echo - 대표 확인이 필요한 점
  echo.
  echo # 예시
  echo - 입력: 
  echo - 출력: 
)
echo [OK] 만들었습니다: %DIR%\SKILL.md
:open
start "" C:\Windows\System32\notepad.exe "%DIR%\SKILL.md"
echo.
echo 메모장에서 내용을 채우고 Ctrl + S 로 저장하세요.
C:\Windows\System32\timeout.exe /t 5 >nul
