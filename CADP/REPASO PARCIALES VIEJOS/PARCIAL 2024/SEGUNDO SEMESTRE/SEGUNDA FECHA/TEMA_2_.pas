{Se desea realizar un sistema para manejar los álbumes de figuritas (copa mundial de Fútbol) pertenecientes a 15 chicos. 
De cada chico se conoce: apellido, nombre, una estructura para simular un álbum de 638 figuritas que permita marcar 
si se tiene o no cada figurita, más los datos de cada figurita y otra estructura para almacenar las figuritas repetidas. 
De cada figurita se conoce: Nro. figurita (1...638), apellido y nombre jugador, código de selección (1...32).

A) Realizar un módulo que cargue la información de los 15 chicos en una estructura. El álbum de cada chico arranca vacío (las 638 figuritas deben quedar marcadas como que no las tienen y sin datos de las figuritas), y su estructura de figuritas repetidas arranca vacía.
B) Realizar un módulo que reciba una posición X (1...15) y una estructura que represente un paquete con 6 figuritas. 
El módulo debe acceder al chico de la posición X y simular el pegado de las 6 figuritas en su álbum 
(cuando una figurita no está en el álbum debe actualizar el dato que indica que la tiene y guardar la figurita;
si ya la tiene debe almacenarla en la estructura de las figuritas repetidas).
C) Realizar el módulo que reciba la estructura generada en A y retorne el apellido, nombre del chico con menos figuritas en el álbum.
D) Realizar un módulo que reciba la estructura generada en A, y retorne cuál es el código de selección que tiene más figuritas repetidas entre los 15 chicos.}
