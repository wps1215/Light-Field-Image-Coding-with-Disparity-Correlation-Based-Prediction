Light Field Image Coding with Disparity Correlation Based Prediction
========================================================
% Copyright (c) 2017 -  Xinyu Zhang (1730781@tongji.edu.cn)
% For research purpose only. Cannot be used for any other purpose without permission from the author(s).

This folder provides executables, scripts, and test data.
More technical details can be found in the paper.

How to use
--------
The recommentded enviroment: Windows 7/10, MATLAB 2015b
Also please make sure the "4D LF" folder is equipped with original 4D LF (.mat) downloaded from the EPFL dataset


1. Enter the folder "Myscripts"
2. Run script "lf2yuv420.m", it will produce the .yuv file in proposed order and reference anchor to compute PSNR later.
3. Move above yuv to folder "pichuli", make sure the sequence name is consistent in config files, run .bat files.
4. Move output sequence (.yuv) to folder "Myscripts", run myrec2mat.m/ ldrec2mat.m/mvrec2mat.m, will produce reconstructed LF (.mat).
5. Run script "ComputePSNR.m" to compute PSNR, will reproduce the *.mat files, containing PSNR_Y_Mean, PSNR_YUV_Mean value etc.


---------------------Notice-------------------------
It is worth noting that:
myrec2mat.m is used for output sequence coded on HM16.8 platform, mvrec2mat.m is used for output sequence coded on HTM16.1 platform, ldrec2mat.m is for reimplementing the work in ICME2016 Challenge.
