clc;
%clear all;
K=1.38065e-23; %boltzman constant
q=1.602e-19; %charge of electron
Iscn=8.21;
Vocn=32.9;
Kv=-0.123;
Ki=0.0032;
Ns=54;
T=35+273;
Tn=25+273;
Gn=1000;
a=1.3;
Eg=1.12;
G=1000;
Rs=0.221;
Rp=415.405;
Vtn=Ns*(K*Tn/q);
Ion= Iscn/((exp(Vocn/(a*Vtn)))-1);
Io=Ion*((Tn/T)^3)*exp(((q*Eg/(a*K))*((1/Tn)-(1/T))));
Ipvn=Iscn;
Ipv=(Ipvn+Ki*(T-Tn))*(G/Gn);
Vt=Ns*(K*T/q);
I=zeros(330,1);
i=1;
I(1,1)=0;

for V=0:0.1:32.9
I_part=Io*(exp((V+(I(i,1)*Rs))/(Vt*a))-1)+((V+(Rs*I(i,1)))/Rp);
I(i+1)=Ipv-I_part;
V1(i)=V;
P(i)=V*I(i);
i=i+1;
end
V1(i)=V1(i-1);
P(i)=P(i-1);
V1=transpose(V1);
plot(V1,I);


    
    


