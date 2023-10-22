@echo off
@echo Made By Barry
@echo.
@echo Voulez-vous supprimer tous vos fichiers temporaires ?
@echo.
pause

color 3
Del /S /F /Q %temp%
Del /S /F /Q %Windir%\Temp
Del /S /F /Q C:\WINDOWS\Prefetch
@echo.
@echo Tout les fichiers temporaires ont été supprimés.
@echo. 
pause
