Jugar con texto en la línea de comando
=======================================

La línea de comando (también conocida como interfaz de línea de comando, o CLI, o a veces terminal), es una interfaz basada en texto sin formato para ejecutar comandos en una computadora.  Si alguna vez has visto una película sobre hackers de la década de 1980, como *WarGames*, donde miran un mensaje en una pantalla negra y escriben comandos uno a la vez, es básicamente eso.

Tiene un mensaje y puede escribir un comando y presionar 'Entrar' para ejecutarlo.  Un comando de ejemplo sería:

	touch nuevoarchivo.txt

Este comando creará un archivo llamado `newfile.txt`.

Cómo acceder a la línea de comando
------------------------------

**Mac OS X:** Vaya a /Aplicaciones/Utilidades y haga clic en "Terminal" o busque "Terminal" en Spotlight.

**Desktop Linux:** Puede buscar la aplicación "Terminal" desde el Dash.  Sin embargo, seamos honestos: si estás ejecutando Linux, probablemente no necesites este tutorial.

**Windows:** Windows es un caso un poco especial.  Si va al menú Inicio y hace clic en "Ejecutar", luego escribe "cmd" y presiona Enter, se abrirá la versión de Windows de la línea de comando.  Desafortunadamente, la versión de Windows de la línea de comando tiene su propio sistema, por lo que para seguir estos ejemplos, querrás instalar Cygwin, que te permitirá imitar una línea de comando estilo Linux:

http://www.cygwin.com/

Un poco más de detalle
--------------------

Los comandos generalmente toman el formato:

	[nombre del comando] [opción] [opción] [opción] ...

El mensaje también mostrará en qué directorio se encuentra actualmente. Cada vez que ejecuta un comando, lo hace desde un directorio en particular.  Esto es importante porque cuando ejecuta un comando que involucra un nombre de archivo o un nombre de directorio, puede especificarlo de dos maneras:

#### Rutas relativas

Especificar un archivo o directorio como una ruta relativa significa que estás especificando dónde se ubica en relación con el directorio en el que te encuentras. Por ejemplo, digamos que estás en el subdirectorio `videos` del directorio `files`.  Verá este mensaje:

	/archivos/videos$

Si ejecuta un comando como `touch newfile.txt`, creará `newfile.txt` dentro del directorio actual.  Las rutas relativas no comienzan con una barra.

#### Caminos absolutos

Especificar un archivo o directorio como una ruta absoluta significa que está especificando dónde se encuentra en la computadora en términos absolutos, comenzando desde el nivel superior.  Por ejemplo, digamos que estás nuevamente en el subdirectorio `videos` del directorio `files`.

	/archivos/vídeos$

Si ejecuta un comando como `touch /files/music/newfile.txt`, creará `newfile.txt` dentro de una carpeta diferente, la subcarpeta `music` de la carpeta `files`.  *Los caminos absolutos comienzan con una barra.*

Si usa una ruta absoluta, el comando hará lo mismo sin importar desde qué directorio lo ejecute.

Entonces estos dos comandos tendrán el mismo resultado desde el directorio `/files/videos`:

	/archivos/videos$ rm video.mp4
	(Esto eliminará el archivo `video.mp4` del directorio actual)

	/archivos/videos$ rm /archivos/videos/video.mp4
	(Esto eliminará `video.mp4` del directorio /files/videos/, que resulta ser el directorio actual)

Los mismos dos comandos no tendrán el mismo resultado si se encuentra en un directorio diferente:

	/files/text$ rm video.mp4
	(Esto intentará eliminar el archivo video.mp4 del subdirectorio 'texto', porque ese es el directorio actual)

	/archivos/texto$ rm /archivos/videos/video.mp4
	(Esto eliminará el archivo del directorio /files/videos/, aunque no sea el directorio actual)

Recuerda:

**Comenzar una ruta con una barra diagonal** significa que desea proporcionar la ruta completa e ignorar el directorio en el que se encuentra actualmente.
**No comenzar una ruta con una barra diagonal** significa que deseas indicar la ruta a partir del directorio en el que te encuentras.

