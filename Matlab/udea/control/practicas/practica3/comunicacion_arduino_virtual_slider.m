N=0;
M=[4 4 4 -4 -4 -4;0 N 10 10 N 0];
axes('position',[0.1 .1 .6 0.8])
plot(M(1,:),M(2,:))
patch('faces',[1 2 5 6],'vertices',M','facecolor','b');
patch('faces',[2 3 4 5],'vertices',M','facecolor','k');
delete(instrfind({'Port'},{'COM2'}));
%crear objeto serie
s = serial('COM2','BaudRate',9600,'Terminator','CR/LF');
warning('off','MATLAB:serial:fscanf:unsuccessfulRead');
%abrir puerto
fopen(s);
u=uicontrol('style','slider','position',[400 40 120 20],...
    'min',0,'max',360,'callback',{@tanque1,s})
function tanque1(atr,~,ss)
N=string(get(atr,'value'))
fprintf(ss,'%s',N,'async');
pause(1)
end

