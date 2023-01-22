%Производная f' для итерационного метода Ньютона
function f = derivFunF(u)
global tau h
 f=1/(2*tau) + coeff(u)/(2*h);
end