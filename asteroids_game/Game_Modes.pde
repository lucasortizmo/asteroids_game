void game () {
  background(0);
  int i = 0;
  while (i < myObjects.size()) {
    GameObject myObj = myObjects.get(i);
    myObj.show();
    myObj.act();
    if (myObj.lives == 0) {
      myObjects.remove(i);
    } else {
      i++;
    }
  }
  pausebutton(100, 100, 100);
  
}

void intro () {

  // gif INTRO
  rectMode(CENTER);
  image(gif[frame], width/2, height/2, width, height);
  frame++;
  if (frame == numberOfFrames) frame = 0;

  fill(255, 0, 0);
  textFont(asteroids);
  text("ASTEROIDS", width/2 - 150, height/2 - 100);

  startbutton (400, 450, 200, 100);
  
  int i = 0;
  while (i < myObjects.size()) {
    myObjects.remove(i);
  }
}

void gameover () {
  if (gameOver == false) {
  rectMode(CORNER);
  noStroke();
  fill(bloodred);
  rect(0, 0, width, height/2);
  fill(0);
  rect(0, height/2, width , height/2);
  fill(0);
  textFont(game);
  textSize(100);
  text("GAME", width/2 - 150, height/4);
  textFont(game);
  textSize(100);
  fill(bloodred);
  text("OVER", width/2 - 150, height/2 + 250);
  
  playagaintactile(255, 0); 
}
if (gameOver == true) {
  rectMode(CORNER);
  noStroke();
  fill(greenbanana);
  rect(0, 0, width, height/2);
  fill(0);
  rect(0, height/2, width , height/2);
  fill(0);
  textFont(game);
  textSize(100);
  text("YOU", width/2 - 110, height/4);
  textFont(game);
  textSize(100);
  fill(greenbanana);
  text("WIN", width/2 - 110, height/2+250);
  
  playagaintactile(255, 0);
}
}
  
void pause () {
  image(space, width/2, height/2, width, height);
  tactileback(400, 300, 100, 100);

// ship vel
  myShip.velocity = new PVector(0, 0);
}

void startbutton (int x, int y, int w, int h) {
  if (mouseX > x - w/2 && mouseX < x + w/2 && mouseY > y - h/2 && mouseY < y + h/2) {
    strokeWeight(5);
    stroke(0);
    fill(255, 0, 0);
    rect(x, y, w + 20, h + 20);
    fill(0);
    text("START", x - 90 , y + 20);
  } else {
    noStroke();
    fill(255, 0, 0);
    rect(x, y, w, h);
    fill(0);
    text("START", x - 90, y + 20);
  }
}


void pausebutton (int x, int y, int s) {
  if (mode == GAME) {
  if (dist(mouseX, mouseY, x, y) < s/2) {
    strokeWeight(5);
    stroke(0);
    fill(255, 0, 0);
    circle(x, y, s + 20);
    fill(255);
    textSize(20);
    text("PAUSE", x - 40, y + 10);
  } else {
    noStroke();
    fill(255, 0, 0);
    circle(x, y, s);
    fill(0);
    textSize(20);
    text("PAUSE", x - 40, y + 10);
  }
  }
}

void tactileback (int x, int y, int w, int h) {
   if (mouseX > x - w/2 -10 && mouseX < x + w/2 + 10 && mouseY > y - h/2 && mouseY < y + h/2) {
    fill(255);
    stroke(0);
    strokeWeight(3);
    rect(x, y, w + 20, h);
    fill(0);
    text("RESUME", x - 49, y + 10);
  } else {
    fill(0);
    stroke(255);
    strokeWeight(3);
    rect(x, y, w + 20, h);
    fill(255);
    text("RESUME", x - 49, y + 10);
  }
}

void playagaintactile (int x, int y) {
  if (dist(mouseX, mouseY, width/2, height/2) < 110) {
  fill(x);
  circle(width/2, height/2, 250);
  fill(y);
  textSize(35);
  text("Play Again", width/2 - 100, height/2);
  } else {
  fill(x);
  circle(width/2, height/2, 220);
  fill(y);
  textSize(35);
  text("Play Again", width/2 - 100, height/2);
  }
}
