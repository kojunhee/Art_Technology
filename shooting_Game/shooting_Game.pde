final int MAX_BLK = 30;    
final color BCK_COLOR = color(205);  
final color LINE_COLOR = color(189);   
final int GRID_SPACE = 25;  
final int MAKE_TIME = 60*2;   
final int EXIST_TIME = 60*3;

int SCORE = 0;
boolean GameJudge = true;

ArrayList<Block> allBCK = new ArrayList<Block>();
Player player; 
Player player2; 


void setup() {
  size(800, 600); 
  //size(showWidth,showHeight);
  player = new Player(width/2, height/2, 30, 100);
  player2 = new Player(width/2, height/2, 50,10000000);
}


void draw( ) {
  if (GameJudge==true) {
    drawBG();
    drawPlayer();
    /*
    drawAllBlk();
    if (frameCount % MAKE_TIME == 0 && allBCK.size() < MAX_BLK) {
      addBLK();
    }
    */
    drawSCORE();
  } else if (GameJudge!=true) {
    GameOver();
  }
}

/*
void addBLK() {
  float x, y;
  int RecHP = 40;
  int TriHP = 20;
  int PenHP = 60;
  int HexHP = 80;
  x=random(width);
  y=random(height);
  switch(int(random(4))) {
  case 0: 
    allBCK.add(new Rectangle4(x, y, RecHP));
    break;
  case 1: 
    allBCK.add(new Triangle3 (x, y, TriHP));
    break;
  case 2: 
    allBCK.add(new Pentagon5(x, y, PenHP));
    break;
  case 3: 
    allBCK.add(new Hexagon6(x, y, HexHP));
    break;
  default: 
    break;
  }

  //if(i==5){allBCK.remove(0);}
}
*/

ArrayList<Tama> Tamas = new ArrayList<Tama>();

  final color FILL_COLOR = color(0, 178, 225);  
  final color BATTERY_COLOR = color(153); 
  int movementSpeed = 2;  
  int bulletSpeed = 5;    
  int reloadTime = 60;    
  int timeCheck = 60;  //time after shot
  int Damage =20;

boolean CheckMan( float Tamax, float Tamay, float Blockx, float Blocky) { //Block&Bullet
  float SankakuX, SankakuY, SankakuR;
  SankakuX = abs(Tamax - Blockx);
  SankakuY = abs(Tamay - Blocky); 
  SankakuR = 30/2 + 15/2; //Block size touituka(30/2), Tama Hankei sansyou
  return ( sqrt( sq(SankakuX) + sq(SankakuY) ) < SankakuR );
}
boolean CheckMan2( float Tamax, float Tamay, float Blockx, float Blocky) { //Block&Player
  float SankakuX, SankakuY, SankakuR;
  SankakuX = abs(Tamax - Blockx);
  SankakuY = abs(Tamay - Blocky); 
  SankakuR = 30/2 + 30/2; //Block size touituka(30/2), Player Hankei sansyou
  return ( sqrt( sq(SankakuX) + sq(SankakuY) ) < SankakuR );
}
boolean CheckMan3( float Tamax, float Tamay, float playerX, float playerY) { //Block&Player
  float SankakuX, SankakuY, SankakuR;
  SankakuX = abs(Tamax - playerX);
  SankakuY = abs(Tamay - playerY); 
  SankakuR = 30/2 + 30/2; //Block size touituka(30/2), Player Hankei sansyou
  return ( sqrt( sq(SankakuX) + sq(SankakuY) ) < SankakuR );
}


void keyPressed() {
  if (keyCode == 'A') {
    player.leftKeyDown = true;
  } else if (keyCode == 'D') {
    player.rightKeyDown = true;
  } else if (keyCode == 'W') {
    player.upKeyDown = true;
  } else if (keyCode == 'S') {
    player.downKeyDown = true;
  } else if (keyCode == LEFT) {
    player2.leftKeyDown = true;
  } else if (keyCode == RIGHT) {
    player2.rightKeyDown = true;
  } else if (keyCode == UP) {
    player2.upKeyDown = true;
  } else if (keyCode == DOWN) {
    player2.downKeyDown = true;
  }
}

void keyReleased() {
  if (keyCode == 'A') {
    player.leftKeyDown = false;
  } else if (keyCode == 'D') {
    player.rightKeyDown = false;
  } else if (keyCode == 'W') {
    player.upKeyDown = false;
  } else if (keyCode == 'S') {
    player.downKeyDown = false;
  } else if (keyCode == LEFT) {
    player2.leftKeyDown = false;
  } else if (keyCode == RIGHT) {
    player2.rightKeyDown = false;
  } else if (keyCode == UP) {
    player2.upKeyDown = false;
  } else if (keyCode == DOWN) {
    player2.downKeyDown = false;
  }
}
