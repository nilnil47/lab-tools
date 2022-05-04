rList = []
thetaList = []

rList = [rList, getSize(dX1(2,2),dY1(2,2))]
rList = [rList, getSize(dX2(2,2),dY2(2,2))]
rList = [rList, getSize(dX3(2,2),dY3(2,2))]
rList=[rList, getSize(dX4(2,2),dY4(2,2))]
rList=[rList, getSize(dX5(2,2),dY5(2,2))]
rList=[rList, getSize(dX6(2,2),dY6(2,2))]
rList=[rList, getSize(dX7(2,2),dY7(2,2))]
rList=[rList, getSize(dX8(2,2),dY8(2,2))]

distanceFromCenter = [1:1:8];
% plot(distanceFromCenter, rList);
xErr = ones([8,1])*0.03
yErr = sqrt(2*(1/6)^2+rList)
% hold on
errorbar(distanceFromCenter, rList, yErr, yErr, xErr,xErr,"*")

xlabel('dipul radius (cm)','FontSize',20);
ylabel('electric field power (V/cm)','FontSize',20);
set(gca,'FontSize',20)
