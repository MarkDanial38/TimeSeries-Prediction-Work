function resampleDataMuil2
   %��������-------------------------------------------------------------------
    %filepath = 'F:\\sql_out\\20161103-�������±���_1��_axleTempFault\\out\\4.remove duplication\\used to HMM\\�ڶ���-��ѡ������������ļ���״̬';
    %filepath = 'E:\\Data_Lab\\20170104-233��-66666��-���������е�������\\out\\3. remove duplication\8000����';
    filepath = 'E:\\Data_Lab\\20170208-tcms-cc66666-240-��������-����11��\\original\\2. ɾ��������\\out';
    filePaths = getFilelist(filepath);  
    for i = 1:length(filePaths)
        resampleData2(filePaths{i},25);
    end    
end

%��Բ�ֿ��غ�ϲ�������
function resampleData2(filename_in, interval)
    
    fid_in = fopen(filename_in);

    %��ȡ��ͷ
    headerformat = '%s';
    columnNum = 154;
    header = textscan(fid_in, headerformat, columnNum, 'Delimiter',',');
    
    %��ȡ����
    format_s = ' %s';
    format_d = ' %d ';
    format = '';
    for i = 1:columnNum
        format = strcat(format, format_s);
    end
    dcells = textscan(fid_in, format, 'Delimiter',',');
    fclose(fid_in);    
    
%���ݴ���-------------------------------------------------------------------

    %�����ʱ������+����ֵ����
    data_all = dcells;
    data_time = data_all{:,1};
    data_time = datetime(data_time);
    data_attr = [data_all{:,2:154}];
    %��data_attrת����num
    [m n] = size(data_attr);
    for i = 1:m
        for j=1:n
            data_attr{i,j} = str2num(data_attr{i,j});
        end
    end;
    
    %���ò�ֵ�ز���
    DTn = datenum(data_time);
    ti = interval*1/(24*60*60);% Time Interval
    DTiv = [DTn(1):ti:DTn(end)]';           % Interpolation Vector
    Table12 = cell2mat(data_attr);        % Vector: Column #2 Of Table1
    DT15 = interp1(DTn, Table12, DTiv);     % Interpolated Column #2
    %newTime = {datestr(DTiv, 'yyyy-mm-dd HH:MM:ss')};
    tmp2 = cellstr(datetime(datestr(DTiv, 'yyyy-mm-dd HH:MM:ss')));
    NewTable1 = {tmp2 DT15};
    Result = cell2table(NewTable1);
    
    %���������ֵ
    mycell = Result;
    [nrows,ncols]= size(mycell{1,2}{1});
    fileSplit = regexp(filename_in, '\\', 'split');
    filename_out = filename_in(1:end-4);
    filename_out = strcat(filename_out, '_ri_', num2str(interval), '.csv');
    fid_out = fopen(filename_out, 'w');
    %���header
    fprintf(fid_out, '%s', header{1}{1});
    [m n] = size(header{1});
    for i = 2:m
        fprintf(fid_out, ',%s', header{1}{i});
    end
    fprintf(fid_out, '\n');
    %���ֵ
    for row = 1:nrows
        fprintf(fid_out, '%s', mycell{1,1}{1}{row,1});%cell�ĵ�-��cell��ʱ��cell�ļ���
        for i = 1:ncols
            fprintf(fid_out, ',%f', mycell{1,2}{1}(row,i));%cell�ĵڶ���cell������ֵ����
        end
        fprintf(fid_out, '\n');
    end
    fclose(fid_out);    
    
end

function [filePaths] = getFilelist(filepath)

    fileFolder = fullfile(filepath);
    dirOutput = dir(fullfile(fileFolder, '*.csv'));
    fileNames = {dirOutput.name};
    filePaths = fullfile(fileFolder, fileNames);    
end