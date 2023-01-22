%Зададим сетку по x и t и ее параметры
%Не забываем, что f-разностная схема, F-функция в pdf файле
%Так как задача «однородная», то f=0

%Зададим пределы изменения коордтинаты x
x0=0;
x1=-1;

%Зададим пределы изменения коордтинаты t
t0=0;
t1=2;

%Определим узлы сетки по x и t (размерность матрицы) 
Nx = 300;
Nt = 300;
point=zeros(Nt,Nx);
%Зададим шаг сетки по x и t
global h tau 
h=(x1-x0)/Nx;
tau=(t1-t0)/Nt;

%Заданная точность
global e
e=0.0001;
                %Начальный момент времени на границе
                %point(1,1)=internal_t(0);
                %point(координата{ось Y},время{ось X})
                
%Распределение начальных значений по t
for i=0:1:Nx
 point(i+1,1)=internal_t(i*h);
end

%Распределение начальных значений по x
for j=0:1:Nt
 point(1,j+1)=internal_x(j*tau);
end

%Схема бегущего счета:
%u12 u11 u21 - это узлы, которые мы знаем 
%u1 - это приближение y(i+1)(j+1)
%u2 - это сумма первого приближения u1 плюс delta 
%delta - это обычно будет  delta = -f(u1)/f'(u1), в pdf F(u)=-arctg(exp(u))
%f=y../2h + F../2tau-из разностной схемы, это как бы вся разностная схема
%а f'=1/(2*tau) + F'/2h, это для разложения функции в ряд:
% 0 = f + f' * delta
for j=1:1:Nt
 for i=1:1:Nx
 delta=1;
 u1=point(i,j+1);
 u12=point(i,j+1);
 u11=point(i,j);
 u21=point(i+1,j);

%Итерационный метод Ньютона:
%delta - это обычно будет  delta = -f(u1)/f'(u1)
%derivFunF(u1) = f'=1/(2*tau) + F'/2h
%F'=-exp(u)/1+exp(2u)
%FunF1(u12, u1, u11, u21)= f=y../2h + F../2tau
 while (delta>e)
 u2=u1-FunF1(u12, u1, u11, u21)/derivFunF(u1);
 delta=abs(u2-u1);
 u1=u2;
 end
 point(i+1,j+1)=u2;
 end
end

%Параметры графика
 x_grid = linspace(x0, x1, Nx+1); %для построения сетки
 y_grid = linspace(t0, t1, Nt+1);
% t_grid = linspace(t0, tN, Nt);
 x_mesh = zeros(Nt+1, Nx+1);
 for p = 1:Nt+1
 x_mesh(p, :) = x_grid;
 end

 y_mesh = zeros(Nt+1, Nx+1);
 for p = 1:Nx+1
 y_mesh(:, p) = y_grid'; % ' - транспонирование
end


%Параметры графика
mesh(x_mesh, y_mesh, point');
 title('Численное решение');
 xlabel('x');
 ylabel('t');
 zlabel('u');
%axis(gca, 'vis3d');
axis([-1 0 t0 t1]);
rotate3d;
colorbar;

%ПЕРЕД ЗАПУСКОМ ПРОГНАТЬ internal_t 