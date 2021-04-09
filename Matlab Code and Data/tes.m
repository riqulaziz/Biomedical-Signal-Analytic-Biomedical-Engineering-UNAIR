clc; clear all ; close
ba=0;
bb=pi/2;
tol = 1e-7;
iter = 30;
n=0;
er=1;
fprintf("Iterasi        x                        eror\n");
while n<iter
    n=n+1;
    fa=ba-2*cos(ba*(pi/180));;
    fb=bb-2*cos(bb*(pi/180));;
    x=(ba+bb)/2;
    fx=x-2*cos(x*(pi/180));;
    er=abs(fx);
    k=fx*fb;
    fprintf("%d             %d            %f\n",n,x,er);
    if k<0
      ba=x;
      fa=fx;
     else
      bb=x;
      fb=x;
    end
end
    



