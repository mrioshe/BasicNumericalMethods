a=inputdlg('igrese el número d intervalos:    ')%crea una ventana emergente
b=str2num(a{1,1});%convierte el string en numero
for i=1:b
    func(1,i)=inputdlg(strcat('ingrese función ',num2str(i)));%strcat concatena
    f=inputdlg(strcat('ingrese intervalo ',num2str(i)));% 'func' e 'interv' son arreglos
    f=str2num(f{1,1})
    interv(i,:)=[f(1,1) f(1,2)];% se guarda el primer intervalo en 'f' para posteriormente guardarlos 
    %uno a uno en 'interv'
end
%syms t w
%F= int(t*exp(-j*w*t), interv(1,:))