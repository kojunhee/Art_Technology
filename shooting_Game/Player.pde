
abstract class Base {
  protected float x, y;
  protected int r;
  protected float angle;
  //protected ArrayList<Tama> Tamas;

  abstract void show();
  abstract void move();
}

class Player extends Base {

  boolean leftKeyDown, rightKeyDown, upKeyDown, downKeyDown;
  color FILL_COLOR = color(0, 178, 225);  
  color BATTERY_COLOR = color(153); 
  int HP;
  int type;
  int movementSpeed = 4;  
  int bulletSpeed = 5;    
  int reloadTime = 30;    
  int timeCheck = 60;  //time after shot
  int Damage =20; 
  int test = 0;
  boolean isBack = true;
  boolean flag = true;

  Player(float x, float y, int r, int hp, int type) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.HP = hp;
    this.type = type;
    //this.Tamas = new ArrayList<Tama>();
  }

  void show() {
    drawTamas();

    stroke(93);
    strokeWeight(3);
    pushMatrix();

    translate(x, y);
    
    if(type==1){
      rotate(angle);
      fill(BATTERY_COLOR);
      rect(test, 0-r/4, r, r/2, 1);
      fill(FILL_COLOR);
      ellipse(0, 0, r, r);
    }
    else{
      tint(FILL_COLOR);
      image(p2,0,0,r,r);
    }
    popMatrix();

    updateAngle();
    move();
    lvlUP();
    HitCheck();
    if (mousePressed && mouseButton == LEFT && player.timeCheck > player.reloadTime) {
      player.shot();
    }
    timeCheck++;
  }

  void shot() {
    Tamas.add(new Tama(x+45*cos(angle), y+45*sin(angle), bulletSpeed, angle, FILL_COLOR, Damage));
    timeCheck = 0;
  }
  
  void lvlUP() {
    println(flag);
    if (SCORE%50==0 && flag == false){
      flag = true;
    }
    if (SCORE>=200){
      if (flag) {
        println("level up");
        movementSpeed = SCORE / 50;
        bulletSpeed = SCORE / 15;    
        reloadTime = SCORE / 10;
        flag = !flag;
      }
    }
    else if (SCORE==200) {
      if (flag) {
        println("Level UP"); 
        movementSpeed +=1;
        bulletSpeed +=3;    
        reloadTime -= 10;
        Damage+=20;

        lvlUPdraw4();
        flag=false;
      }
    } else if (SCORE==100) {
      if (!flag) {
        movementSpeed +=1;
        bulletSpeed += 3;    
        reloadTime -=10;

        lvlUPdraw3();
        flag=true;
      }
    } else if (SCORE==50) {
      if (flag) {
        reloadTime-=10;

        lvlUPdraw2();
        flag=false;
      }
    }
  }

  void lvlUPdraw2() {
    println("--------------------------------");
    println("Level UP: Lvl: 2;"); 
    println();
    println("reloadTime 60 → "+reloadTime);
    println("--------------------------------");
  }

  void lvlUPdraw3() {
    println("--------------------------------");
    println("Level UP: Lvl: 3;"); 
    println();
    println("reloadTime 40 → "+reloadTime);
    println("movementSpeed 2 → "+movementSpeed);
    println("bulletSpeed 5 → "+bulletSpeed);
    println("--------------------------------");
  }

  void lvlUPdraw4() {
    println("--------------------------------");
    println("Level UP: Lvl: 4;"); 
    println();
    println("reloadTime 50 → "+reloadTime);
    println("movementSpeed 3 → "+movementSpeed);
    println("bulletSpeed 8 → "+bulletSpeed);
    println("Damage 20 → "+Damage);
    println("--------------------------------");
  }

  void move() {
    float addPos = movementSpeed;
    if ((leftKeyDown || rightKeyDown) && (upKeyDown || downKeyDown)) {
      addPos = movementSpeed / sqrt(2);
    }
    if (leftKeyDown) {
      x -= addPos;
    }
    if (rightKeyDown) {
      x += addPos;
    }
    if (upKeyDown) {
      y -= addPos;
    }
    if (downKeyDown) {
      y += addPos;
    }
    //println(x, y);
  }

  private void updateAngle() {
    this.angle = atan2(mouseY - this.y, mouseX - this.x);
  }

  private void drawTamas() {
    for (int i = 0; i < Tamas.size(); i++) {
      Tama bullet = Tamas.get(i);
      bullet.show();
      if (!bullet.isExist()) {
        Tamas.remove(bullet);
      }
    }
  }
   private void HitCheck() {
    float Plx, Ply, Blx, Bly;
    Plx=x;
    Ply=y;
    //println(Plx, Ply);
    for (int j=0; j<allBCK.size(); j++) {
      Block tempBlock =(Block)allBCK.get(j);
      Blx=tempBlock.x;
      Bly=tempBlock.y;
      if ( CheckMan2(Plx, Ply, Blx, Bly)) {
        player.HP -= 20;
      }
      if (player.HP<=0) {
            GameJudge=false;
          }
    }
  }
}
