PImage  photo;

int xrgb = 0;

color pix;





void setup(){
size(900,873);


  photo = loadImage("diane.png");


}
  int tintR = 0;
  int tintG = 0;
  int tintB = 0;
  
  int flash = 00;
  boolean efecto1;
  boolean efecto;
  boolean efectoP;
void draw(){

loadPixels();

photo.loadPixels();
  for(int x = 0 ; x < width; x++){
    for(int y = 0 ; y <height ; y++){
      
      int loc = x+y*width;
      
      float r = red(photo.pixels[loc]);
       float g = green(photo.pixels[loc]);
        float b = blue(photo.pixels[loc]);
        
        
        
        pixels[loc] = color (r + tintR ,g + tintG ,b + tintB);
        
   /////////Que hay en efectos///////////
    
     
     if(efecto){
     
     
           float dist2 = dist(x  ,y ,mouseX  + int(random(50,250)),mouseY  + int(random(-100,100)));
         pixels[loc] = color (r + dist2, g + dist2 + tintG, b + tintB + dist2, xrgb);
       
      
     
     }
      if(efecto1){
       
        flash+=x  * mouseX;
  if  ((x  > flash + mouseX  ) || (y    > x + mouseY ))  {
pixels[loc ] = color (r  - tintR,g - tintG ,b- tintB );
}  else{ pixels[loc ] = color (r + tintR ,g + tintG ,b + tintB );}
  



    

      
    
  }}
    }
    

  updatePixels();
    
}


//Utilizo wheel para la variable  xrgb en efecto2  //

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  xrgb -= e;
println(xrgb);
}



void keyPressed(){
  
  
  //VAlores RGB////
switch(key){
case  'r':
tintR += 10;
break;

case 'g':
tintG += 10;
break;

case 'b':
tintB += 10;
break;

case '+':
tintR += 10;
tintG += 10;
tintB += 10;
break;


case '-':
tintR -= 10;
tintG -= 10;
tintB -= 10;
break;

 ///RESET/////////
case 'q':
tintR =0;
tintG = 0;
tintB = 0;
break;

 ///Efectos////

case '2':
efecto1 = true;
efecto = false;
break;

case '1':
efecto1 = false;
efecto = true;
break;




}

}
