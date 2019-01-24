clc
route = 'E:\MATProjects\finalShit\4DLF';
d = dir(fullfile([route,'\*.','mat']));
n = numel(d);
for i= 1:n
    filename = d(i).name;
    k = find('.'==filename);
    lfpname = filename(1:k-1);
    load(['E:\MATProjects\finalShit\4DLF\',lfpname,'.mat']);
    light_field_temp=im2double(LF);%im2double = /255
    light_field = im2uint8(light_field_temp);
    %save([lfpname,'_R.mat'],'light_field');
    yuv_filename1 = ['mv_',lfpname,'1.yuv'];
    yuv_filename2 = ['mv_',lfpname,'2.yuv'];
    my_writerawlfyuv(light_field, yuv_filename1);
    my_writerawlfyuv2(light_field, yuv_filename2);
    
%     lf2pics(lfpname);
%     jpg2avi(lfpname);
%     jpg2my_avi(lfpname);
%     vidObj = VideoReader(['E:\MATProjects\ShitShit\Results_saving\avis\',lfpname,'.avi']);
%     mov2yuv(vidObj,lfpname,1);
%     vidObj = VideoReader(['E:\MATProjects\ShitShit\Results_saving\avis\','my_',lfpname,'.avi']);
%     mov2yuv(vidObj,lfpname,2);
end
