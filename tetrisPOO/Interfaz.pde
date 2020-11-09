//Interfaz de Usuario

void keyPressed() {
   if(Game){
       if (keyCode == 38 && (!TetrominoPlay.checkDownRotate(1)) ){//UP
          TetrominoPlay.rotateT();print("UP");
          
       }
       else if (keyCode == 39 && (TetrominoPlay.checkSideways(0)) ){//RIGHT
          TetrominoPlay.Right();print("RIGHT");
          
       }
       else if (keyCode == 37 && (TetrominoPlay.checkSideways(1)) ) {//LEFT
          TetrominoPlay.Left();print("LEFT");  
          
       }
       else if (keyCode == 32) {Pausa=!Pausa; Game=!Game;print("SHIFT"); }//espacio
       
       else if(keyCode == 40){//DOWN
          if(!TetrominoPlay.checkDownRotate(0)){
              TetrominoPlay.Down();
              puntaje+=nivel;
           }           
       }
   }
   else if(Pausa){
     if (keyCode == 40) {Pausa=!Pausa; Game= !Game;}   // DOWN
     if(keyCode==16){StartGame();Pausa=!Pausa; Game=!Game;}//SHIFT
     if(keyCode ==38){Pausa= !Pausa;Controles= !Controles; counter=1;}//UP
   }  
   else if(GameOver){
     if (keyCode == 16) {GameOver=!GameOver;Inicio=!Inicio; counter=0;}//shift
     if (keyCode == 40) {GameOver=!GameOver;StartGame();Game=!Game;}//DOWN
   }
   else if(Inicio){
     if(keyCode ==40){StartGame();Inicio= !Inicio;Game= !Game;}//DOWN
     if(keyCode ==38){Inicio= !Inicio;Controles= !Controles; counter=0;}//UP
   
   }else if(Controles){
     if(keyCode == 16){// SHIFT
       if(counter==0){Controles= !Controles;Inicio= !Inicio;}
     }else if(counter==1){Controles=!Controles;Pausa=!Pausa;}
   
   }
}


void mousePressed() {
  if(Inicio){
    if(BotonInicio.checkSelect()){StartGame();Inicio= !Inicio;Game= !Game;}
    if(BotonControles.checkSelect()){Inicio= !Inicio;Controles= !Controles; counter=0;}
  }
  else if(Game){
    if(BotonPausa.checkSelect()){
      Pausa= !Pausa; Game= !Game;
    }
  }
  else if(Pausa){
    if(BotonReanudar.checkSelect()){Pausa= !Pausa; Game= !Game;}
    else if(BotonRestart.checkSelect()){StartGame();Pausa=!Pausa; Game=!Game;}
    if(BotonControles1.checkSelect()){Pausa= !Pausa;Controles= !Controles; counter=1;}
  }
  else if(GameOver){
    if(BotonAgain.checkSelect()){StartGame();GameOver=!GameOver; Game=!Game;}
    if(BotonRestart1.checkSelect()){GameOver=!GameOver;Inicio=!Inicio;}
  
  }else if(Controles){
    if(BotonReturn.checkSelect()){
     if(counter==0){Controles= !Controles;Inicio= !Inicio;}
     else if(counter==1){Controles=!Controles;Pausa=!Pausa;}
    }
  }

  
}
