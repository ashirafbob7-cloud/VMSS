@echo off
title AutoCare - Vehicle Service and Maintenance Management System
cd /d "%~dp0"
echo =======================================================================
echo  Starting AutoCare Vehicle Service Management System (Java OOP)
echo =======================================================================

if exist "C:\Program Files\Apache NetBeans\java\maven\bin\mvn.cmd" (
    "C:\Program Files\Apache NetBeans\java\maven\bin\mvn.cmd" compile exec:java
    goto end
)

where mvn >nul 2>nul
if %ERRORLEVEL% equ 0 (
    mvn compile exec:java
    goto end
)

echo Running directly via Java runtime...
java -cp "target\classes;lib\*" com.vehicleservice.Main

:end
pause
