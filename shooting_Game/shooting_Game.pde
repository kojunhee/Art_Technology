import ddf.minim.*;

PImage p2;


Minim minim;
AudioPlayer music;
AudioMetaData meta;

final int MAX_BLK = 30;    
final color BCK_COLOR = color(130,210,50);  
final color LINE_COLOR = color(189);   
final int GRID_SPACE = 25;  
final int MAKE_TIME = 60*2;   
final int EXIST_TIME = 60*3;



int SCORE = 0;
boolean GameStart = false;
boolean GameJudge = true;

ArrayList<Block> allBCK = new ArrayList<Block>();
Player player; 
Player player2; 


void setup() {
  size(800, 600); 
  //size(showWidth,showHeight);
  player = new Player(width/2-30, height/2, 30, 100, 1);
  player2 = new Player(width/2+30, height/2, 50, 1000, 2);
  
  p2 = loadImage("player2.png");
  minim = new Minim(this);
  music = minim.loadFile("whatdoicallyou.mp3", 2048);
  meta = music.getMetaData();
  
  
}

color c1= color(255,0,0);
color c2= color(255,255,0);
color c3= color(0,240,170);
void draw( ) {
  if (GameJudge==true) {
    drawBG();
    drawPlayer();
   
   
    if(GameStart==true){
      drawAllBlk();
      if (frameCount % MAKE_TIME == 0 && allBCK.size() < MAX_BLK) {
        addBLK();
      } 
      drawSCORE();
    }
    else{
      textSize(25);
      fill(0);
      text("GIST 2021 Spring Semester", 0,50);
      
      fill(170,170,245);
      rect(0,500,350,100,30);
      textSize(25);
      fill(0);
      text("Character Style 1P & 2P", 0,480);
      
      fill(c1);
      ellipse(50,550,50,50); //style1 for 1
      fill(c2);
      ellipse(100,550,50,50); //style1 for 1
      fill(c3);
      ellipse(150,550,50,50); //style1 for 1
      fill(c1);
      ellipse(210,550,50,50); //style1 for 2
      fill(c2);
      ellipse(260,550,50,50); //style1 for 2
      fill(c3);
      ellipse(310,550,50,50); //style1 for 2
      
      fill(170,170,245);
      rect(380,500,420,100,30);
      textSize(25);
      fill(0);
      text("   Music", 700,480);
      fill(250);
      ellipse(650,550,50,50); //music1
      ellipse(700,550,50,50); //music2
      ellipse(750,550,50,50); //music3
      fill(0);
      text(meta.title(), 400, 550);
      text(meta.author(),400, 575);
      text("1",640,560);
      text("2",690,560);
      text("3",740,560);
      
      textSize(83);
      fill(0);
      text("Art And Technology", 0,200);
      
      fill(170,170,245);
      rect(300,380,200,100,30); // start button
      textSize(25);
      fill(0);
      text("   GAME START", 300,430);
    }
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
  SankakuR = 30; //Block size touituka(30/2), Player Hankei sansyou
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
void mousePressed(){
  if(!GameStart){
  if(25<mouseX && mouseX<75 && 525<mouseY && mouseY<575 ){
    player.FILL_COLOR= c1;
  }
  if(75<mouseX && mouseX<125 && 525<mouseY && mouseY<575 ){
    player.FILL_COLOR= c2;
  }
  if(125<mouseX && mouseX<175 && 525<mouseY && mouseY<575 ){
    player.FILL_COLOR= c3;
  }
  if(185<mouseX && mouseX<235 && 525<mouseY && mouseY<575 ){
    player2.FILL_COLOR= c1;
  }
  if(235<mouseX && mouseX<285 && 525<mouseY && mouseY<575 ){
    player2.FILL_COLOR= c2;
  }
  if(285<mouseX && mouseX<335 && 525<mouseY && mouseY<575 ){
    player2.FILL_COLOR= c3;
  }
  if(625<mouseX && mouseX<675 && 525<mouseY && mouseY<575){
    music.pause();
    music = minim.loadFile("whatdoicallyou.mp3", 2048);
    music.play();
    meta = music.getMetaData();
  }
  if(675<mouseX && mouseX<725 && 525<mouseY && mouseY<575){
    music.pause();
    music = minim.loadFile("celebrity.mp3", 2048);
    music.play();
    meta = music.getMetaData();
  }
  if(725<mouseX && mouseX<775 && 525<mouseY && mouseY<575){
    music.pause();
    music = minim.loadFile("gone.mp3", 2048);
    music.play();
    meta = music.getMetaData();
  }
  if(300<mouseX && mouseX<500 && 380<mouseY && mouseY<480 ){
    GameStart = true;
  }
  }
}
