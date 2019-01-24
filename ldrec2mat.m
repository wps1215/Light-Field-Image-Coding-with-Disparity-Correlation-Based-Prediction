
clc;
fid = fopen('E:\MATProjects\finalShit\rec_ldI01_25.yuv','r');
fprintf('opened');
LF_temp = zeros(13,13,440,632,3,'uint8');
[y,u,v] = readyuv(fid,632,440);
in = {y,u,v};
yuv444 = my_upsample(in);
rgb = my_ycbcr2rgb(yuv444);
LF_temp(7,7,:,:,:) = rgb(:,:,:);
% LF_temp(7,7,:,:,2) = rgb(:,:,2)';
% LF_temp(7,7,:,:,3) = rgb(:,:,3)';
%load('E:\MATProjects\finalShit/my_order.txt');
for k = 1:13
    for l = 1:13
        if k == 7 && l == 7
            continue;
        end
        if (k==1 || k==13) && (l==1 || l==13)
            continue;
        end
    [y,u,v] = readyuv(fid,632,440);
    in = {y,u,v};
    yuv444 = my_upsample(in);
    rgb = my_ycbcr2rgb(yuv444);
    LF_temp(k,l,:,:,:) = rgb(:,:,:);
    end
end
save('ldqp25_I01.mat','LF_temp');



