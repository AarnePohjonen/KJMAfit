function [outputdata] = avramifun(x,inputxdata)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
outputdata=zeros(size(inputxdata));
for i=1:length(inputxdata)
    if(inputxdata(i))>30%x(3)
        outputdata(i) = x(4)*(1-exp(-real(x(1))*(inputxdata(i)-real(30))^(real(x(2)))));
    end
end
end