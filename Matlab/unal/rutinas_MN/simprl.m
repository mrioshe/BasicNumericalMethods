function  E = esfuerzos_tensor_def (T, plano,e,v)
T
if plano== 1
    if T(1,2)~=0
        I=1;
        J=2;
    else if
            end
        

    end
    tetta_p=(atan((2*T(I,J))/(T(I,I)-T(J,J))))/2
    tetta_s=(atan((T(I,I)-T(J,J))/(2*T(I,J))))/2
    sigma_max= (T(I,I)+T(J,J))/2 + ((T(I,J))^2+((T(I,I)-T(J,J))/2)^2)^(1/2)
    sigma_min= (T(I,I)+T(J,J))/2 - ((T(I,J))^2+((T(I,I)-T(J,J))/2)^2)^(1/2)
    tao_max=((T(I,J))^2+((T(I,I)-T(J,J))/2)^2)^(1/2)
    tao_min=-tao_max
    
else
    
end
G=e/(2*(1+v));
E=[0 0 0;0 0 0; 0 0 0];
E(1,1)= (T(1,1)/e)-v*(T(2,2)+T(3,3))/e;
E(2,2)= (T(2,2)/e)-v*(T(1,1)+T(3,3))/e;
E(3,3)= (T(3,3)/e)-v*(T(2,2)+T(1,1))/e;
E(1,2)= T(1,2)/G;
E(1,3)= T(1,3)/G;
E(2,3)= T(2,3)/G;
E(2,1)=E(1,2);
E(3,1)=E(1,3);
E(3,2)=E(2,3);
E
