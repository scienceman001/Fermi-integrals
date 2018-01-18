%  Legendre polynomials  roots and weights
%  Program written by Rezo Kobaidze
%everything is shifted by 1 becouse Matlab starts array from 1 index
myFile1=fopen('roots.txt','w');
myFile2=fopen('weights.txt','w');
syms x;
P=[1 x];
for n=2:100
      P(n+1)=((2*n-1)/n)*x*P(n)-((n-1)/n)*P(n-1);
end
l=length(P);
roots=vpasolve(P(l)==0,x);
fprintf(myFile1,'%f\n',roots);
for m=1:length(roots)
      A=subs(P(l-1),roots(m));
     weights(m)=(2*(1-(roots(m)^2)))/(((l-1)*A)^2);
     fprintf(myFile2,'%f\n',weights(m));
end