Si alguna vez no está seguro de en qué directorio se encuentra, puede usar el comando `pwd` (Print Working Directory - Imprimir directorio de trabajo) para obtener la ruta absoluta del directorio actual.

	~$ pwd
	/home/usuario

Patrones de archivos
-------------

En la mayoría de los casos, cuando tiene que especificar un nombre de archivo o de directorio, también puede especificar un **patrón** general que puede coincidir con varios archivos.  Hay muchos pros y contras con esto, pero la versión más básica utiliza el asterisco (*), que coincide con cualquier cosa.  También se le conoce como comodín.

	Eliminar cualquier archivo en el directorio actual
	/archivos$ rm *

	Elimina cualquier archivo que termine en '.txt'
	/archivos$ rm *.txt

	Elimina cualquier archivo que comience con 'datos'
	/archivos$ rm datos*

Navegando
----------
Los dos comandos principales para navegar en qué directorio se encuentra el mensaje son `cd` y `ls`.

`cd` es un comando para cambiar el directorio actual y debe ir seguido del directorio al que desea cambiar.  Puede proporcionar una ruta absoluta o relativa.

	Esto te llevará a  /archivos/videos
	/archivos$ cd videos	
	/archivos/videos$

	Esto lo ubicará en /videos y luego en el subdirectorio vines.
	/archivos$ cd /videos
	/vídeos$ cd vines
	/videos/vines$

Puedes saltar varios niveles a la vez si lo deseas.

	Esto te llevará a /archivos/videos/corto
	/archivos$ cd videos/corto

Puede usar `cd ..` para subir un nivel al directorio principal.

	Esto te colocará en /archivos
	/archivos/vídeos$ cd ..

`ls` enumerará los archivos en el directorio actual.  Es útil para saber dónde se encuentra, qué archivos existen y qué subcarpetas existen.

	/fotos$ ls	
	miniaturas foto1.jpg foto2.jpg

Usar `ls -l` imprimirá la lista verticalmente, con mucha otra información adicional sobre el tamaño del archivo, los permisos y la fecha de la última modificación:

	/fotos$ ls -l
	-rw-rw-r-- 1 usuario usuario 58133 22 de octubre 17:13 foto1.jpg
	-rw-rw-r-- 1 usuario usuario 75640 22 de octubre 17:13 foto2.jpg
	drwxrwxr-x 2 usuario usuario 4096 22 de octubre 17:13 miniaturas

Al escribir un directorio o nombre de archivo, puede presionar la tecla 'Tab' para autocompletar si es posible.  Por ejemplo, en la carpeta /fotos, si escribe:

	/fotos$ cd mini

y presione 'Tab', completará el resto y le mostrará:

	/fotos$ miniaturas

Sin embargo, si hay más archivos/directorios posibles que coincidan con lo que ha escrito hasta ahora, no funcionará.  Si escribes:

	/fotos$ rm fo

y presiona 'Tab', no sucederá nada porque podrías estar en camino a `foto1.jpg` O `foto2.jpg`.

Si presionas dos veces 'Tab' te mostrará los archivos que comienzan con esas letras en la carpeta en la que estas.

Salida del comando
--------------

Todos los comandos de los que vamos a hablar generan sus resultados como texto.  Cuando ejecuta el comando presionando 'Entrar', imprimirá una gran cantidad de resultados en líneas adicionales debajo del mensaje. Por ejemplo, `head [archivo]` imprimirá las primeras 10 líneas de un archivo.
	
	/archivos$ head nombres.txt
	Dan Sinker
	Erika Owens
	Noah Veltman
	Iglesia de Annabel
	Federico Lindenberg
	canción de sonia
	Mike Tigas
	Brian Abelson
	Manuel Aristarán
	Stijn Debrouwere
	/archivos$

Ten en cuenta que después de imprimir su resultado, vuelve a mostrar un mensaje nuevo.  Obtener el resultado impreso de esta manera es útil si simplemente está husmeando, pero a menudo desea hacer una de dos cosas: **enviar el resultado a un archivo** o **enviar el resultado a otro comando como entrada**.

