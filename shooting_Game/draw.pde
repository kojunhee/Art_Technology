int k=0;
boolean turn = false;
void drawBG() {
  background(0,200,100+k);
    if(turn==false)
      k++;
    if(k>100){
      turn=true;
    }
    if(turn==true){
      k--;
    }
    if(k<0){
      turn=false;
  }
  strokeWeight(1);   
}

void drawAllBlk() {
  for (int i = 0; i < allBCK.size(); i++) {
    allBCK.get(i).show();
  }
}
void drawPlayer() {
  player.show();
  player2.show();
}
