{se desea realizar un sitema para manejar albumes de figuritas (copa mundial de futbol) pertenecientes a 10 chicos. 
 de cada chico se conoce: apellido, nombre, una estructura para simular un album de 638 figuritas que permita 
 marcar si se tiene o no cada figurita, mas los datos de cada figurita y otra estructura para almacenar figuritas repetidas.
 de cada figurita se conoce: Numero de figurita (1..639), apellido y nombre de jugador, codigo de seleccion(1..32)

 A) realizar un modulo que cargue la informacion de los 10 chicos en una estructura. el album de cada chico arranca vacio
 (las 638 figuritas deben quedar marcadas como que no las tienen y sin datos de las figuritas), y su estructura de figuritas arranca vacia

 B) realizar un modulo que reciba una posicion X (1..10) y una estructura que represente un paquete con 5 figuritas. el modulo debe acceder 
 al chico de la posicion X y simular el pegado de las 5 figuritas en su album (cuando una figurita no esta en el album debe actualizar el dato que indica 
   que la tiene y guardar la figurita, si ya la tiene debe almacenarla en la estructura de las figuritas). 

 C) Realizar un modulo que reciba la estructura generada en A y retorne apellido, nombre del chico con mas figuritas repetidas. 

 D) realizar un modulo que reciba la estructura generada en A, y retorne cual es el codigo de seleccion que tiene menos figuritas repetidas entre los 10 chicos}
