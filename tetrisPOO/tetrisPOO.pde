// Juego Tetris POO (Programación Orientada a Objetos ).

//Boleanos de las pantallas
boolean Inicio=true;
boolean Game=false;
boolean Pausa=false;
boolean GameOver=false;
boolean Controles=false;
int counter=0;//nos dice desde que pantalla se eccede controles.

//Configuración inicial del juego, tetris en un tablero 20X12
int actual=1;
int siguiente=1;
int scale=40;
//Configuración inicial del puntaje y el nivel, y un nombre por defecto para los puntajes
int puntaje = 0;
int nivel = 1;

//Objetos de la clase Tablero
Tablero gameBoard;
Tablero nextBoard;
Tablero scoreBoard;
//Los tetrominos
Tetromino TetrominoPlay;
Tetromino TetrominoNext;
Tetromino TetrominoFinal;
//Botones
Boton BotonPausa;
Boton BotonRestart;
Boton BotonInicio;
Boton BotonReanudar;
Boton BotonAgain;
Boton BotonRestart1;
Boton BotonControles;
Boton BotonControles1;
Boton BotonReturn;
//Arreglo con los numeros decimales que representan cada binario de los polyominos del juego
//Referenciar Felipe
final int [][] ListaFiguras = {  
  {61440, 17476, 61440, 17476}, //0 I
  {59392, 50240, 11776, 35008}, //1 L
  {27648, 35904, 27648, 35904}, //2 S
  {50688, 19584, 50688, 19584}, //3 Z
  {57856, 17600, 36352, 51328}, //4 J
  {26112, 26112, 26112, 26112}, //5 ||
  {58368, 19520, 19968, 35968}, //6 T
};

//Variables globales referentes a colores en la pantalla de colores
color [] Colores = {
  color(248, 255, 0),
  color(36, 254, 236),
  color(255, 7, 26),
  color(45, 254, 19),
  color(38, 27, 251),
  color(251, 19, 254),
  color(251,83,177)};
  
color border= color(3,208,216);

//Funciones del tiempo
int timer;  //Tiempo 
int intervalo = 700; 
int tiempoJuego;

void setup() {
  size(1000, 840);
  BotonPausa= new Boton((width*4/5)+10,height*13/14,"PRESIONE ESPACIO PARA PAUSAR");
  BotonReanudar=new Boton((width/3),height*2/3,"PRESIONE ABAJO PARA CONTINUAR"); 
  BotonRestart=new Boton((width*2/3),height*2/3,"PRESIONE SHIFT PARA REINICIAR");
  BotonAgain=new Boton((width*2/3),height*2/3,scale*8,scale*2,"PRESIONE ABAJO PARA VOLVER A JUGAR",14);
  BotonRestart1=new Boton((width/3),height*2/3,"PRESIONE SHIFT PARA IR A INICIO");
  BotonInicio=new Boton((width/3),height*2/3,"PRESIONE ABAJO PARA JUGAR");
  BotonControles=new Boton((width*2/3),height*2/3,scale*8,scale*2,"PRESIONE ARRIBA PARA VER CONTROLES",15);//INICIO
  BotonControles1=new Boton((width/2),(height*2/3) +scale*2,scale*8,scale*2,"PRESIONE ARRIBA PARA VER CONTROLES",15);//PAUSA
  BotonReturn=new Boton((width/2),height*13/14,"PRESIONE SHIFT PARA REGRESAR");//PAUSA
  StartGame();
}

void draw() {
  background(0);
  print(counter);
  if(Inicio){
    InicioScreen();
  }else if(Game){
    PlayScreen();
  }else if(Pausa){
    PauseScreen();
  }else if(GameOver){
    GameOverScreen();
  }else if(Controles){
    ControlesScreen();
  }
    
}
