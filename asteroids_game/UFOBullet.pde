class UFOBullet extends GameObject {

  int timer;
     
  UFOBullet (float vx, float vy, float x, float y) {
    timer = 100;
    lives = 1;
    location = new PVector (x, y);
    velocity = new PVector (vx, vy);
    velocity.setMag(5);
    size = 10;
  }

 void show () {
    noStroke();
    fill(255, 0, 0);
    ellipse(location.x, location.y, size, size);
  }

  void act () {
    super.act();

    timer--;
    if (timer == 0) lives = 0;
     
     if (mode == GAME) {
     if (dist(location.x, location.y, myShip.location.x, myShip.location.y) < 28) {
     if (immune == false) myShip.lives--;
             immune = true;
     }
     }
     if (myShip.lives == 0) {
       gameOver = false;
       mode = GAMEOVER;
     }
  }
  
 

}
