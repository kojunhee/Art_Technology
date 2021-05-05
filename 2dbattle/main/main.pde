Box[] box = new Box[5];
Obstacle[] Obs = new Obstacle[5];
int frame=0;
void setup(){
  background(122,193,211);
  size(1000,500);
  for(int i=0;i<5;i++){
    box[i] = new Box((int)random(0,1000),(int)random(0,500),(int)random(1,3));
    box[i].draw();
  }
  for(int i=0;i<5;i++){
    Obs[i] = new Obstacle((int)random(0,1000),(int)random(0,500),(int)random(1,3));
    Obs[i].draw();
  }
}

void draw(){
  if(frame%5==0)
    background(122,193,211);
  for(int i=0;i<5;i++){
    box[i].draw();
  }
  for(int i=0;i<5;i++){
    Obs[i].draw();
  }
  EffectofMove move = new EffectofMove();
  move.draw();
  frame++;
}
