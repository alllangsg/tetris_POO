
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

 //Dibuja la figura en pantalla
 //Referenciar Felipe
  void display() {
    push();
    fill(fill);
    stroke(stroke);
    strokeWeight(3);
    for (int i = 0; i <= 15; i++) {
      if ((rotaciones[rotacion] & (1 << 15 - i)) != 0) {
        posx = (i%4)*scale + column*scale + table.posx;
        posy = ((i/4)|0) * scale + row*scale + table.posy;
        square(posx, posy, scale);
      }
    }
    pop();
  }
  
  //Mueve el Tetromino una fila abajo.
   void Down() {
    row+=1;
  }

 // Mueve elTetromino una columna a la izquierda.
   
  void Left() {
    column-=1;
  }

 //Mueve el Tetromino una columna a la derecha
  void Right() {
    column+=1;
  }

  //Rotación 90° en sentido horario.
  void rotateT() {
    rotacionP = rotacion;
    rotacion = (rotacion+1)%4;
    if (checkDownRotate(1)) {
      rotacion = rotacionP;
    }
  }

  //Revisar colisiones laterales
  //Hecho con la ayuda de Felipe Forero https://github.com/fore1806/Tetris-Programacion-Estructurada/blob/master/tetrissssss/tetrissssss.pde 
  boolean checkSideways (int caso) { //caso =1, es para colision Derecha
    for (int j = 0; j < 4; j++)
    {
      for (int i = j; i <= 15; i += 4) {
        if (((rotaciones[rotacion] & (1 << i)) != 0) && caso == 0) { //Right colision
          posx = ((15-i)%4) + column;
          posy = (((15-i)/4)|0) + row;
          if (posy>=0 && (table.Memoria.get(posy)[posx+1] != 0))
            return false;
        } else if (((rotaciones[rotacion] & (1 << 15-i)) != 0) && caso == 1) { //Left colision
          posx = (i%4) + column;
          posy = ((i/4)|0) + row;
          if (posy>=0 && (table.Memoria.get(posy)[posx-1] != 0))
            return false;
        }
      }
    }
    return true;
  }
  
  //Revisar coliciones al bajar o al rotar
  //Hecho con la ayuda de Felipe Forero https://github.com/fore1806/Tetris-Programacion-Estructurada/blob/master/tetrissssss/tetrissssss.pde
  boolean checkDownRotate(int caso) {
    for (int i = 0; i <= 15; i++) {
      if (((rotaciones[rotacion] & (1 << 15 - i)) != 0) && caso == 1) { //Rotacion caso1
        posx = (i%4) + column;
        posy = ((i/4)|0) + row;
        if (posy>=0 &&(table.Memoria.get(posy)[posx] != 0)) { 
          print("rotacion");
          return true;
        }
      } else if (((rotaciones[rotacion] & (1 << i)) != 0)&& caso == 0) { //Abajo caso2
        posx = ((15-i)%4) + column;
        posy = (((15-i)/4)|0) + row;
        if (posy>=0 && (table.Memoria.get(posy+1)[posx] != 0)) {
          print("Bajar");
          return true;
        }
      }
    }
    return false;
  }
  

  //Guarda la figura en memoria en el tablero.
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

  //Clonar Figura para reutilizarla.
  public Tetromino clone() {
    Tetromino obj=null;
    try {
      obj=(Tetromino)super.clone();
    }
    catch(CloneNotSupportedException ex) {
      System.out.println(" no se puede duplicar");
    }
    return obj;
  }
}
