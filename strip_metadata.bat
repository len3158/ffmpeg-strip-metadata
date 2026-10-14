@echo off
setlocal enabledelayedexpansion

:: Directory with your MP4 files (edit if needed)
set "SOURCE_DIR=%cd%"

:: Output directory (optional)
set "OUTPUT_DIR=%cd%\output"
mkdir "%OUTPUT_DIR%" >nul 2>&1

echo Stripping metadata from MP4 files in: %SOURCE_DIR%
echo Output files will be saved to: %OUTPUT_DIR%
echo.

for %%F in ("%SOURCE_DIR%\*.mp4") do (
    set "filename=%%~nF"
    echo Processing: %%~nxF

    ffmpeg -i "%%F" -map 0 -c copy -map_metadata -1 "%OUTPUT_DIR%\!filename!_clean.mp4" -y

    echo Done: !filename!_clean.mp4
    echo.
)

echo All files processed.
pause