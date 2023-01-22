xm=linspace(-1, 0, 100);
for xx=-1:0.01:0
    tm=(xx-xm)*(1+(1+(xx^2+1)^2)^2)/(2*(xx^2+1));
plot(xm, tm);
 title('Характеристики');
 hold on
 xlabel('x');
 ylabel('t');
axis([-5 0 0 2]);
end
for tt=0:0.1:5
    tm=tt-xm*(1+(1+exp(-2*tt))^2)/(2*exp(-tt));
plot(xm, tm);
 
 hold on
 xlabel('x');
 ylabel('t');
axis([-1 0 0 2]);
end