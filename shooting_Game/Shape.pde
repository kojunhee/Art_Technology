abstract class Block {
  protected float x, y;
  protected float angle;
  protected float angle2;
  abstract void show();
  abstract void shot();
  int HP;
}

//float Recx, Recy =0;
int RecHP = 60;
int TriHP = 40;
int PenHP = 80;
int HexHP = 100;

class Triangle3 extends Block {

  final int WIDTH = 30;
  color fillColor = color(252, 118, 119);

  Triangle3(float x, float y, int HP) {
    this.x = x;
    this.y = y;
    this.angle = random(TWO_PI);
    this.HP = HP;
  }
  public void shot() {
    Attacks.add(new Attack(x+70*cos(angle2), y+70*sin(angle2), bulletSpeed*2/3, angle2, enemy_COLOR, Damage));
    timeCheck = 0;
  }

  void show() {
    updateAngle();
    stroke(93);
    strokeWeight(2);
    pushMatrix();
    translate(x, y);
    pushMatrix();
    tint(fillColor);
    image(enemy,-40,-40,80,80);
    popMatrix();
    popMatrix();
    
    pushMatrix();
    strokeWeight(10);
    stroke(255);
    line(this.x, this.y, this.x+50, this.y);
    stroke(0);
    int position = int(map(this.HP, 0, TriHP, this.x, this.x+50));
    line( this.x, this.y, position, this.y);
    popMatrix();
  }
  private void updateAngle() {
    this.angle2 = atan2(player.y - this.y, player.x - this.x);
  }
}


class Rectangle4 extends Block {

  final int WIDTH = 30;
  //final int WIDTH = int(random(0,30));
  color fillColor = color(255, 232, 105);

  Rectangle4(float x, float y, int HP) {
    this.x = x;
    this.y = y;
    this.angle = random(TWO_PI);
    this.HP = HP;
  }
  public void shot() {
    Attacks.add(new Attack(x+70*cos(angle2), y+70*sin(angle2), bulletSpeed*2/3, angle2, enemy_COLOR, Damage));
    timeCheck = 0;
  }

  void show() {
    updateAngle();
    stroke(93);
    strokeWeight(2);
    pushMatrix();
    translate(x, y);
    pushMatrix();
    tint(fillColor);
    image(enemy,-40,-40,80,80);
    popMatrix();
    popMatrix();
    
    pushMatrix();
    strokeWeight(10);
    stroke(255);
    line(this.x, this.y, this.x+50, this.y);
    stroke(0);
    int position = int(map(this.HP, 0, RecHP, this.x, this.x+50));
    line( this.x, this.y, position, this.y);
    popMatrix();
    
  }
  private void updateAngle() {
    this.angle2 = atan2(player.y - this.y, player.x - this.x);
  }
}


class Pentagon5 extends Block {

  final int WIDTH = 30;
  color fillColor = color(118, 141, 252);

  Pentagon5(float x, float y, int HP) {
    this.x = x;
    this.y = y;
    this.angle = random(TWO_PI);
    this.HP = HP;
  }
  public void shot() {
    Attacks.add(new Attack(x+70*cos(angle2), y+70*sin(angle2), bulletSpeed*2/3, angle2, enemy_COLOR, Damage));
    timeCheck = 0;
  }

  void show() {
    updateAngle();
    stroke(93);
    strokeWeight(2);
    pushMatrix();
    translate(x, y);
    pushMatrix();
    tint(fillColor);
    image(enemy,-40,-40,80,80);
    popMatrix();
    popMatrix();
    
    pushMatrix();
    strokeWeight(10);
    stroke(255,255,255);
    line(this.x, this.y, this.x+50, this.y);
    stroke(0,0,0);
    int position = int(map(this.HP, 0, PenHP, this.x, this.x+50));
    line( this.x, this.y, position, this.y);
    popMatrix();
  }
  private void updateAngle() {
    this.angle2 = atan2(player.y - this.y, player.x - this.x);
  }
}

class Hexagon6 extends Block {
  final int WIDTH = 30;
  color fillColor = color(46, 204, 113);

  Hexagon6(float x, float y, int HP) {
    this.x = x;
    this.y = y;
    this.angle = random(TWO_PI);
    this.HP = HP;
  }
  public void shot() {
    Attacks.add(new Attack(x+70*cos(angle2), y+70*sin(angle2), bulletSpeed*2/3, angle2, enemy_COLOR, Damage));
    timeCheck = 0;
  }
  void show() {
    updateAngle();
    stroke(93);
    strokeWeight(2);
    pushMatrix();
    translate(x, y);
    pushMatrix();
    tint(fillColor);
    image(enemy,-40,-40,80,80);
    popMatrix();
    popMatrix();
    
    pushMatrix();
    strokeWeight(10);
    stroke(255,255,255);
    line(this.x, this.y, this.x+50, this.y);
    stroke(0,0,0);
    int position = int(map(this.HP, 0, HexHP, this.x, this.x+50));
    line( this.x, this.y, position, this.y);
    popMatrix();
  }
  private void updateAngle() {
    this.angle2 = atan2(player.y - this.y, player.x - this.x);
  }
}
