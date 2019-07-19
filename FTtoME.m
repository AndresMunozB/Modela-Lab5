function [A, B, C, D] = FTtoME(fun1,fun2)
%   Transforma un caso de diagrama de bloques en un modelo de estado
%   Recibe 2 funciones de transferencia conectadas acorde al diagrama de
%   bloques de la Figura 1 del enunciado del Laboratorio 4 y retorna las 4
%   matrices de su modelo de estado equivalente

%Inicializar las matrices:
A = zeros(2,2);
B = zeros(2,1);
C = zeros(1,2);
D = zeros(1,1);

%Despejar las variables de estado de la funcion de transferencia 1. 
%Como solo hay s de grado 1, la inversa de laplace deja intacto todo menos s*x1
A(1,1)=(-1)*(fun1(3)/fun1(2));
A(1,2)=(-1)*(fun1(1)/fun1(2));
B(1,1)= fun1(1)/fun1(2);

%Despejar las variables de estado de la funcion de transferencia 2. 
%Como solo hay s de grado 1, la inversa de laplace deja intacto todo menos s*x2
A(2,1)=fun2(1)/fun2(2);
A(2,2)=(-1)*(fun2(3)/fun2(2));
B(2,1)=0;

%La salida es siempre la misma para este diagrama de bloques, independiente
%a las funciones de transferencia.
C=[1 0];
D=0;

end

