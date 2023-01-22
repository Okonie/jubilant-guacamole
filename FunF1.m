%Задаем f для итерационного метода Ньютона FunF1 (f) через funf (F)
function f = FunF1( a1, a2, b1, b2 )
global tau h
 f=(a1-b1+a2-b2)/(2*tau) + (funf(b2)-funf(b1)+funf(a2)-funf(a1))/(2*h);
end
