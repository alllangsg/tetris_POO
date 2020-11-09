//Interfaz de Usuario

void keyPressed() {
   if(Game){
     if(key == CODED){
       if (keyCode == 38 && (TetrominoPlay.checkDownRotate(1))){//UP
          TetrominoPlay.rotateT();print("UP");
          
       }
       else if (keyCode == 39 && TetrominoPlay.checkTranslate(1)){//RIGHT
          TetrominoPlay.Right();print("RIGHT");
          
       }
       else if (keyCode == 37 && TetrominoPlay.checkTranslate(0)) {//LEFT
          TetrominoPlay.Left();print("LEFT");  
          
       }
       else if (keyCode == 16) { Pausa=!Pausa; Game=!Game;print("SHIFT"); }//SHIFT
       
       else if(keyCode == 40){//DOWN
          if(!TetrominoPlay.checkDownRotate(0)){
              TetrominoPlay.Down();
              puntaje+=nivel;
           }           
       }
     }
   }
   if(Pausa){
     if (keyCode == SHIFT) {Pausa=!Pausa; Game= !Game;}   
   }
   
   if(GameOver){
     if (keyCode == SHIFT) {GameOver=!GameOver;StartGame();Game=!Game;}     
   }
}


void mousePressed() {
  if(Inicio){
  
  }
  if(Game){
    
  }
  if(GameOver){
  
  }

  
}
