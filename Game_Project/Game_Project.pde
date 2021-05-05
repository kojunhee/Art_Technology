int WIDTH = 1000;
int HEIGHT = 800;
PVector atk1, atk2;

PImage  imageFly = new PImage() ;
PImage  imageGun = new PImage() ;

float gun_x = 0;
float gun_y = 0;
int x,y;
boolean[] moveKeys = new boolean[4];

void setMovement(int k, boolean b) {
  switch (k) {
  case 'w':
    moveKeys[0] = b;
    break;
  case 'a':
    moveKeys[1] = b;
    break;
  case 's':
    moveKeys[2] = b;
    break;
  case 'd':
    moveKeys[3] = b;
    break;
  }
}

void keyPressed() {
  setMovement(key, true);
}

void keyReleased() {
  setMovement(key, false);
}

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
      if (moveKeys[1] == true)
      {
        x-=5;    if(x<0) x=0;
      }
      if (moveKeys[3] == true) 
      {
         x+=5;
         if(x>WIDTH-30) x=WIDTH-30;
      }
      if (moveKeys[0] == true) 
      {
        y-=5;    if(y<0) y=0;
      }
      if (moveKeys[2] == true) 
      {
         y+=5; 
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
