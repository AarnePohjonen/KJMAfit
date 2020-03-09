%This script was used to analyze data for article
%"Kolmogorov-Johnson-Mehl-Avrami model fitted to COVID-19 mainland China
%infection data" submitted for publication in Mathematical Biology
%Author: Dr. Aarne Pohjonen (computational materials physics), Aarne.Pohjonen@Oulu.fi, Aarne.Pohjonen@iki.fi
chinadata=load('mainlandchinadatafilteredjustinfect.txt','-ASCII');
a=zeros(29,3);
hold on
for i=1:29 % This runs through all datasets, if you wish to use only one data set, e.g. number 3, use i=3:3.
infecteddata=chinadata(i,:);
sizesdata=size(infecteddata);
timedata=linspace(1,sizesdata(2),sizesdata(2));
fun = @(x,xdata)avramifun(x,xdata);%(1-exp(-real(x(1))*(xdata-real(x(3))).^(real(x(2)))));
%a0=[7.2400e-05,3,4,1.18E-3];
a0=[0.025,3,0];
%a0=[7.3e-05,3,6];
opts= optimset('MaxFunEvals', 30000);
a(i,:) = lsqcurvefit(fun,a0,timedata(:),infecteddata(:)./infecteddata(42),[0,1,-20],[inf,5,20],opts)
%infecteddata(42)
A=fun(a(i,:),timedata(:));
plot(timedata(:),A,timedata(:),infecteddata(:)./infecteddata(42));
end
hold off
%histogram(real(a(:,1)),15) % To make histograms, uncomment 
%histogram(real(a(:,2)),15) % To make histograms, uncomment 
for i=1:29
    disp(i);
    disp(a(i,:));
end
