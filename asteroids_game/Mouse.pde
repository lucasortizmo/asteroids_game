void mouseReleased () {

  // click mode framework
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

// intro clicks function
void introClicks () {
  startg(400, 450, 200, 100);

  // reset variables in intro
  myObjects.add(myShip);
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new UFO());
}

// game clicks function
void gameClicks () {
  pauseg(100, 100, 100);
}

// gameover clicks function
void gameoverClicks () {

  // play again button reset
  if (gameOver == true) {
    if (dist(mouseX, mouseY, width/2, height/2) < 110) mode = INTRO;
  }

  if (gameOver == false) {
    if (dist(mouseX, mouseY, width/2, height/2) < 110) mode = INTRO;
  }
}

// pause clicks function
void pauseClicks () {

  // resume button function
  if (mouseX > 340 && mouseX < 460 && mouseY > 250 && mouseY < 350) {
    mode = GAME;
  }
}

// start game button function
void startg (int x, int y, int w, int h) {
  if (mouseX > x - w/2 && mouseX < x + w/2 && mouseY > y - h/2 && mouseY < y + h/2) {
    mode = GAME;
  }
}

// pause game button function
void pauseg (int x, int y, int s) {
  if ((dist(mouseX, mouseY, x, y) < s/2)) mode = PAUSE;
}
