function practica_13
u=uicontrol('style','edit','position',[20 160 110 20], 'callback',@editor1)
% u1=uicontrol('style','text','position',[240 240 120 20], 'callback',@editor1)
u1=uicontrol('style','edit','position',[20 290 110 20], 'callback',@editor2)
u2=uicontrol('style','text','string','Función compleja (w=f(z))','position',[20 180 110 30], 'callback',@editor3)
u3=uicontrol('style','text','string','Dominio ()','position',[20 310 110 30], 'callback',@editor4)

    function editor2(atributos,timbre)
        a=get(atributos,'string');
        w=str2sym(a)
        subplot('position',[0.3 0.60 0.55 0.25])
        ezplot(w)
%        set(atributos,'string',' Dominio introducido');
    end

    function editor1(atributos1,timbre)
        b=get(atributos1,'string');
        z=str2sym(b)
        subplot('position',[0.3 0.15 0.55 0.25])
        ezplot(z)
 %       set(atributos1,'string','función introducida');
    end

end
