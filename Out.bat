@echo off

rem Eliminar el acceso directo del escritorio
del "%USERPROFILE%\OneDrive\Desktop\FerreControl.lnk"
del "%USERPROFILE%\Desktop\FerreControl.lnk"

rem Detener nginx (suponiendo que el proceso se llama nginx.exe)
rem Eliminar el servicio de Nginx
C:\nssm\win64\nssm.exe stop nginx
C:\nssm\win64\nssm.exe remove nginx confirm

rem Borrar la carpeta C:\FerreControl y su contenido
rmdir /S /Q "C:\FerreControl"
rmdir /S /Q "C:\nssm"
rmdir /S /Q "C:\nginx"
