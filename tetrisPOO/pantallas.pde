void InicioScreen(){
  //botonInicio= new Boton();

}

void PlayScreen(){
  gameBoard.display();
  scoreBoard.display();
  TetrominoPlay.display();
  TetrominoNext.display();
  nextBoard.display();
  scoreDisplay(scoreBoard);
  nivel();
  tiempo();

}

void PauseScreen(){
  background(0);
  push();
  fill(9,45,233);
  textSize(50);
  textAlign(CENTER, CENTER);
  text("PAUSA",width/2,height/2,2);
  pop();
}
void GameOverScreen(){
  push();
  fill(9,45,233);
  textSize(50);
  textAlign(CENTER, CENTER);
  text("GAME OVER",width/2,height/2);
  text("TU PUNTAJE ES:  "+puntaje,width/2,(height/2)+2*scale);
  pop();

}
