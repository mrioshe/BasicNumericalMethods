function placa_rectangular(m)
g=figure;
axes('position',[0.28 0.28 0.5 0.5])
A=[0 1 1 0;0 0 1 1];

sl=uicontrol('style','edit','position',[250 65 80 30],'fontsize',11);
s2=uicontrol('style','edit','position',[250 335 80 30],'fontsize',11);
s3=uicontrol('style','edit','position',[50 200 80 30],'fontsize',11);
s4=uicontrol('style','edit','position',[450 200 80 30],'fontsize',11);
uc3=uicontrol('String','Push here','style','pushbutton','position',[185 11 200 50],'fontsize',11);
end