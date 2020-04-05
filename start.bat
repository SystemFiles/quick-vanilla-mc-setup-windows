@echo off

REM Update the following variables to suite your needs
SET allocated_mem=1024M
SET mc_ver=1.15.2

REM Start mc server process (do not close)
echo "Starting minecraft server version %mc_ver%"
java -Xmx%allocated_mem% -Xms%allocated_mem% -jar minecraft_server.%mc_ver%.jar nogui
PAUSE