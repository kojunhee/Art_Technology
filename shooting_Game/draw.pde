void drawBG() {
  background(BCK_COLOR);
  strokeWeight(1);   
}

void drawAllBlk() {
  for (int i = 0; i < allBCK.size(); i++) {
    allBCK.get(i).show();
  }
}
void drawPlayer() {
  player.show();
}
