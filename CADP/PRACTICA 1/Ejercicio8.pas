program EJ8P1;

var
	car1,car2,car3:char;
	voc1,voc2,voc3:boolean; 

begin
	read(car1);
	read(car2);
	read(car3);
	
	voc1 := (car1 = 'a') or  (car1 = 'e') or  (car1 = 'i') or  (car1 = 'o') or  (car1 = 'u'); 
	voc2 := (car2 = 'a') or  (car1 = 'e') or  (car2 = 'i') or  (car2 = 'o') or  (car2 = 'u'); 
	voc3 := (car3 = 'a') or  (car1 = 'e') or  (car3 = 'i') or  (car3 = 'o') or  (car3 = 'u'); 

	if (voc1 and voc2 and voc3) then
		writeln('los tres son vocales')
	else
		writeln('al menos un caracter no era vocal');
end.
