@echo off

rem Definir la ubicación absoluta del directorio del script
set "SCRIPT_DIR=%~dp0"

rem Verificar la existencia de las carpetas
if not exist "%SCRIPT_DIR%FerreControl" (
    echo La carpeta FerreControl no se encuentra en %SCRIPT_DIR%
    exit /b 1
)
if not exist "%SCRIPT_DIR%nginx" (
    echo La carpeta nginx no se encuentra en %SCRIPT_DIR%
    exit /b 1
)
if not exist "%SCRIPT_DIR%nssm" (
    echo La carpeta nssm no se encuentra en %SCRIPT_DIR%
    exit /b 1
)

rem Copiar las carpetas
echo Copiando la carpeta FerreControl a C:\
xcopy /E /I /Y "%SCRIPT_DIR%FerreControl" "C:\FerreControl"
echo Copiando la carpeta nginx a C:\
xcopy /E /I /Y "%SCRIPT_DIR%nginx" "C:\nginx"
echo Copiando la carpeta nssm a C:\
xcopy /E /I /Y "%SCRIPT_DIR%nssm" "C:\nssm"
echo Carpetas copiadas con éxito.

rem Instalar y iniciar el servicio nginx
C:\nssm\win64\nssm install nginx "C:\nginx\nginx.exe"
C:\nssm\win64\nssm start nginx
echo Servicio nginx creado con éxito

rem Crear accesos directos en el escritorio
powershell -Command "$WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%USERPROFILE%\OneDrive\Desktop\FerreControl.lnk'); $Shortcut.TargetPath = 'http://localhost:20246/login'; $Shortcut.IconLocation = 'C:\FerreControl\favicon.ico'; $Shortcut.Save()"
powershell -Command "$WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%USERPROFILE%\Desktop\FerreControl.lnk'); $Shortcut.TargetPath = 'http://localhost:20246/login'; $Shortcut.IconLocation = 'C:\FerreControl\favicon.ico'; $Shortcut.Save()"
echo Shortcut creado correctamente


