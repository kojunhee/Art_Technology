abstract class Block {
  protected float x, y;
  protected float angle;
  abstract void show();
  public void shot() {
    Tamas.add(new Tama(player.x+70*cos(angle), player.y+70*sin(angle), bulletSpeed, angle, FILL_COLOR, Damage));
    timeCheck = 0;
  }
  int HP;
}

//float Recx, Recy =0;

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

  void show() {

    fill(fillColor);
    stroke(93);
    strokeWeight(2);

    pushMatrix();

    translate(x, y);
    rotate(angle);
    rect(0, 0, WIDTH, WIDTH, 1);

    popMatrix();
  }
}

class Triangle3 extends Block {

  final int WIDTH = 30;
  color fillColor = color(252, 118, 119);

  Triangle3(float x, float y, int HP) {
    this.x = x;
    this.y = y;
    this.angle = random(TWO_PI);
    this.HP = HP;
  }

  void show() {
    fill(fillColor);
    stroke(93);
    strokeWeight(2);

    pushMatrix();

    translate(x, y);
    rotate(angle);
    triangle(WIDTH+cos(0), WIDTH*sin(0), WIDTH*cos(TWO_PI/3), WIDTH*sin(TWO_PI/3), WIDTH*cos(TWO_PI/3*2), WIDTH*sin(TWO_PI/3*2));

    popMatrix();
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

  void show() {
    fill(fillColor);
    stroke(93);
    strokeWeight(2);

    pushMatrix();

    translate(x, y);
    rotate(angle);
    beginShape();
    for (int i = 0; i < 5; i++) {
      vertex(WIDTH*cos(TWO_PI/5*i), WIDTH*sin(TWO_PI/5*i));
    }
    endShape(CLOSE);

    popMatrix();
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
  void show() {
    fill(fillColor);
    stroke(93);
    strokeWeight(2);

    pushMatrix();

    translate(x, y);
    rotate(angle);
    beginShape();
    for (int i = 0; i < 6; i++) {
      vertex(WIDTH*cos(TWO_PI/6*i), WIDTH*sin(TWO_PI/6*i));
    }
    endShape(CLOSE);

    popMatrix();
  }
}
