class Boton {

  float posx;
  float posy;
  float ancho;
  float alto;
  String texto;
  int size;
  
  Boton(float x, float y, float Tancho, float Talto, String Ttexto, int Tsize){
    posx=x;
    posy=y;
    ancho=Tancho;
    alto=Talto;
    texto=Ttexto;
    size=Tsize;
  
  }
  
  Boton(float x, float y, String Ttexto){
    posx=x;
    posy=y;
    ancho=scale*7;
    alto=scale*2;
    texto=Ttexto;
    size=15;
  }
  //Dibujar el boton
  void display(){
    push();
    rectMode(CENTER);
    fill(0);
    rect(posx,posy,ancho,alto,6);
    fill(252,251,0);
    rect(posx,posy,ancho-10,alto-10,6);
    fill(0);
    textSize(size);
    textAlign(CENTER, CENTER);
    text(texto,posx,posy);
    pop();
    
  }
  
  //Revisar si el boton ha sido seleccionado 
  boolean checkSelect(){
    if( mouseX > posx-(ancho/2) & mouseX < posx+(ancho/2)){
      if(mouseY > posy-(alto/2) & mouseY < posy+(alto/2)){
        return true;
      }
    }
    return false;    
    
  }
  
  void selected(){
    push();
    rectMode(CENTER);
    fill(22,251,249);
    rect(posx,posy,ancho,alto,6);
    fill(252,251,0);
    rect(posx,posy,ancho-10,alto-10,6);
    fill(22,251,249);
    textSize(size);
    textAlign(CENTER, CENTER);
    text(texto,posx,posy);
    pop();
  
  }
  
}

//Funcion para ahorrar lineas de codigo
void activarBoton(Boton obj){
     obj.display();
  if(obj.checkSelect()){obj.selected();}
  }
