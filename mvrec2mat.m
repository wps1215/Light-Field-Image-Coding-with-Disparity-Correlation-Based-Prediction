clc;
fid = fopen('E:\MATProjects\finalShit\I11_rec_1_37.yuv','r');
%fprintf('opened');
LF_temp = zeros(13,13,440,632,3,'uint8');
[y,u,v] = readyuv(fid,632,440);
in = {y,u,v};
yuv444 = my_upsample(in);
rgb = my_ycbcr2rgb(yuv444);
LF_temp(7,7,:,:,:) = rgb(:,:,:);
load('E:\MATProjects\finalShit\my_mvorder1.txt');
for i = 1:82
    k = my_mvorder1(i,1);
    l = my_mvorder1(i,2);

        if ((k==2 || k==14) && (l==2 || l==14))
            continue;
        end
    [y,u,v] = readyuv(fid,632,440);
    in = {y,u,v};
    yuv444 = my_upsample(in);
    rgb = my_ycbcr2rgb(yuv444);
    LF_temp(k-1,l-1,:,:,:) = rgb(:,:,:);
end
fclose(fid);
fid = fopen('E:\MATProjects\finalShit\I11_rec_2_37.yuv','r');
load('E:\MATProjects\finalShit\my_mvorder2.txt');
for i = 1:83
    k = my_mvorder2(i,1);
    l = my_mvorder2(i,2);
        if ((k==2 || k==14) && (l==2 || l==14))
            continue;
        end
    [y,u,v] = readyuv(fid,632,440);
    in = {y,u,v};
    yuv444 = my_upsample(in);
    rgb = my_ycbcr2rgb(yuv444);
    LF_temp(k-1,l-1,:,:,:) = rgb(:,:,:);
end
fclose(fid);
save('mvqp37_I11_shit.mat','LF_temp');