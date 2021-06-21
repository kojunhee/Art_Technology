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


void setup() {
  size(800, 600); 
  //size(showWidth,showHeight);
  player = new Player(width/2, height/2, 30);
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

ArrayList<Tama> Tamas=new ArrayList<Tama>();

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

boolean leftKeyDown, rightKeyDown, upKeyDown, downKeyDown;

void keyPressed() {
  if (keyCode == 'A') {
    leftKeyDown = true;
  } else if (keyCode == 'D') {
    rightKeyDown = true;
  } else if (keyCode == 'W') {
    upKeyDown = true;
  } else if (keyCode == 'S') {
    downKeyDown = true;
  }
}

void keyReleased() {
  if (keyCode == 'A') {
    leftKeyDown = false;
  } else if (keyCode == 'D') {
    rightKeyDown = false;
  } else if (keyCode == 'W') {
    upKeyDown = false;
  } else if (keyCode == 'S') {
    downKeyDown = false;
  }
}
