
clc;
fid = fopen('E:\MATProjects\finalShit\rec_myI01_154.0.yuv','r');
fprintf('opened');
LF_temp = zeros(13,13,440,632,3,'uint8');
[y,u,v] = readyuv(fid,632,440);
in = {y,u,v};
yuv444 = my_upsample(in);
rgb = my_ycbcr2rgb(yuv444);
LF_temp(7,7,:,:,:) = rgb(:,:,:);
% LF_temp(7,7,:,:,2) = rgb(:,:,2)';
% LF_temp(7,7,:,:,3) = rgb(:,:,3)';
load('E:\MATProjects\finalShit\my_order.txt');
for i = 1:168
    k = my_order(i,1);
    l = my_order(i,2);
%         if (k == 8 && l == 8)
%             continue;
%         end
        if ((k==2 || k==14) && (l==2 || l==14))
            continue;
        end
    [y,u,v] = readyuv(fid,632,440);
    in = {y,u,v};
    yuv444 = my_upsample(in);
    rgb = my_ycbcr2rgb(yuv444);
    LF_temp(k-1,l-1,:,:,:) = rgb(:,:,:);
end
save('myqp15_I014.0.mat','LF_temp');


