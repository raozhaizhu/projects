@echo off
IF "%~1"=="" (
    echo Please provide a commit message
    echo Usage: push "your commit message"
    exit /b 1
)

git add .
git commit -m "%~1"
git push origin main