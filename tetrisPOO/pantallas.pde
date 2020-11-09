void InicioScreen(){
  background(0);
  push(); 
  textSize(80);
  textAlign(CENTER, CENTER);
  fill(Colores[0]);
  text("T",(width/8)+60,height/4);
  fill(Colores[1]);
  text("E",(width*2/8)+60,height/4);
  fill(Colores[2]);
  text("T",(width*3/8)+60,height/4);
  fill(Colores[3]);
  text("R",(width*4/8)+60,height/4);
  fill(Colores[4]);
  text("I",(width*5/8)+60,height/4);
  fill(Colores[5]);
  text("S",(width*6/8)+60,height/4);
  pop();
  activarBoton(BotonInicio);
  activarBoton(BotonControles);

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
  activarBoton(BotonPausa);

}

void PauseScreen(){
  background(0);
  push();
  fill(9,45,233);
  textSize(50);
  textAlign(CENTER, CENTER);
  text("PAUSA",width/2,height/3);
  text("Su puntaje actual es: "+puntaje,width/2,height/2);
  pop();
  activarBoton(BotonReanudar);
  activarBoton(BotonRestart);
  activarBoton(BotonControles1);
}
void GameOverScreen(){
  push();
  fill(9,45,233);
  textSize(50);
  textAlign(CENTER, CENTER);
  text("GAME OVER",width/2,(height/4) -(2*scale));
  text("TU PUNTAJE ES:  "+puntaje,width/2,(height/4)+2*scale);
  pop();
  activarBoton(BotonAgain);
  activarBoton(BotonRestart1);

}

void ControlesScreen(){
  push();
  fill(9,45,233);
  textSize(40);
  textAlign(CENTER, CENTER);
  text("ARRIBA",(width/4)-40,(height/7) -(2*scale));
  text("ABAJO",(width/4)-40,(height*2/7) -(2*scale));
  text("DERECHA",(width/4)-40,(height*3/7) -(2*scale));
  text("IZQUIERDA",(width/4)-40,(height*4/7) -(2*scale));
  text("SHIFT",(width/4)-40,(height*5/7) -(2*scale));
  text("ESPACIO",(width/4)-40,(height*6/7) -(2*scale));
  textSize(30);
  fill(255);
  text("Rotar Figura en sentido horario",(width*3/4)-40,(height/7) -(2*scale));
  text("Acelerar caida Figura",(width*3/4)-40,(height*2/7) -(2*scale));
  text("Mover Figura a la Derecha",(width*3/4)-40,(height*3/7) -(2*scale));
  text("Mover Figura a la Izquierda",(width*3/4)-40,(height*4/7) -(2*scale));
  text("Tecla Especial; leer botones",(width*3/4)-40,(height*5/7) -(2*scale));
  text("Tecla Especial: leer botones",(width*3/4)-40,(height*6/7) -(2*scale));
  pop();
  activarBoton(BotonReturn);  
  
}
