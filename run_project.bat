@echo off
title "Smart Hostel & Seat Management System - Launcher"
echo ==========================================================
echo Starting Smart Hostel ^& Seat Management System...
echo ==========================================================
echo.

:: 1. Check if MySQL is running on port 3306
netstat -ano | findstr :3306 >nul
if %errorlevel% neq 0 (
    echo [Backend] MySQL is not running. Starting MySQL server via XAMPP...
    
    :: Try to start via XAMPP's mysqld
    if exist "C:\xampp\mysql\bin\mysqld.exe" (
        start "XAMPP MySQL" /min "C:\xampp\mysql\bin\mysqld.exe" --defaults-file="C:\xampp\mysql\bin\my.ini" --standalone
        echo [Backend] MySQL launch initiated. Waiting 3 seconds for startup...
        timeout /t 3 /nobreak >nul
    ) else (
        echo [ERROR] XAMPP MySQL was not found at C:\xampp\mysql\bin\mysqld.exe.
        echo Please make sure your MySQL/MariaDB server is running manually!
        pause
    )
) else (
    echo [Backend] MySQL backend is already running on port 3306.
)
echo.

:: 2. Create bin folder and compile if needed
if not exist "bin" (
    echo [Frontend] Creating build output directory 'bin'...
    mkdir bin
)

echo [Frontend] Copying UI resource files (FXML/CSS)...
xcopy /E /I /Y "src\resources" "bin\resources" >nul

echo [Frontend] Compiling source files...
javac -d bin -cp "lib/*" "@sources.txt"
if %errorlevel% neq 0 (
    echo [ERROR] Compilation failed. Please check your JDK installation.
    pause
    exit /b %errorlevel%
)
echo [Frontend] Compilation successful.
echo.

:: 3. Launch the JavaFX Application
echo [Frontend] Launching application...
java -Djava.library.path=lib -cp "bin;lib/*" app.Main
if %errorlevel% neq 0 (
    echo.
    echo [INFO] Application exited with code %errorlevel%.
)

pause
