% This program caclulates Fermi integrals using Simpsons integration method
% Program written by Rezo Kobaidze

%anonymous function of Fermi integrals function
FermiIntegral=@(x,pow,q) (x^pow)/(exp(x-q)+1);
	
k=[0,1,2,3,4];
% k=[-0.5,0.5,1.5,2.5,3.5];
key=1;
for pow=k
     str=['integral_values_2\fermi_integral' num2str(pow) '(Simpsons method).txt'];
     my_f=fopen(str, "w");
         for q=-10:0.5:30
         n=100000; %must be even!!
         a=0; b=10000;
         dx=(b-a)/n;
         f0=(a^pow)/(exp(a-q)+1);
         fn=(b^pow)/(exp(b-q)+1);
         %reset parameters  
         intSum1=0;
         intSum2=0;
         m=1;
         while m<n
               x=a+m*dx;
                if mod(m,2)==0   %if is even
                     intSum1=intSum1+2*FermiIntegral(x,pow,q);
                else 
                     intSum2=intSum2+4*FermiIntegral(x,pow,q);
            
                end
              m=m+1;
    end %end of m<n
           integral=(dx/3)*(intSum1+intSum2+f0+fn);
            fprintf(my_f,'%f\n',integral);
     end %end of q
         fclose(my_f);
end %end of k