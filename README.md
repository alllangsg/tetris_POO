# :blue_heart: Tetris POO :blue_heart:
Juego de tetris desarrollado usando el paradigma de Programación Orientada a Objetos, con objetivo educacional. Universidad Nacional de Colombia.

## Objetivo:
Implementar el nuevo paradigma de programación aprendido(Programación Orientada a Objetos) en el juego de tetris anteriormente desarrollado con programacion estructurada para tener una referencia clara entre ambos paradigmas de programación.

## Notas sobre desarollo:
<p>Esta aplicación de tetris se desarrolló usando la API de processing. El código que se encuentra en este repositorio fue implementado en el IDE de procesing, por lo que se recomienda usar este entorno para correr el APPlet y evitar inconvenientes.</p>

<p>el programa tiene dos clases principales. La clase Terominio, que representa las 7 diferentes figuras que estan disponibles en este juego de tetris clasico. La representación de estas figuras se hizo por medio de operaciones bitwise a un numero entero representado en codigo binario, que corresponde a una figura dibujada en una matriz 4X4. De esta manera, se logro tener una representación general de todas las piezas que permitio abstraer todos su funcionamiento a la clase Tetrominos. Todos los proceson de colisiones, animaciones de rotacion y traslación, y guardado en la memoria fueron implementados como metodos de esta clase. A continuación se muestra las primeras lineas de codigo de dicha clase, donde se pueden apreciar sus atributos y su constructor.</p>

class Tetromino implements Cloneable {

  int row;
  int column;
  int posx;
  int posy;
  color fill;
  color stroke;
  int [] rotaciones = new int [4];
  int rotacion;
  int rotacionP;
  int scale;
  Tablero table;

  Tetromino(color relleno, color borde, int [] rotVector, int r, Tablero board) {
    fill=relleno;
    stroke=borde;
    row = r;
    rotaciones = rotVector;
    rotacion = 0;
    rotacionP = 3;
    scale = board.scale;
    table = board;
    column = ((table.columns)/2)-(4/2);
  }  
  
<p> La otra clase maestra de este juego es la clase Tablero. Esta clase báscamete se encarga de toda la parte de memoria del juego. Esta clase no solo tiene metodos que permiten dibujar distintos tableros de diferentes tamaños sobre la pantalla de juego, sino que ademas tiene otros metodos destinados simplemente a la retención de los colores de cada figura que deja de estar en juego mediante una matriz 2X2 con arreglos dinamicos de colores. Cabe mencionar, hay un método saveT() dentro de la clase Tetrominos que permite guardar la figura en juego dentro de la matriz del Tablero de juego (gameBoard), permitiendo que estas dos clases interactuen dinamicamente.</p>