### Enviar la salida a un archivo

Puede enviar el resultado a un nuevo archivo de esta manera:

	/archivos$ head nombres.txt > primeros10nombres.txt

Si primeros10names.txt no existe, se creará.  Si ya existe, se sobrescribirá.

Puede agregar el resultado al final de un archivo existente de esta manera:

	/archivos$ head nombres.txt >> todoslosnombres.txt

Esto agregará el resultado como 10 líneas nuevas al final de todoslosnombres.txt.

### Enviar la salida a otro comando como entrada

Puede enviar la salida a otro comando usando el símbolo de canalización o pipe (|).  El comando `grep` busca coincidencias en algún texto (más sobre esto más adelante), por lo que puedes hacer esto para obtener las primeras 10 líneas de un archivo y luego buscar "Steve" dentro de esas 10 líneas:

	/files$ head nombres.txt | grep "Steve"

Esto es básicamente lo mismo que hacer esto:

	/archivos$ head nombres.txt > archivotemporal.txt
	/archivos$ grep "Steve" archivotemporal.txt

Pero en lugar de enviar primero la salida a un archivo y luego ejecutar el segundo comando en ese archivo, canaliza la salida directamente desde el primer comando al segundo.  Puedes encadenar tantos de estos como quieras:

	/files$ grep direcciones "Estados Unidos".csv | grep "California" | head

Esto buscaría en el archivo direcciones.csv líneas que contengan la frase "Estados Unidos", luego buscaría en los resultados líneas que contengan la palabra "California" y luego imprimiría las primeras 10 de esas coincidencias.

grep
----

El comando `grep` le permitirá buscar una frase en un archivo (o varios archivos).  De forma predeterminada, imprimirá cada línea que coincida con su búsqueda.

Imprima líneas que contengan la palabra "darkwing":

	/files$ grep "ala oscura" .patosfamosos.txt

Igual que el anterior, pero la búsqueda no distingue entre mayúsculas y minúsculas:

	/archivos$ grep -i "ala oscura" patosfamosos.txt 

Encuentre coincidencias para la *palabra* exacta "Donald" en un archivo; las palabras que contengan "Donald", como "McDonald", no contarán:

	grep -w "Donald" patosfamosos.txt

Encuentre coincidencias para "McDuck" en cada archivo en el directorio actual:

	grep "McPato" *
Encuentre coincidencias para "McDuck" en cada archivo del directorio actual Y en cada subdirectorio, hasta el final:

	grep -r "McPato" *

Para cada coincidencia de "Howard", imprima esa línea Y las 4 líneas posteriores (5 líneas en total):

	grep -A 4 "Howard" patosfamosos.txt

Para cada coincidencia de "Howard", imprima esa línea Y las 4 líneas anteriores (5 líneas en total):

	grep -B 4 "Howard" patosfamosos.txt

Para cada coincidencia de "Howard", imprima esa línea Y las 4 líneas anteriores Y las 4 líneas posteriores (9 líneas en total):

	grep -C 4 "Howard" patosfamosos.txt

En lugar de imprimir las líneas coincidentes, imprima los nombres de archivos que coincidan con su búsqueda:

	grep -l "Lucas" *

Solo obtén el número de coincidencias:

	grep -c "Lucas" *

Muestra los números de línea junto con las líneas coincidentes:

	grep -n "Lucas" patosfamosos.txt

gato
---

El comando `cat` combinará varios archivos (los conCATena). Esto imprimirá tres archivos seguidos, como si fueran un solo archivo:

	cat pavo.txt pato.txt pollo.txt

Recuerde que esto simplemente imprimirá el resultado en su terminal.  Lo más probable es que quieras crear un nuevo archivo que los combine:

	cat pavo.txt pato.txt pollo.txt > turducken.txt

turducken.txt contendrá todas las líneas de pavo.txt, seguidas de todas las líneas de pato.txt, seguidas de todas las líneas de pollo.txt.

Si desea combinar TODOS los archivos en un directorio, puede usar un comodín:

	cat * > todos los archivos combinados.txt

head
----

