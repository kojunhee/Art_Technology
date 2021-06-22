import ddf.minim.*;

PImage p1;
PImage p2;
PImage enemy;

ParticleSystem ps;
Minim minim;
AudioPlayer music;
AudioMetaData meta;

final color BCK_COLOR = color(130,210,50);  
final color LINE_COLOR = color(189);   
final int GRID_SPACE = 25;  
final int MAKE_TIME = 60*2;   
final int EXIST_TIME = 60*6;

int STAGE_NUM = 0;
int MAX_BLK = 0;  
int SCORE = 0;
int GAME_MODE = 2;
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
  
  p1 = loadImage("player1.png");
  p2 = loadImage("player2.png");
  enemy = loadImage("enemy.png");
  
  minim = new Minim(this);
  music = minim.loadFile("Sci-Fi.mp3", 2048);
  meta = music.getMetaData();
  ps = new ParticleSystem(new PVector(width/2, 200));
  
  
}

color c1= color(255,0,0);
color c2= color(255,255,0);
color c3= color(0,240,170);
void draw( ) {
  if (GameJudge==true) {
    drawBG();
    drawPlayer();
   
    if(GameStart==true){
      drawSCORE();
      if(allBCK.size()==0){
      player.x = width/2-30;
      player.y = height/2;
      player2.x = width/2+30;
      player2.y = height/2;
      if (STAGE_NUM<4){
        STAGE_NUM++;
      }
      else if(STAGE_NUM==4){
        textSize(70);
        fill(#F6FF0D);
        text("CONGRATULATIONS!", 50, height/2); 
        textSize(50);
        fill(#F6FF0D);
        text("Your Score :" + (SCORE+player.HP), 50, height/2+100); 
        fill(170,170,245);
        rect(380,450,200,100,30); // start button 2
        textSize(50);
        fill(0);
        text(" HOME", 385,515);
        ps.addParticle();
        ps.run();
      }
      MAX_BLK++;
        if(GAME_MODE==1){
          for(int i =0; i< MAX_BLK;i++) {
              addBLK();
          }
        } 
        else if(GAME_MODE==2){
          addBLK();
        }
      }
        if(GAME_MODE==2){
          textSize(30);
          fill(#0D12FF);
          text("Stage " + STAGE_NUM, 320, height/2-250);
        }
        else if(GAME_MODE==1){
          textSize(30);
          fill(#0D12FF);
          text("Stage " + MAX_BLK, 320, height/2-250);
        }
    
      drawAllBlk();
      if (frameCount % MAKE_TIME == 0) {
        for(k=0 ; k<allBCK.size() ; k++){
          allBCK.get(k).shot();
        }
      } 
    }
    else{
      textSize(30);
      fill(#0D12FF);
      text("KO*(JunHee+SeYeon)", 430, height/2-250);
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
      textSize(20);
      text(meta.author(),400, 575);
      text("1",640,560);
      text("2",690,560);
      text("3",740,560);
      
      textSize(83);
      fill(0);
      text("Art And Technology", 0,200);
      
      fill(170,170,245);
      rect(150,350,200,100,30); // start button 1
      textSize(25);
      fill(0);
      text(" GAME_MODE_1 \n        START", 150,400);
      
      fill(170,170,245);
      rect(380,350,200,100,30); // start button 2
      textSize(25);
      fill(0);
      text(" GAME_MODE_2 \n        START", 380,400);
    }
  } else if (GameJudge!=true) {
    GameOver();
  }
}
//if(150<mouseX && mouseX<350 && 350<mouseY && mouseY<450 ){
//          init();
//        }  

void addBLK() {
  float x, y;
  int RecHP = 60;
  int TriHP = 40;
  int PenHP = 80;
  int HexHP = 100;
  if(GAME_MODE==1){
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
  else if(GAME_MODE==2){
    switch(STAGE_NUM){
      case 1:
        allBCK.add(new Triangle3 (100, 100, TriHP));
        allBCK.add(new Triangle3 (600, 500, TriHP));
        break;
      case 2: 
        allBCK.add(new Pentagon5 (100, 100, PenHP));
        
        allBCK.add(new Pentagon5 (100, 500, PenHP));
        allBCK.add(new Pentagon5 (600, 100, PenHP));
       
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


ArrayList<Attack> Attacks = new ArrayList<Attack>();

  final color FILL_COLOR = color(0, 178, 225);  
  final color enemy_COLOR = color(255, 50, 50);  
  final color BATTERY_COLOR = color(153); 
  int movementSpeed = 2;  
  int bulletSpeed = 5;    
  int reloadTime = 60;    
  int timeCheck = 60;  //time after shot
  int Damage =20;

boolean CheckMan( float Attackx, float Attacky, float Blockx, float Blocky) { //Block&Bullet
  float diffX, diffY, diffR;
  diffX = abs(Attackx - Blockx);
  diffY = abs(Attacky - Blocky); 
  diffR = 30/2 + 15/2; 
  return ( sqrt( sq(diffX) + sq(diffY) ) < diffR );
}
//boolean CheckMan2( float Attackx, float Attacky, float Blockx, float Blocky) { //Block&Player
//  float diffX, diffY, diffR;
//  diffX = abs(Attackx - Blockx);
//  diffY = abs(Attacky - Blocky); 
//  diffR = 30/2 + 30/2; 
//  return ( sqrt( sq(diffX) + sq(diffY) ) < diffR );
//}
boolean CheckMan3( float Attackx, float Attacky, float playerX, float playerY) { //bullet&Player1
  float diffX, diffY, diffR;
  diffX = abs(Attackx - playerX);
  diffY = abs(Attacky - playerY); 
  diffR = 30; 
  return ( sqrt( sq(diffX) + sq(diffY) ) < diffR );
}
boolean CheckMan4( float Attackx, float Attacky, float playerX, float playerY) { //bullet&Player2
  float diffX, diffY, diffR;
  diffX = abs(Attackx - playerX);
  diffY = abs(Attacky - playerY); 
  diffR = 50; 
  return ( sqrt( sq(diffX) + sq(diffY) ) < diffR );
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
  } else if (keyCode == 'P') {
    player.reloadTime = player.reloadTime-10; 
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
      music = minim.loadFile("Sci-Fi.mp3", 2048);
      music.loop();
      meta = music.getMetaData();
    }
    if(675<mouseX && mouseX<725 && 525<mouseY && mouseY<575){
      music.pause();
      music = minim.loadFile("The great battle.mp3", 2048);
      music.loop();
      meta = music.getMetaData();
    }
    if(725<mouseX && mouseX<775 && 525<mouseY && mouseY<575){
      music.pause();
      music = minim.loadFile("Battle Metal.mp3", 2048);
      music.loop();
      meta = music.getMetaData();
    }
    
    if(150<mouseX && mouseX<350 && 350<mouseY && mouseY<450 ){
      GAME_MODE=1;
      GameStart = true;
    }
  
    if(380<mouseX && mouseX<580 && 350<mouseY && mouseY<450 ){
      GAME_MODE=2;
      GameStart = true;
    }
  }
  else if(380<mouseX && mouseX<580 && 450<mouseY && mouseY<550 && STAGE_NUM == 4 ){
      GameJudge=true;
      init();
    }
}
