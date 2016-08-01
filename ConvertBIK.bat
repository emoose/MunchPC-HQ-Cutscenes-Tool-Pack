@echo off
mkdir new
FOR /r %%X IN (*.bik) DO (
    ffmpeg -i %%X -c:v rawvideo -pix_fmt yuv420p -qscale 0 %%~nX.yuv
    if exist %%~nX.wmv (
        ffmpeg -pix_fmt yuv420p -s 640x480 -r 30 -i %%~nX.yuv -i %%~nX.wmv -map 0:0 -map 1:1 -vcodec wmv2 -c:a copy -qscale 0 new/%%~nX.wmv
    ) else (
        ffmpeg -pix_fmt yuv420p -s 640x480 -r 30 -i %%~nX.yuv -vcodec wmv2 -qscale 0 new/%%~nX.wmv
    )
    del %%~nX.yuv
)
