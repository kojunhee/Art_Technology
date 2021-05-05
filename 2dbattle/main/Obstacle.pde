PImage seaweeds;
PImage rock;
class Obstacle{
  int xpos,ypos,kind;
  Obstacle(int x,int y,int k){
    xpos=x;
    ypos=y;
    kind=k;
  }
  void draw(){
    seaweeds= loadImage("seaweeds.png");
    rock = loadImage("rock.png");
    if(kind==1){
      image(seaweeds,xpos,ypos,100,100);
    }
    if(kind==2){
      image(rock,xpos,ypos,100,100);
    }
  }
}
