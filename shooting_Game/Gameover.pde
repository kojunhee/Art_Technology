void GameOver() {
  int ms = millis()/1000;
  int TimeLimit = 15;
  int CountDown; 
  CountDown = TimeLimit - ms;
  if (CountDown > 0) {
    drawBG();
    drawAllBlk();
    textSize(80);
    fill(#F6FF0D);
    text("GAME OVER", 160, height/2);
    textSize(30);
    fill(#0D12FF);
    text("RESTART : "+CountDown, 290, height/2-80);
  } 
  else {
    GameJudge=true;
    init();
  }
}

void init() {
  allBCK.clear();
  Attacks.clear();
  STAGE_NUM = 0;
  MAX_BLK = 0;    
  SCORE = 0;
  GAME_MODE = 2;
  GameStart = false;
  GameJudge = true;
  player.movementSpeed=2;
  player.bulletSpeed = 5;    
  player.reloadTime = 60; 
  player.Damage =20;
  player.flag=true;
  player.isBack = true;
  player.HP = 100;
  player2.movementSpeed=2;
  player2.bulletSpeed = 5;    
  player2.reloadTime = 60; 
  player2.Damage =20;
  player2.flag=true;
  player2.isBack = true;
  player2.HP = 100;
  
  player =new Player(width/2-30, height/2, 30,100,1);
  player2 =new Player(width/2+30, height/2, 50,100,2);
}
