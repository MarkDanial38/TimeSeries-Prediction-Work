function resampleData

%��������-------------------------------------------------------------------
    
    %filename_in = '163_0151_2016-06-30_80_allAxisTemperature_merge2_1.csv';
    %filename_in = '163_0151_2016-07-11_85_allAxisTemperature_merge2_1.csv';
    %filename_in = '163_0158_2016-08-10_84_allAxisTemperature_merge2_1.csv';
    filename_in = '231_6092_2016-04-06_axleTempFault_14_merge2_1.csv';
    %filename_in = '242_0312_2016-04-10_axleTempFault_39_merge2_1.csv';
    %filename_in = '233_0631_2016-04-18_axleTempFault_24_merge2_1.csv';
    fid_in = fopen(filename_in);

    %��ȡ��ͷ
    headerformat = '%s';
    columnNum = 69;
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
    data_time = data_all{:,49};
    data_time = datetime(data_time);
    data_attr = [data_all{:,1:48} data_all{:,50:69}];
    %��data_attrת����num
    [m n] = size(data_attr);
    for i = 1:m
        for j=1:n
            data_attr{i,j} = str2num(data_attr{i,j});
        end
    end;
    
    %���ò�ֵ�ز���
    DTn = datenum(data_time);
    ti = 10*1/(24*60*60);% Time Interval
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
    filename = '231_6092_2016-04-06_axleTempFault_14_merge2_1_ri_10.csv';
    %filename = '233_0631_2016-04-18_axleTempFault_24_merge2_1_ri_10.csv';
    %filename = '242_0312_2016-04-10_axleTempFault_39_merge2_1_ri_10.csv';
    %filename = '163_0151_2016-07-11_85_allAxisTemperature_merge2_1_reg.csv';
    %filename = '163_0158_2016-08-10_84_allAxisTemperature_merge2_1_reg.csv';
    fid_out = fopen(filename, 'w');
    %���header
    fprintf(fid_out, '%s', header{1}{49});
    [m n] = size(header{1});
    for i = 1:m
        if i == 49
            continue
        end
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