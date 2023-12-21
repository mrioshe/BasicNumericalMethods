function carola
g=figure;
axes('position',[0.35 0.35 0.5 0.5])
A=[0 1 1 0;0 0 1 1];
p=patch('faces',[1 2 3 4],...
    'vertices',A',...
    'facecolor',[0 0 143/255]);
sl=uicontrol('style','slider',...
    'position',[20 20 120 20],...
    'min',0,'max',200,...
    'callback',@vari);
function vari(atrib,alarma)
a=get(atrib,'value');
V=colorin(a);
set(p,'facecolor',V)
end
end
