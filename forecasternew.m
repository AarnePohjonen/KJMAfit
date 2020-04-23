italyirandata=load('italynew2.txt','-ASCII');
fullinfecteddata=italyirandata(1,:);
infecteddata2=italyirandata(1,1:85);%number 85 here is the last day used in the fitting
sizesdata2=size(infecteddata2);
timedata2=linspace(1,sizesdata2(2),sizesdata2(2));
fullsizesdata=size(fullinfecteddata);
fulltimedata=linspace(1,fullsizesdata(2),fullsizesdata(2));
opts= optimset('MaxFunEvals', 30000);
a0=[0.00025,3,20,20000];
fun = @(x,xdata)avramifun2(x,xdata);
res=lsqcurvefit(fun,a0,timedata2(:),infecteddata2(:),[0,1.4,0,4000],[0.01,3.5,30,1000000],opts);
A=fun(res,timedata2(:));
%plot(timedata2(:),A,timedata2(:),infecteddata2(:));
plot(timedata2(:),infecteddata2(:),'o','MarkerEdgeColor','r','MarkerSize',7,'Displayname','Data used for fitting');
hold on
extraptimedata=linspace(1,100,100);
B=fun(res,extraptimedata(:));
plot(extraptimedata(:),B,'--b','LineWidth',2,'Displayname','KJMA model prediction')
plot(fulltimedata(:),fullinfecteddata(:),'k','LineWidth',2,'Displayname','Real infections')
lgd=legend('Location','northwest');
set(gca,'FontSize',20);
xlabel('Time (days)');
ylabel('Infections');
axis([20,inf,0,210000])
%initguess=avramifun2(a0,extraptimedata(:));
%plot(extraptimedata(:),initguess)
