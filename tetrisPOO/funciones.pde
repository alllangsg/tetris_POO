

//Funcion para inicializar las variables del juego
void StartGame() {
  actual = int(random (1, 7));
  siguiente = int(random (1, 7));
  gameBoard = new Tablero(border, 125, 21, 14,0,0);
  gameBoard.inicialize(0);
  scoreBoard = new Tablero(border, 0, 8, 7,width*2/3,scale*10);
  scoreBoard.inicialize(1);
  nextBoard = new Tablero(border, 0, 6, 7,width*2/3,scale*2);
  nextBoard.inicialize(1);
  //Tetromino(color color1, color color2, int [] rotVector, int r, Tablero board) {
  TetrominoPlay = new Tetromino(Colores[actual], 0, ListaFiguras[actual],-1,gameBoard);
  TetrominoNext = new Tetromino(Colores[siguiente], 0, ListaFiguras[siguiente], 2, nextBoard);
  puntaje = 0;
  nivel = 1;
  
}

//Función para continuar con el juego
void Play() {
  gameBoard.delete(); 
  score(gameBoard);  //Se modifica el score
  gameBoard.RowsToDelete();
  actual = siguiente;
  siguiente = int(random (0, 7));
  nextFig();
  TetrominoNext = new Tetromino(Colores[siguiente], 0, ListaFiguras[siguiente], 2, nextBoard);
}

//Funcion para tomar el siguiente poliniomio al tablero de juego.
void nextFig() {
  TetrominoPlay = TetrominoNext.clone();
  TetrominoPlay.row = -1;
  TetrominoPlay.table = gameBoard;
  TetrominoPlay.column = ((TetrominoPlay.table.columns/2) -(4/2));
}

// Función de tiempo
void tiempo() {
  if (millis() - timer >= intervalo) {
    if (!TetrominoPlay.checkDownRotate(0))
        TetrominoPlay.Down();
    else {
      TetrominoPlay.saveT();
      if ((!gameBoard.gameOver(0))) 
        Play();
      else {
        Game = !Game;
        GameOver = !GameOver;
      }
    }
    timer = millis(); //se inicia un nuevo intervalo al escoger el valor anterior de milis().
  }
}

//Modifica el Puntaje
void score(Tablero table) {
  if (table.toDelete>0) {
    puntaje += 100 * pow(2, table.toDelete) + 4;
  } else {
    puntaje +=0;
  }
}

//Funcion para postrar los datos de nivel y puntaje
void scoreDisplay(Tablero table) {
  push();
  textSize(35);
  textAlign(CENTER, CENTER);
  fill(250);
  text("LEVEL", table.posx + 3.5*scale, table.posy + 2*scale);
  text(nivel, table.posx + 3.5*scale, table.posy + 3*scale);
  text("SCORE", table.posx + 3.5*scale, table.posy + 5*scale);
  text(puntaje, table.posx + 3.5*scale, table.posy + 6*scale);
  pop();
}

//Funcion para subir de nivel
void nivel() {
  if ((millis()>= (tiempoJuego +20000)) && (nivel <13)) {//Cada 10 segundos.
    tiempoJuego = millis();
    nivel += 1;
    intervalo -= 30; //disminuir intervalo de caida.
  }
}
