chinadata=load('mainlandchinadatafilteredjustinfect.txt','-ASCII');
a=zeros(29,3);
hold on
for i=1:29
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
%histogram(real(a(:,1)),15)
%histogram(real(a(:,2)),15)
for i=1:29
    disp(i);
    disp(a(i,:));
end
