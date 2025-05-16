clear all;
QTY_Sections=2;
QTY_SRE=1;
QTY_MIRRORS=0;

D=zeros(QTY_Sections+1);
n=zeros(QTY_Sections+1);
R_SRE=nan(QTY_Sections+1,1);
R_MIRROR=nan(QTY_Sections+1,1);

SRE_locations=[2];
%MIRROR_Locations=zeros(QTY_Sections,1);

for i=1:QTY_Sections
    D(i,i+1)=input(strcat("ingrese valor de distancia ",num2str(i),',',num2str(i+1),' :'));
end

for i=1:QTY_Sections
    n(i,i+1)=input(strcat("ingrese valor de indice de refraccion ",num2str(i),',',num2str(i+1),' :'));
end

if  QTY_SRE ~=0
    for i=1:length(SRE_locations)
        R_SRE(SRE_locations(i),1)=input(strcat("ingrese el valor del radio del SRE ",num2str(SRE_locations(i)),' :'));
    end
end

if  QTY_MIRRORS ~=0
    for i=1:QTY_Sections-1
        R_MIRROR(i,1)=input(strcat("ingrese el valor del radio del espejo",num2str(i),' :'));
    end
end

T=zeros(2,2,QTY_Sections);
P_SRE=zeros(QTY_Sections-1,1);
P_MIRRORS=zeros(QTY_Sections,1);

for i=1:length(SRE_locations)
     P_SRE(SRE_locations(i,1),1)=(n(SRE_locations(i,1),SRE_locations(i,1)+1)-n(SRE_locations(i,1)-1,SRE_locations(i,1)))/R_SRE(SRE_locations(i,1),1);
end

%for i=1:length(MIRROR_Locations)
     %P_MIRRORS(MIRROR_locations(i,1),1)=(n(i,i+1)-n(i-1,i))/R_MIRROR(i,1);
%end

T(1,1,:) =1;
T(1,2,:) =0;
T(2,2,:)=1;

for i=1:QTY_Sections
    T(2,1,i)=D(i,i+1)/n(i,i+1);
end

Ra=zeros(2,2,QTY_Sections+1);
Rr=zeros(2,2,QTY_Sections+1);

Ra(1,1,:)=1;
Ra(2,1,:)=0;
Ra(2,2,:)=1;

if  QTY_SRE ~=0
    for i=1:length(SRE_locations)
        Ra(1,2,SRE_locations(i))=(-1)*P_SRE(SRE_locations(i),1);
    end
end

M=T(:,:,2)*Ra(:,:,2)*T(:,:,1)
