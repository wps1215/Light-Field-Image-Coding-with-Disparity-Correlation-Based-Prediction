function writeyuv( fp,view_yuv)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
% write Y component
	buf = reshape(view_yuv(:, :, 1).', [], 1); % reshape
	count = fwrite(fp, buf, 'uchar');
			
	% write U component
	buf = reshape(view_yuv(1 : 2 : end, 1 : 2 : end, 2).', [], 1); % downsample and reshape
	count = fwrite(fp, buf, 'uchar');

	% write V component
	buf = reshape(view_yuv(1 : 2 : end, 1 : 2 : end, 3).', [], 1); % downsample and reshape
	count = fwrite(fp, buf, 'uchar');

end

