@echo off

SET server_url='https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar'
SET mc_file='minecraft_server.1.15.2.jar'
SET java_url='https://javadl.oracle.com/webapps/download/AutoDL?BundleId=241536_1f5b5a70bf22433b84d0e960903adac8'

echo "Performing server setup/update..."
powershell -Command "(New-Object Net.WebClient).DownloadFile(%server_url%, %mc_file%)"
echo "Download complete!

echo "Looking for existing JRE installation..."
reg query "HKLM\Software\JavaSoft\Java Runtime Environment\1.8">nul 2>&1
if errorlevel 1 (
    echo "JRE not found...Installing now!"
    powershell -Command "(New-Object Net.WebClient).DownloadFile(%java_url%, 'jre8.exe')"
    echo "Done! Running JRE install in silent-mode..."
    jre8.exe /s
    echo "Cleaning up..."
    del "%CD%\jre8.exe"
    echo "Done."
) else (
    echo "JRE already installed. Skipping..."
)

echo "Creating and signing EULA..."
echo.>"%CD%\eula.txt"
echo eula=true> %CD%\eula.txt
echo "Done! You may now use the provided start.bat file to start your server."

PAUSE