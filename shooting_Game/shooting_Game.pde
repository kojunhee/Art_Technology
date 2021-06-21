final color BCK_COLOR = color(205);  
final color LINE_COLOR = color(189);   
final int GRID_SPACE = 25;  
final int MAKE_TIME = 60*2;   
final int EXIST_TIME = 60*3;

int STAGE_NUM = 0;
int MAX_BLK = 0;  
int SCORE = 0;
int GAME_STYLE = 2;
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
    
    if(allBCK.size()==0){
      player.x = width/2;
      player.y = height/2;
      STAGE_NUM++;
      MAX_BLK++;
      if(GAME_STYLE==1){
        for(int i =0; i< MAX_BLK;i++) {
            addBLK();
        }
      }
      else if(GAME_STYLE==2){
        addBLK();
      }
    }
    
    
    drawBG();
    drawPlayer();
    
    
    
    
    drawAllBlk();
 
    drawSCORE();
  } else if (GameJudge!=true) {
    GameOver();
  }
}


void addBLK() {
  float x, y;
  int RecHP = 40;
  int TriHP = 20;
  int PenHP = 60;
  int HexHP = 80;
  if(GAME_STYLE==1){
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
  }
  else if(GAME_STYLE==2){
    switch(STAGE_NUM){
      case 1:
        allBCK.add(new Triangle3 (100, 100, TriHP));
        allBCK.add(new Triangle3 (100, 300, TriHP));
        allBCK.add(new Triangle3 (100, 500, TriHP));
        allBCK.add(new Triangle3 (600, 100, TriHP));
        allBCK.add(new Triangle3 (600, 300, TriHP));
        allBCK.add(new Triangle3 (600, 500, TriHP));
        break;
      case 2: 
        allBCK.add(new Pentagon5 (100, 100, PenHP));
        allBCK.add(new Pentagon5 (100, 300, PenHP));
        allBCK.add(new Pentagon5 (100, 500, PenHP));
        allBCK.add(new Pentagon5 (600, 100, PenHP));
        allBCK.add(new Pentagon5 (600, 300, PenHP));
        allBCK.add(new Pentagon5 (600, 500, PenHP));
        break;
      case 3: 
        allBCK.add(new Triangle3 (100, 100, TriHP));
        allBCK.add(new Triangle3 (100, 300, TriHP));
        allBCK.add(new Triangle3 (100, 500, TriHP));
        allBCK.add(new Triangle3 (600, 100, TriHP));
        allBCK.add(new Triangle3 (600, 300, TriHP));
        allBCK.add(new Triangle3 (600, 500, TriHP));
        break;
      default: 
        break;
   }
  }

  //if(i==5){allBCK.remove(0);}
}


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
