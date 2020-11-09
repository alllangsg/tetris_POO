
class Tablero{

  int scale;
  int rows;
  int posx;
  int posy;
  color fill;
  color stroke;
  int columns;
  int[] fullRows = new int [4];
  int toDelete;
  ArrayList<color[]> Memoria;

  Tablero(color relleno, color borde, int r, int c, float Tposx, float Tposy) {
    fill=relleno;
    stroke=borde;
    rows = r;
    columns = c;
    scale = 40;
    posx = int(Tposx);
    posy= int(Tposy);
    Memoria = new ArrayList<color[]>();
  }

  // Inicializa el Tabero
  void inicialize(int num) {
    for (int k = 0; k < rows; k++) {
      Memoria.add(new color[columns]);
    }

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < columns; j++) {
        if (j == 0 || j == columns - 1 || i == rows - 1) {
          Memoria.get(i)[j] = fill;  //Color del borde
        } else {
          Memoria.get(i)[j] = 0;
        }
      }
    }

    if (num == 1) {
      for (int j = 1; j<columns-1; j++) {
        Memoria.get(0)[j]=fill;
      }
    }

    gameOver(1);
  }

  // Dibuja el boardro en pantalla
  void display() {
    for (int i=0; i < rows; i++) {
      push();
      stroke(stroke);
      line(posx, i*scale+posy, posx+columns*scale, i*scale+posy);
      pop();
      for (int j=0; j < columns; j++) {
        push();
        stroke(stroke);
        line((j*scale)+posx, posy, (j*scale)+posx, posy+rows*scale);
        pop();
        if (Memoria.get(i)[j] != 0) {  //Solo dibujamos los cuadros que no son ceros (posiciones vacias)
          push();
          stroke(0);
          strokeWeight(2);
          fill(Memoria.get(i)[j]);
          square((j*scale)+posx, i*scale+posy, scale);
          pop();
        }
      }
    }
  }

  // Cuenta las fillas llenas del board y las mete en otro array.
  void completedRows() {
    for (int i = rows - 2; i >= 0; i--) {  //Primero recorremos para ver cuales estan completas
      int j = 0;
      for (j = 1; j < columns-1 && Memoria.get(i)[j] != 0; j++) {
      }
      if (j == columns-1) {
        fullRows[toDelete] = i;  //Si esta completa la añadimos al arrelo
        toDelete += 1;
      }
    }
  }
  
  // Revisar si hay cuadros en la fila 1 para el gameOVer.
  boolean gameOver(int num) {
    if (num ==0) {
      for (int i=1; i<=columns-2; i++) {
        if (Memoria.get(0)[i] != 0) {
          return true;
        }
      }
      return false;
    } else {
      return false;
    }
  }

 // Eliminar las filas llenas del tablero
  void deleteRows() {
    for (int i=0; i<4 && (fullRows[i]!=rows-1); i++) {
      Memoria.remove(fullRows[i]);
    }
  }

  //Reemplazar las filas eliminadas.
  void addRows() {
    for (int i=0; i<4 && (fullRows[i]!=rows-1); i++) { 
      Memoria.add(0, new color[columns]);
      Memoria.get(0)[0] = fill;
      Memoria.get(0)[columns-1] = fill;
    }
  }
  
  void RowsToDelete() {
    toDelete = 0;
    for (int r=0; r<4; r++) {
      fullRows[r] = rows-1;
    }
  }

  //Funcion de borrado de Filas
  void delete() {
    completedRows();
    deleteRows();
    addRows();
  }

}
