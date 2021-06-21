void GameOver() {
  int ms = millis()/1000;
  int TimeLimit = 15;
  int CountDown; 
  CountDown = TimeLimit - ms;
  if (CountDown > 0) {
    drawBG();
    drawAllBlk();
    drawSCORE();
    textSize(80);
    fill(#F6FF0D);
    text("GAME OVER", 160, height/2);
    textSize(30);
    fill(#0D12FF);
    text("RESTART : "+CountDown, 290, height/2-80);
  } else {
    GameJudge=true;
    init();
  }
}

void init() {
  allBCK.clear();
  Tamas.clear();

  SCORE=0;
  player.movementSpeed=2;
  player.bulletSpeed = 5;    
  player.reloadTime = 60; 
  player.Damage =20;
  player.flag=true;
  player.isBack = true;
  player =new Player(width/2, height/2, 30,100);
  player2 =new Player(width/2, height/2, 50,1000000);
}
