clear all
close all
 clc
 %borrar previos
delete(instrfind({'Port'},{'COM2'}));
%crear objeto serie
s = serial('COM2','BaudRate',9600,'Terminator','CR/LF');
warning('off','MATLAB:serial:fscanf:unsuccessfulRead');
%abrir puerto
fopen(s);% parámetros de medidas
readData=fscanf(s); %reads "Ready" 
writedata=string(500); %0x01F4 = 500 en hexagesimal
fprintf(s,'%s',writedata,'async') %escribe el dato en el puerto serial

an=4; N=0; a=10;
M=[an an an -an -an -an; 0 N a a N 0];
p=patch ('faces',[1 2 5 6],'vertices',M', 'facecolor',[0 0 1]);
hold on
plot(M(1,:), M(2,:),'k')
axis([-an-1 an+1 -1 a+1])
boton_2=uicontrol('style','checkbox','position',[180 390 240 40],'string','Parar de tomar datos','FontSize',12);


while get(boton_2,'value')==0
q1=fscanf(s);
q=(10*str2double(q1))/1023;
M1=get(p,'vertices');
M1(2,2)=q;
M1(5,2)=q;
set(p,'vertices',M1);
drawnow
end

fclose(s);
 delete(s);
 clear all;
