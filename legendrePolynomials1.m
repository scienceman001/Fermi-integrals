% Legendre polynomials  roots and weights
% Progam written by Rezo Kobaidze
myFile1=fopen('roots.txt','w');
myFile2=fopen('weights.txt','w');
syms x;
n=100;
    roots = vpasolve(legendreP(n,x) == 0);
    fprintf(myFile1,'%f\n',roots);

length(roots)
for m=1:length(roots)
     weights(m)=2*(1-(roots(m)^2))/((n*legendreP(n-1,roots(m)))^2);
     fprintf(myFile2,'%f\n',weights(m));
end
%  myFile1=fopen('counter.txt','w');
% for n=51:75
%     
% fprintf(myFile1,'%d\n',n)
% end
