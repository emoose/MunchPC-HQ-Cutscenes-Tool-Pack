Oddworld: Munch's Oddysee HQ Cutscenes Tool Pack
===

These are the scripts I used to convert the BIKs from the Xbox version over to high quality WMV files for PC.

Also included is a AviSynth script + batch file for upscaling the BIKs 4x (to 2560x1920) using NNEDI3 neural-network upscaling. Admittedly this is a little over the top and results in some HUGE movie files (~8GB total), but it beats using the games default upscaler :)

You'll need ffmpeg (preferrably 64-bit) to use ConvertBIK, for upscaling you'll need AviSynth+ r2085 (or newer) installed with the RawSourcePlus and nnedi3 plugins.

ConvertBIK.bat converts the BIK into YUV420P raw video, then it combines that raw video with the audio from the MunchPC wmv files to create a new .wmv file, using the -qscale 0 parameter for high-quality conversion.  

ConvertBIK+Upscale.bat does the same as ConvertBIK, but instead of combining the raw file directly it gets run through the upscale.avs script, which uses NNEDI3 to upscale the video and combines that with the MunchPC audio to create the upscaled WMVs.  

UpscaleWMV.bat does the same as above but gets the raw video from the MunchPC wmv instead (for the abe/allaya1.wmv and abe/allaya2.wmv files, as the bik versions don't seem to read properly with ffmpeg)

If anyone comes across this and wants to use it with other bink files, make sure you edit the "-s 640x480 -r 30" part of the command (and the RawSourcePlus call in the upscale.avs file) with the resolution & framerate of the bink file you're converting.

Usage
---

To use, copy the BIK files you want to convert and the corresponding MunchPC WMVs into the same folder as the batch files.

Delete any WMVs that have no audio, otherwise ffmpeg will fail by telling you they have no audio :)

Run the batch file for the operation you want to perform, the results will be put into a "new" folder.

For the abe/allaya1 & abe/allaya2 files, copy the MunchPC WMVs to this folder and run UpscaleWMV.bat.
