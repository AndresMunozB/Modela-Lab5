%Definir las funciones de transferencia:
    %Deben ser funciones de transferencia de grado -1, no se admite ni mas
    %ni menos Ejemplo: 4/(3*s+7).
    %Deben ser polinomios de la forma: a/(bs + c) en donde su vector es
    %[a b c]
    
%Usando el ejemplo de la Figura 1 del Enunciado:
    %F1=5/(2s+3)
    %F2=3/(s+2)
    
%Se tiene lo siguiente:
Funcion_de_transferencia_1 = [5 2 3];
Funcion_de_transferencia_2 = [3 1 2];

[A, B, C, D]=FTtoME(Funcion_de_transferencia_1, Funcion_de_transferencia_2)
