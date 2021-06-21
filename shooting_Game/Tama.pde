class Tama {
  float x, y;
  private float speedX, speedY;
  private int r = 15;   //chokkei
  private color fillColor;
  private int life;
  int Dam;

  Tama(float x, float y, int speed, float angle, color fillColor, int Dam) {
    this.x = x;
    this.y = y;
    this.speedX = speed * cos(angle);
    this.speedY = speed * sin(angle);
    this.fillColor = fillColor;
    this.life = EXIST_TIME;
    this.Dam = Dam;
  }
  void show() {
    fill(fillColor);
    stroke(93);
    strokeWeight(2);

    ellipse(x, y, r, r);
    move(); 
    HitCheck();
    this.life--;
  }
  private void move() {
    x += speedX;
    y += speedY;
  }
  private void HitCheck() {
    float Bux, Buy, Blx, Bly, Plx, Ply;
    int health;
    for (int i=0; i<Tamas.size(); i++) {
      Tama temp = (Tama)Tamas.get(i);
      Bux = temp.x;
      Buy = temp.y;
      for (int j=0; j<allBCK.size(); j++) {
        Block tempBlock =(Block)allBCK.get(j);
        Blx=tempBlock.x;
        Bly=tempBlock.y;
        health=tempBlock.HP;
        if ( CheckMan(Bux, Buy, Blx, Bly)) {
          tempBlock.HP= tempBlock.HP-Dam;
          Tamas.remove(i);
          if (health<=0) {
            allBCK.remove(j);
            SCORE+=10;
            println("SCORE: "+SCORE);
          }
        }
      }        
      Plx=player.x;
      Ply=player.y;
      health=player.HP;
      if ( CheckMan3(Bux, Buy, Plx,Ply)) {
        player.HP= player.HP-Dam;
        Tamas.remove(i);
          if (health<=0) {
          GameJudge=false;
          }
      }
      
      Plx=player2.x;
      Ply=player2.y;
      if ( CheckMan3(Bux, Buy, Plx+30, Ply+30)) {
        Tamas.remove(i);
      }
    }
  }
      
  boolean isExist() {
    if (life < 0) {
      return false;
    } else {
      return true;
    }
  }
}