El comando `head` imprimirá las primeras 10 líneas de un archivo:

	/archivos$ head nombres.txt

También puede especificar un número diferente de líneas.  Esto imprimirá las primeras 15 líneas de un archivo:

	/archivos$ head -n 15 nombres.txt

O, si desea imprimir todo el archivo pero omite las ÚLTIMAS 15 líneas, puede dar un número negativo:

	/archivos$ head -n -15 nombres.txt

Uno de los buenos usos de head es echar un vistazo rápidamente dentro de un archivo de texto grande para ver qué contiene sin tener que esperar a que un editor de texto lo cargue.  ¡Esto se convierte en un gran problema cuando se habla de un archivo de 1 GB!

cola
----

El comando "tail" es el inverso de head.  Imprimirá las últimas 10 líneas de un archivo:

	/archivos$ tail nombres.txt

Esto imprimirá las últimas 15 líneas de un archivo:

	/archivos$ tail -n 15 nombres.txt

O, si desea imprimir todo el archivo pero omite las PRIMERAS 15 líneas, puede agregar un signo más:

	/archivos$ tail -n +16 nombres.txt

Esto es útil si desea, por ejemplo, eliminar una fila de encabezado de un archivo CSV:

	/archivos$ tail -n +2 nombres.txt > nombres-sin-encabezado.txt

Varios
-------------

Si solo desea imprimir todo el contenido de un archivo en su terminal, puede usar `cat` y no combinarlo con nada.  Esto va en contra del objetivo de "cat", pero es un truco útil muy usado.

	/archivos$ cat direccion.txt
	1600 Avenida Pensilvania
	Washington, DC 20500

Si quieres abrir un archivo en un editor de texto que viene integrado en tu terminal, puedes probar con `nano`:

	/archivos$ nano direccion.txt

¿Cuántas líneas hay en nombres.txt?

	/archivos$ wc -l nombres.txt
	18

Expresiones regulares
-------------------

Cuando usa algo como "grep" para buscar, puede buscar un término simple con solo letras, números y espacios.  Pero si desea buscar un patrón, puede utilizar lo que se llama **expresión regular**.  Las expresiones regulares utilizan caracteres especiales para representar patrones, como "cualquier número", "cualquier letra", "X o Y", "al menos tres letras minúsculas", etc.

No nos preocuparemos por los entresijos por ahora, pero un operador útil es el punto (.).  En expresión regular, esto significa "Uno de cualquier carácter".  Entonces puedes buscar algo como:

	/archivos$ grep -i "car.s" diccionario.txt

Esto coincidiría con palabras como "cards", "carts", "cares", etc.  También coincidiría con la mitad de la frase "scar story" (CAR S) porque "cualquier carácter" significa CUALQUIER carácter, incluido un espacio o un signo de puntuación.

Un ejemplo más:

	/archivos$ grep -i ".e.st" diccionario.txt

Esto coincidiría con cosas como "least", "beast" y "heist".

Más de una forma de hacer lo mismo
------------------------------

A menudo hay muchos comandos o combinaciones de comandos igualmente legítimos para lograr el mismo propósito.

Ejemplo:

	/files$ head -n 12 nombres.txt | tail -n 5
	(Imprima las primeras 12 líneas y luego imprima las últimas 5 líneas)

	es lo mismo que

	/archivos$ tail -n +8 nombres.txt | cabeza -n 5
	(Imprima todo comenzando con la línea 8, luego imprima las primeras 5 líneas)

	es prácticamente lo mismo que:

	/archivos$ tail -n +8 nombres.txt > archivotemporal.txt
/archivos$ head -n 5 archivotemporal.txt
	/archivos$ rm archivotemporal.txt
	(Guarde todo comenzando con la línea 8 en un archivo temporal, luego imprima las primeras 5 líneas y luego elimine el archivo temporal)

---

## Preguntas/Comentarios/Sugerencias ##
Noah Veltman  
Web: http://noahveltman.com  
Gorjeo: [@veltman](http://twitter.com/veltman)  
Correo electrónico: [noah@noahveltman.com](correo a:noah@noahveltman.com)
