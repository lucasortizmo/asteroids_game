void mouseReleased () {
  if (mode == INTRO) {
    introClicks();
  } else if (mode == GAME) {
    gameClicks();
  } else if (mode == GAMEOVER) { 
    gameoverClicks();
  } else if (mode == PAUSE) {
    pauseClicks();
  }
}

void introClicks () {
  startg(400, 450, 200, 100);
  myObjects.add(myShip);
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new UFO());
}

void gameClicks () {
  pauseg(100, 100, 100);
}

void gameoverClicks () {
  if (gameOver == true) {
    if (dist(mouseX, mouseY, width/2, height/2) < 110) mode = INTRO;
  }

  if (gameOver == false) {
    if (dist(mouseX, mouseY, width/2, height/2) < 110) mode = INTRO;
}
}

void pauseClicks () {
  if (mouseX > 340 && mouseX < 460 && mouseY > 250 && mouseY < 350) {
    mode = GAME;
  }
}

void startg (int x, int y, int w, int h) {
  if (mouseX > x - w/2 && mouseX < x + w/2 && mouseY > y - h/2 && mouseY < y + h/2) {
    mode = GAME;
  }
}

void pauseg (int x, int y, int s) {
  if ((dist(mouseX, mouseY, x, y) < s/2)) mode = PAUSE;
}