 void saveT() {
    for (int i = 0; i <= 15; i++) {
      if ((rotaciones[rotacion] & (1 << (15-i))) != 0) {
        posx = (i%4) + column;
        posy = ((i/4)|0) + row;
        if (posy>=0) {
          table.Memoria.get(posy)[posx]=fill;
        }
      }
    }
  }
<p> Una clase Boton de menos de 100 lineas de codigo tambien fue implementada, ya que  esta ayudo a implementar los botones en la interfaze de usuario de una manera eficcaz en el codigo. Con los metodos de esa clase y una funcion extra que ayudo a salvar lineas de codigo, la implementacin de cada boton se hizo sencilla a la hora de programar. Esto permitio desarrollar una interfaz gráfica amena para el usuario en un tiempo bastante reducido a comparación de cuando se realizo con programación estructurada.</p>  
<p>Las demas funciones que usan las instancias de estas clases y sus metodos para generar el funcionamiento del juego se encuentran en otra ventana. Tmabien se creo una ventana principal donde es encuantran el draw y el setup del skectch, en esta ventana también se inicializan las variables globales del archivo.Otras dos paginas fueron creadas. Una especificamente para lidiar con la interfaz de usuario, los eventos keyPressed y MousePressed son los proganonistas de esta página, y la última página corresponde a los métodos usados para dibujar las distinttas pantallas de juego.</p>
## Especificaciones del Juego
<p>El juego cuenta con 13 niveles de juego, donde en cada nivel la velocidad de caidad de los tetrominos va avanzando pregresivamente. EL nivel de juego sube cada 10 segundos de juego. El puntaje que se recibe al acelerar la figura aumenta proporcionalmente al nivel de juego. COmo siempre el puntje también aumentara al completar lineas horizontales en el tablero de juego. Al final de la partida el jugador podra visualizar su puntaje Final.</p>
<p>La interfaz del usuarion es muy dinamica, es decir, el usuariopuede navegar a traves de las distintas pantallas de juego ya sea haciendo click sobre cualquiera de los botones disponibles en cada pantalla, o presionando las teclas que indican dichos botones en su texto.El juego aun no cuenta con sonidos.</p>
## Pantallas de Juego:

### Pantalla de Inicio.
<p> Adema de un bonito titulo realizado con la API de processing, esta pantalla tambien cuenta con otros dos botones: Un boton de Inicio que te lleva a la pantalla de Juego, y un boton.</p>

### Pantalla Principal de Juego
<p>La GameScreen cuenta con un tablero de juego 19x12, donde los tetrominos pueden ser movidos a voluntad usando las flechas del teclado, un cuadro que te muestra el siguiente tetromino a aparecer, un cuadro donde se muestra el puntaje actual del jugador y el nivel en el que se encuentra jugando, y un boton de pausa.</p>

### Controles de Juego
<p>Esta pantalla que solo puede ser accecida medianta la pantalla de inicio o la pantalla de Pausa, indica cuales son las tecls de acción del juego. Dichas Instrucciones se encuentran tambien diligenciadas a continuación.</p>
Las flechas izquierda (LEFT ARROW) y derecha (RIGHT ARROW) sirven para mover el tetromino en juego hacia la dirección especificada por la flecha.<br>
La felcha de arriba (UP ARROW) sirve para rotar el tetromino en dirección horaria.<br>
La flecha de abajo (DOWN ARROW) sirve para aumentar la velocidad de descenso del tetromino en juego; tener en cuenta que esto aumenta tu puntaje de juego.<br>
La barra espaciadora (SPACE) permite pausar el juego y abre la interzas de pausa.<br>
La tecla (SHIFT) es una tecla especial que cambia de función dependiende de la pantalla en la que uno se encuantre. Se reomienda leer las indicaciones en cada uno de los botones de la pantalla antes de oprimir esta tecla.; especialmente porque también es la tecla de reinicio de juego.<p>  
<p>Esta pantalla también cuenta con un boton de regreso que permite al usuario devolverse a la pantalla desde la cual accedió la pantalla de controles.</p>
### Menu de Pausa.
Est pantalla, ademas de contar con un titulo y mostrar el puntaje actual del Jugador, tambien cuenta con tres botones que dan indicaciones de que teclas cumlpen sus mismos propositos. Hay un botón de reanudado, un botónn de reinicio, y un botón que te lleva a la pantalla de controles.
### Game Over
<p>Ademas de mostrar una notificación de que el juego ha terminado, esta pantalla también muestra el puntaje final del jugador y otros dos botones. Un boton para devolverse  a la pantallla de inicio, y otro boton para iniciar otra partida inmediatamente.</p>

##Conclusiones:
<p>1. La programación Orientada a Objetos exige un nivel de abstracción base mucho más alto que la programación estructurada. Aunque tmbipen se pueden implementar procedimientos con altos niveles de abstracción en esta última, tambibén se puede trabajar con esta usando métodos menos generales aunque usando mas lineas de código. SIn embargo, para poder crear una clase que abarque gran aprte del código, es obligatorio encontrar un algoritmo con un nivel de abstracción que sea capaz de encapcular distintos casos de u mismo fenómeno. </p>
<p>2. L programación estruturada promueve la división del codigo en secciones concisas al  querer separar cada clase de las otras. Esta practica permite tener un codigo ordenado y más facil de leer.</p>
<p>3. Los botones son objeos por naturaleza. La implementación de botones se hizo al menos tres veces más eficiente que cuando se implementan por medio de Programación estructurada.</p>
<p>4. La Programación Orientada a Objetos lleva al programador a usar menos lineas de codigo al instigarlo a buscar formas de abstracción mucho más generales que les permitan reutilizar codigo en forma de métodos de una clase.</p>
<p>5. La programación Orientada a Objetos es más comoda para programar videojuegos que la programación estructurada.</p>

