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
    ancho=60;
    alto=20;
    texto=Ttexto;
    size=20;
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
      if(mouseY > posx-(ancho/2) & mouseY < posx+(alto/2)){
        return true;
      }
    }
    return false;    
    
  }
  
}
