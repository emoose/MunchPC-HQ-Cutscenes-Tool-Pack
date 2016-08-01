@echo off
mkdir new
FOR %%X IN (*.wmv) DO (
    ffmpeg -i %%X -c:v rawvideo -pix_fmt yuv420p -qscale 0 raw.yuv
    if exist %%~nX.wmv (
        ffmpeg -i upscale.avs -i %%~nX.wmv -map 0:0 -map 1:1 -vcodec wmv2 -c:a copy -qscale 0 new/%%~nX.wmv
    ) else (
        ffmpeg -i upscale.avs -vcodec wmv2 -qscale 0 new/%%~nX.wmv
    )
    del raw.yuv
)
