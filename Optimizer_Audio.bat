@ECHO OFF
chcp 65001 > nul
echo ╔════════════════════════════════════════╗
echo ║ ██╗   ██╗███████╗██╗      █████╗ ██╗  ██╗ ║
echo ║ ██║   ██║██╔════╝██║     ██╔══██╗██║ ██╔╝ ║
echo ║ ██║   ██║███████╗██║     ███████║█████╔╝  ║
echo ║ ╚██╗ ██╔╝╚════██║██║     ██╔══██║██╔═██╗  ║
echo ║  ╚████╔╝ ███████║███████╗██║  ██║██║  ██╗ ║
echo ╚═════╝  ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ║
echo ══════════════════════════════════════════
echo        Script Modificado Por: Israel Proyects
echo               Creador Original: OptiJuegos
echo ══════════════════════════════════════════

:: CD Route
cd /d "%CD%"

:: Verifica si se proporciona un archivo como argumento
if "%~1"=="" (
    echo No se proporcionó un archivo MP3. Arrastra un archivo MP3 sobre este script para convertirlo a OGG.
    timeout /nobreak /t 5 >nul
    exit /b
)

:: Establece la ruta del archivo de entrada y salida
set INPUT="%~1"
set FILENAME=%~n1
set OUTPUT=%FILENAME%_Optimized.ogg

:: Set Bitrate
set AUDIO_BITRATE=16.00k

:: Set Preset
set PRESET=slower

:: Set EQ (Equalization) settings
set EQ_SETTINGS=-af "equalizer=f=100:width_type=h:width=50:g=-5"

:: Set Reverb settings
set REVERB_SETTINGS=-af "aecho=0.8:0.9:1000:0.3"

:: Set Bass Boost settings
set BASS_SETTINGS=-af "bass=g=10"

:: Set Treble Boost settings
set TREBLE_SETTINGS=-af "treble=g=5"

:: Set Volume adjustment (change '1.5' to desired volume factor)
set VOLUME_SETTINGS=-af "volume=1.5"

:: Set Normalize audio
set NORMALIZE_SETTINGS=-af "loudnorm"

:: Set Speed adjustment (configured to 1)
set SPEED_SETTINGS=-filter:a "atempo=1"

:: Ejecuta ffmpeg con los parámetros especificados en segundo plano
start /b "" "%CD%\ffmpeg.exe" -i %INPUT% -preset %PRESET% -c:a libopus -b:a %AUDIO_BITRATE% %EQ_SETTINGS% %REVERB_SETTINGS% %BASS_SETTINGS% %TREBLE_SETTINGS% %VOLUME_SETTINGS% %NORMALIZE_SETTINGS% %SPEED_SETTINGS% "%OUTPUT%"

:: Espera un momento antes de salir (puedes ajustar el tiempo según sea necesario)
timeout /nobreak /t 2 >nul

set NORMALIZE_SETTINGS=-af "loudnorm"

:: Set Speed adjustment (configured to 1)
set SPEED_SETTINGS=-filter:a "atempo=1"

:: Ejecuta ffmpeg con los parámetros especificados en segundo plano
start /b "" "%CD%\ffmpeg.exe" -i %INPUT% -preset %PRESET% -c:a libopus -b:a %AUDIO_BITRATE% %EQ_SETTINGS% %REVERB_SETTINGS% %BASS_SETTINGS% %TREBLE_SETTINGS% %VOLUME_SETTINGS% %NORMALIZE_SETTINGS% %SPEED_SETTINGS% "%OUTPUT%"

:: Espera un momento antes de salir (puedes ajustar el tiempo según sea necesario)
timeout /nobreak /t 2 >nul
