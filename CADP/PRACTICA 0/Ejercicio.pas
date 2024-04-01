4. Implemente un programa que lea el diámetro D de un círculo e imprima:
a. El radio (R) del círculo (la mitad del diámetro).
b. El área del círculo. Para calcular el área de un círculo debe utilizar la fórmula PI x R
2
c. El perímetro del círculo. Para calcular el perímetro del círculo debe utilizar la fórmula
D*PI (o también PI*R*2).

program EJ2P4;
var 
    diametro:real;
    radio:real;
begin 
    writeln('ingrese el diametro');
    readln(diametro);
        radio:=diametro/2
        writeln('radio', radio);
        writeln('area', (radio * 2)*3)
        writeln('perimetro', diametro*3)
end.
