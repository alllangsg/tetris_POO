// Juego Tetris POO (Programación Orientada a Objetos ).

//Boleanos de las pantallas
boolean Inicio=false;
boolean Game=true;
boolean Pausa=false;
boolean GameOver=false;

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
Boton BotoRestart;
Boton BotonInicio;

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
  color(248, 255, 0),
  color(255, 7, 26),
  color(45, 254, 19),
  color(38, 27, 251),
  color(251, 19, 254),
  color(251,83,177)};
  
color border= color(0,241,238);

//Funciones del tiempo
int timer;  //Tiempo 
int intervalo = 700; 
int tiempoJuego;

void setup() {
  size(1000, 840);
  StartGame();
}

void draw() {
  background(0);
  if(Inicio){
    InicioScreen();
  }else if(Game){
    PlayScreen();
  }else if(Pausa){
    PauseScreen();
  }else if(GameOver){
    GameOverScreen();
  }
    
}
