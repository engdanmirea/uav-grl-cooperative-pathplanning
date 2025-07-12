N2=50;                                                                           %% Number of map subdivisions when calculating points

TARGET2plot=[0.895,0.898];                                                       %% end goal

hold on
E=Ematrix(N2,enemysUK2plot);
[X,Y]=meshgrid(linspace(0,1,N2),linspace(0,1,N2));                               %% X and Y are N2 by N2 matrices
contour(X,Y,E','DisplayName','E');
xlabel('x');                                                                     %% x and y axes plus x and y marks
ylabel('y'); 
axis([ 0 1.02 0 1.02]);
set(gcf,'Position',[900 300 450 400]);
tr=cat(1,INITIAL,traceRecord);
tr2=cat(1,INITIAL2,traceRecord2);
trSize=size(tr,1);
trSize2=size(tr2,1);
plot(tr(:,1),tr(:,2),'r','LineWidth',2);
plot(tr2(:,1),tr2(:,2),'b','LineWidth',2);
plot(INITIAL(1),INITIAL(2),'ko','LineWidth',2,'MarkerSize',10);
plot(INITIAL2(1),INITIAL2(2),'ko','LineWidth',2,'MarkerSize',10);
plot(tr(trSize,1),tr(trSize,2),'ko','LineWidth',1,'MarkerSize',6);
plot(tr2(trSize2,1),tr2(trSize2,2),'ko','LineWidth',1,'MarkerSize',6);
plot(TARGET2plot(1),TARGET2plot(2),'kx','LineWidth',2,'MarkerSize',10);

line([0.1 0.3],[0.9 0.9],'LineWidth',2)
line([0.1 0.1],[0.88 0.92],'LineWidth',2)
line([0.3 0.3],[0.88 0.92],'LineWidth',2)
text(0.11,0.87,'Observation')
text(0.11,0.83,'Radius')