@echo off
set DIR=%~dp0
if exist "%DIR%gradle\wrapper\gradle-wrapper.jar" (
  java -jar "%DIR%gradle\wrapper\gradle-wrapper.jar" %*
  exit /b %ERRORLEVEL%
)
where gradle >nul 2>nul
if %ERRORLEVEL% EQU 0 (
  echo Gradle wrapper JAR is not bundled; using installed Gradle as a bootstrap fallback.
  gradle %*
  exit /b %ERRORLEVEL%
)
echo Gradle wrapper JAR is missing and no system Gradle was found.
exit /b 1
