class EffectofMove{
  int m=0;
  void draw() {
    if(m%20==0){
      int size = 30-(int)random(5,15);
      noStroke();
      fill(224,255,253);
      ellipse(mouseX, mouseY, size, size);
    }
    m++;
  }
}
