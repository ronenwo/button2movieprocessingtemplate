import processing.video.*;

String PATH = "wind2.mov";
String PATH1 = "oranges.jpg";

Movie mov;

PImage imgMov, fgImage;
int irW,irH;

PGraphics dest, fg;

void setup()
{
  
  fgImage = loadImage(PATH1);
  
  mov = new Movie(this, PATH);
  

  size(1200, 800, P2D);
  
  dest = createGraphics(width,height, P2D);
  fg = createGraphics(width,height, P2D);
    
}

boolean clicked= false;

void draw()
{
  background(0,0);
  
  if (clicked){  
    dest.beginDraw();
    dest.image(mov, 0, 0, width, height);
    dest.endDraw();  
    image(dest,0,0);
  }
  else{
    fg.beginDraw();
    fg.image(mov, 0, 0, width, height);
    fg.endDraw();  
    image(fgImage,0,0,1200,800);    
  }
}

void mouseClicked() {
  if (!clicked){
    mov.play();
  }
  clicked = true;
}

void movieEvent(Movie m) {
  m.read();
}