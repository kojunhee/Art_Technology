PImage weaponbox;
PImage bulletbox;
class Box{
  int xpos,ypos,kind;
  Box(int x,int y,int k){
    xpos=x;
    ypos=y;
    kind=k;
  }
  void setup(){
    
  }
  void draw(){
    weaponbox = loadImage("weaponbox.png");
    bulletbox = loadImage("bulletbox.png");
    if(kind==1){
      image(weaponbox,xpos,ypos,100,100);
    }
    if(kind==2){
      image(bulletbox,xpos,ypos,100,100);
    }
  }
}
