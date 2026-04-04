@echo off
chcp 65001 > nul
cd /d "%~dp0"

git add index.html en/ images/

git diff --cached --quiet
if %errorlevel% == 0 (
  echo 変更がありません。GitHubはすでに最新の状態です。
  pause
  exit /b 0
)

for /f "tokens=1-3 delims=/ " %%a in ("%date%") do set d=%%c-%%b-%%a
for /f "tokens=1-2 delims=: " %%a in ("%time%") do set t=%%a:%%b
git commit -m "Update site [%d% %t%]"

git push

echo.
echo GitHubへの反映が完了しました。
pause
