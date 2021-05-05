int WIDTH = 1000;
int HEIGHT = 800;
PVector atk1, atk2;

PImage  imageFly = new PImage() ;
PImage  imageGun = new PImage() ;

float gun_x = 0;
float gun_y = 0;
int x,y;

void setup() 
{
  size(1000,800); 
  x = WIDTH/2;
  y = HEIGHT/2;
  imageFly = loadImage("fly.png");
  imageGun = loadImage("gun.png");
  atk1 = new PVector(1,1);
}

void draw() 
{
  background(150);
  
  gun_x += atk1.x; //bullet move
  gun_y += atk1.y;    
  
  image(imageGun,gun_x,gun_y,30,30);    
  image(imageFly ,x,y,30,30);
  
  
  if(keyPressed ==true){
      if (key == 'a')
      {
        x-=10;    if(x<0) x=0;
      }
      else if (key == 'd') 
      {
         x+=10;
         if(x>WIDTH-30) x=WIDTH-30;
      }
      else if (key == 'w') 
      {
        y-=10;    if(y<0) y=0;
      }
      else if (key == 's') 
      {
         y+=10; 
         if(y>HEIGHT-30) y = HEIGHT-30;
      }
  }

}
void mousePressed() 
  {
    
    atk1.x = mouseX-(float)x;
    atk1.y = mouseY-(float)y;
    atk1.setMag(50);
    gun_x = x;  //+(imageFly.width  -imageGun.width)/2;
    gun_y = y;
  }  
