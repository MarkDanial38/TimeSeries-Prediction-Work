%     %ԭ�ߵ�ѹ
%     ybdy = dcells(2);
%     ybdy = ybdy{1};   
%     for i=1:length(ybdy);
%         tmp = cell2mat(ybdy(i,1));
%         num = tmp(2:end-1);
%         ybdy_mat(i,1) = str2num(num);
%     end;   
%     plot(ybdy_mat);

% %240-413-1423_2016-04-23
% %һ�����ͼ
% function showTheDataTren
%     %��������
%     filename = '240-413-1423_2016-04-23.csv';
%     gzsj = [2109];
%     
%     fid = fopen(filename);
%     
%     %��ȡ��ͷ
%     headerformat = '%s';
%     columnNum = 3;
%     header = textscan(fid, headerformat, columnNum, 'Delimiter',',');
%    
%     %��ȡ����
%     dcells = textscan(fid, '%s %s %s', 'Delimiter',',');
%     fclose(fid);
%     
%     %ԭ�ߵ���
%     ybdl = dcells(3);
%     ybdl = ybdl{1};   
%     for i=1:length(ybdl);
%         tmp = cell2mat(ybdl(i,1));
%         num = tmp(2:end-1);
%         ybdl_mat(i,1) = str2num(num);
%     end;   
%     x = 1:length(ybdl);        
%     y = gety(x,gzsj);   
%     plot(x, ybdl_mat, x, y, 'r');    
% end

% %240-445-1423_2016-04-17
% %һ�����ͼ
% function showTheDataTren
%     %��������
%     filename = '240-445-1423_2016-04-17.csv';
%     gzsj = [3253];
%     
%     fid = fopen(filename);
%     
%     %��ȡ��ͷ
%     headerformat = '%s';
%     columnNum = 3;
%     header = textscan(fid, headerformat, columnNum, 'Delimiter',',');
%    
%     %��ȡ����
%     dcells = textscan(fid, '%s %s %s', 'Delimiter',',');
%     fclose(fid);
%     
%     %ԭ�ߵ���
%     ybdl = dcells(3);
%     ybdl = ybdl{1};   
%     for i=1:length(ybdl);
%         tmp = cell2mat(ybdl(i,1));
%         num = tmp(2:end-1);
%         ybdl_mat(i,1) = str2num(num);
%     end;   
%     x = 1:length(ybdl);        
%     y = gety(x,gzsj);   
%     plot(x, ybdl_mat, x, y, 'r');    
% end

% %240-142-1423-Apr-11
% %һ�����ͼ
% function showTheDataTren
%     %��������
%     filename = '240-142-1423-Apr-11.csv';
%     gzsj = [13 39 108 221];
%     
%     fid = fopen(filename);
%     
%     %��ȡ��ͷ
%     headerformat = '%s';
%     columnNum = 3;
%     header = textscan(fid, headerformat, columnNum, 'Delimiter',',');
%    
%     %��ȡ����
%     dcells = textscan(fid, '%s %s %s', 'Delimiter',',');
%     fclose(fid);
%     
%     %ԭ�ߵ���
%     ybdl = dcells(3);
%     ybdl = ybdl{1};   
%     for i=1:length(ybdl);
%         tmp = cell2mat(ybdl(i,1));
%         num = tmp(2:end-1);
%         ybdl_mat(i,1) = str2num(num);
%     end;   
%     x = 1:length(ybdl);        
%     y = gety(x,gzsj);   
%     plot(x, ybdl_mat, x, y, 'r');    
% end

% %240-142-1423-Apr-12
% %һ�����ͼ
% function showTheDataTren
%     %��������
%     filename = '240-142-1423-Apr-12.csv';
%     gzsj = [37 83 107 158];
%     
%     fid = fopen(filename);
%     
%     %��ȡ��ͷ
%     headerformat = '%s';
%     columnNum = 3;
%     header = textscan(fid, headerformat, columnNum, 'Delimiter',',');
%    
%     %��ȡ����
%     dcells = textscan(fid, '%s %s %s', 'Delimiter',',');
%     fclose(fid);
%     
%     %ԭ�ߵ���
%     ybdl = dcells(3);
%     ybdl = ybdl{1};   
%     for i=1:length(ybdl);
%         tmp = cell2mat(ybdl(i,1));
%         num = tmp(2:end-1);
%         ybdl_mat(i,1) = str2num(num);
%     end;   
%     x = 1:length(ybdl);        
%     y = gety(x,gzsj);   
%     plot(x, ybdl_mat, x, y, 'r');    
% end

% %240-142-1423-Apr-15
% %һ�����ͼ
% function showTheDataTren
%     %��������
%     filename = '240-142-1423-Apr-15.csv';
%     gzsj = [229 231 492 634];
%     
%     fid = fopen(filename);
%     
%     %��ȡ��ͷ
%     headerformat = '%s';
%     columnNum = 3;
%     header = textscan(fid, headerformat, columnNum, 'Delimiter',',');
%    
%     %��ȡ����
%     dcells = textscan(fid, '%s %s %s', 'Delimiter',',');
%     fclose(fid);
%     
%     %ԭ�ߵ���
%     ybdl = dcells(3);
%     ybdl = ybdl{1};   
%     for i=1:length(ybdl);
%         tmp = cell2mat(ybdl(i,1));
%         num = tmp(2:end-1);
%         ybdl_mat(i,1) = str2num(num);
%     end;   
%     x = 1:length(ybdl);        
%     y = gety(x,gzsj);   
%     plot(x, ybdl_mat, x, y, 'r');    
% end

% %240-142-Apr-19
% %һ����������
% function showTheDataTren
%     %��������
%     filename = '240-142-Apr-19.csv';
%     
%     fid = fopen(filename);
%     
%     %��ȡ��ͷ
%     headerformat = '%s';
%     columnNum = 3;
%     header = textscan(fid, headerformat, columnNum, 'Delimiter',',');
%    
%     %��ȡ����
%     dcells = textscan(fid, '%s %s %s', 'Delimiter',',');
%     fclose(fid);
%     
%     %ԭ�ߵ���
%     ybdl = dcells(3);
%     ybdl = ybdl{1};   
%     for i=1:length(ybdl);
%         tmp = cell2mat(ybdl(i,1));
%         num = tmp(2:end-1);
%         ybdl_mat(i,1) = str2num(num);
%     end;   
%     x = 1:length(ybdl);        
%     plot(x, ybdl_mat);    
% end