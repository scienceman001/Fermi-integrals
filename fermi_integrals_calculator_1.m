%this program caclulates fermi integrals using Gauss-Legendre method
%program written by Rezo Kobaidze
  k=[0,1,2,3,4];
% k=[-0.5,0.5,1.5,2.5,3.5];
key=1;
for pow=k
   str=['integral_values_1\fermi_integral' num2str(pow) '.txt'];
   my_f=fopen(str, "w");
   for q=-10:0.5:30
       my_c=fopen("coefficients\weights.txt","r");
       my_x=fopen("coefficients\roots.txt", "r");
       
       %reset parameters
       int_1=0;
       int_2=0;
       int1(key)=0;
       int2(key)=0;
       
       while ~feof(my_c)
           c=str2double(fgets(my_c));
           x=str2double(fgets(my_x));
           A=0.5+0.5*x;
           f1=((A^pow))/(exp(A-q)+1);
           int_1=c*0.5*f1;
           int1(key)=int1(key)+int_1;
           
           A2=1/A;
           f2=((1/A)^2)*((A2^pow))/(exp(A2-q)+1);
           int_2=c*0.5*f2;
           int2(key)=int2(key)+int_2;
           fermi_integral(key)=int1(key)+int2(key);
       end 
       fclose(my_c);
       fclose(my_x);
       fprintf(my_f,'%f\n', fermi_integral(key));
   end %end loop through q
   key=key+1;
   fclose(my_f);
end %end loop through k


