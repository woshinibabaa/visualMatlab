function [ token,remainder ] = strtok(string,delimiters)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
if nargin < 1
    errror(meessage('MATLAB:strtok:NrInputArguments'));
end
token = '';remainder = ''; 
len = length(string);
if len == 0
    return 
end
if(nargin ==1)
    delimiters = [9:13 32]; %д�հ��ַ�����
end
i =1;
while(any(string(i) == delimiters))
    i = i+1;
    if(i>len),
        return
    end    
end
start = i;
while(~any(string(i)==delimiters))
    i = i+1;
    if(i>len),
        break,
    end
end
finish = i -1;
token = string(start:finish);
if(nargout ==2)
    remainder = string(finish + 1:length(string));
end

