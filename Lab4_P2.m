%%%%%%%%%%%%%%%%%%%%%%%%% SEGUNDA PARTE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%EJERCICIO ENUNCIADO

%Considerando que se desea analizar el comportamiento del flujo de salida 
%del estanque 2

%Se definen las variables y parámetros del modelo fenomenol�gico
%h1 = Nivel de agua del primer estanque (unused)
%h2 = Nivel de agua del segundo estanque
%F1 = Flujo de entrada y de salida del primer estanque y entrada del
%segundo
%F2 = Flujo de salida del segundo estanque
%A1 = Area de la superficie del primer estanque (unused)
%A2 = Area de la superficie del segundo estanque
%dh2 = dh2/dt = (dV2/dt)*1/A2, 
%variación en el nivel de agua del segundo estanque
%dh1 = dh1/dt = (dV1/dt)*1/A1
%variación en el nivel de agua del primer estanque (unused)
syms dh1 dh2 h1 h2 F1 F2 A1 A2

%Variables de entrada: F1
%Variables de salida: F2
%Variables de estado: h1 y h2

%Como el flujo de entrada y el flujo de salida del primer estanque son
%iguales a F1, el estanque no varía su nivel de agua
x1 = dh1 == F1/A1-F1/A1; %Igual a 0

%Ecuación de estado del modelo
x2 = dh2 == F1/A2-F2/A2;

%F2=h2
y = F2==h2;
%Se reemplaza el valor de F2 por h2 en x2
x2 = subs(x2, F2, h2);

%Muestra mensaje por consola
disp('El modelo de estado para la primera variable de estado:')
%Print de la expresión simbólica x1
pretty(x1)

%Muestra mensaje por consola
disp('El modelo de estado para la segunda variable de estado:')
%Print de la expresión simbólica x2
pretty(x2)

%Muestra mensaje por consola
disp('Para la salida es:')
%Print de la expresión simbólica y
pretty(y)

%En forma matricial

%Mensaje por consola
disp('En forma matricial (mismo resultado anterior):')
%Para las variables de estado
state_matrix_x = [dh1;dh2] == [0 0; 0 -1/A2]*[h1;h2] + [0;1/A2]*F1;
%Para la salida
state_matrix_y = [F2] == [0 1]*[h1;h2];

%Muestra el resultado de la matriz de estados para las variables de estado
%(mismo resultado que en el print anterior)
disp(state_matrix_x)
%Muestra el resultado de la matriz de estados para la salida 
%(mismo resultado que en print anterior)
disp(state_matrix_y)

%Ejemplo 1
%Se obtiene el valor de las variables de estado
caso_1x = subs(x2, {F1, A2, h2}, {100, 10, 30});
%Se obtiene el valor de la salida
caso_1y = subs(y, h2, 30);
%Mensajes por consola
disp('Con los valores: ')
disp('Flujo de entrada = 100 m^(3)/s')
disp('�?rea de la superficie del segundo estanque = 10 m^{2}')
disp('Nivel de agua del segundo estanque = 30 m')
disp('El nivel de agua del estanque 2 varia a:')
disp(caso_1x)
disp('La salida obtuvo el valor de: ')
disp(caso_1y)

%Ejemplo 2
%Se obtiene el valor de las variables de estado
caso_2x = subs(x2, {F1, A2, h2}, {8.145, 5, 8.145});
%Se obtiene el valor de la salida
caso_2y = subs(y, h2, 8.145);
%Mensajes por consola
disp('Con los valores: ')
disp('Flujo de entrada = 8.145 km^(3)/s')
disp('�?rea de la superficie del segundo estanque = 5 km^{2}')
disp('Nivel de agua del segundo estanque = 8.145 km')
disp('El nivel de agua del estanque 2 varia a:')
disp(caso_2x)
disp('La salida obtuvo el valor de: ')
disp(caso_2y)

%Ejemplo 3
%Se obtiene el valor de las variables de estado
caso_3x = subs(x2, {F1, A2, h2}, {2300, 65, 6300.15});
%Se obtiene el valor de la salida
caso_3y = subs(y, h2, 6300.15);
%Mensajes por consola
disp('Con los valores: ')
disp('Flujo de entrada = 2300 m^(3)/s')
disp('�?rea de la superficie del segundo estanque = 65 m^{2}')
disp('Nivel de agua del segundo estanque = 6300.15 m')
disp('El nivel de agua del estanque 2 varia a:')
%Se utiliza vpa para aproximar el resultado a un decimal con 6 cifras
%significativas
disp(vpa(caso_3x,6))
disp('La salida obtuvo el valor de: ')
%Se utiliza vpa para aproximar el resultado a un decimal con 6 cifras
%significativas
disp(vpa(caso_3y,6))

%EJERCICIO DE MATERIAL EXTRAIDO DE USACH VIRTUAL (PEP 2 - 13 ENERO 2009)

%Separación entre primer y segundo ejercicio en consola
disp('------------- SEGUNDO EJERCICIO --------------')
%Salto de linea
disp(' ')

%Considerando que se desea analizar el comportamiento del flujo de salida 
%del estanque 2

%Se definen las variables y parámetros del modelo fenomenológico
%h1 = Nivel de agua del primer estanque
%h2 = Nivel de agua del segundo estanque
%F0 = Flujo de entrada del primer estanque
%F1 = Flujo de salida del primer estanque y entrada del
%segundo
%F2 = Flujo de salida del segundo estanque
%A1 = Area de la superficie del primer estanque
%A2 = Area de la superficie del segundo estanque
%dh2 = dh2/dt = (dV2/dt)*1/A2, 
%variación en el nivel de agua del segundo estanque
%dh1 = dh1/dt = (dV1/dt)*1/A1
%variación en el nivel de agua del primer estanque
%R1 = Resistencia de válvula 1
%R2 = Resistencia de válvula 2
syms dh1 dh2 h1 h2 F0 F1 F2 A1 A2 R1 R2

%Datos del enunciado
F_1 = F1 == (h1-h2)/R1;
F_2 = F2 == h2/R2;
A_1 = A1 == 2;
A_2 = A2 == 4;
R_1 = R1 == 1/4;
R_2 = R2 == 1/16;

%Variables de entrada: F0
%Variables de salida: F2
%Variables de estado: h1 y h2

%Ecuación para variable de estado h1
x1 = dh1 == F0/A1-F1/A1;

%Reemplazando los datos del enunciado
F_1 = subs(F_1, R1, R_1);
x1 = subs(x1, {F1, A1}, {F_1, A_1});

%Ecuación para variable de estado h2
x2 = dh2 == F1/A2-F2/A2;
F_2 = subs(F_2, R2, R_2);

%Reemplazando los datos del enunciado
x2 = subs(x2, {F1, F2, A2}, {F_1, F_2, A_2});

%Ecuación para salida
y = F2;

%Reemplaznado datos del enunciado
y = subs(y, F2, F_2);

%Muestra mensaje por consola
disp('El modelo de estado para la primera variable de estado:')
%Print de la expresión simbólica x1
pretty(x1)

%Muestra mensaje por consola
disp('El modelo de estado para la segunda variable de estado:')
%Print de la expresión simbólica x2
pretty(x2)

%Muestra mensaje por consola
disp('Para la salida es:')
%Print de la expresión simbólica y
pretty(y)

