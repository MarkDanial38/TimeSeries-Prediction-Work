function [ y ] = gety( x, gzsj)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

%time�Ǵ����ֻ��ʱ������Ϣ��ʱ��
%data�Ƕ�Ӧʱ���µ�����

for i=1:length(x)
    for j=1:length(gzsj)
        if x(i) == gzsj(j)
            y(i) = 300;
            break;
        else
            y(i) = 0;
        end;
    end;
end;



end

