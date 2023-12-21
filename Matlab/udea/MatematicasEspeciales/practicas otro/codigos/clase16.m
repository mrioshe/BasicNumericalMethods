a=inputdlg('Ingrese el numero de intervalos:       ')
b=str2num(a{1,1});
for i=1:b
    func(1,i)=inputdlg(strcat('ingrese funcion',num2str(i)));
    f=inputdlg(strcat('ingrese intervalos',num2str(i)));
    f=str2num(f{1,1})
    interv(i,:)=[f(1,1) f(1,2)];
end