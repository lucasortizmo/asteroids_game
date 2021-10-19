class UFOBullet extends GameObject {

  // instance variables
  int timer; // shot range

  // constructor
  UFOBullet (float vx, float vy, float x, float y) {
    timer = 100;
    lives = 1;
    location = new PVector (x, y);
    velocity = new PVector (vx, vy);
    velocity.setMag(5);
    size = 10;
  }

  // behaviour functions
  void show () {

    // bullet visual
    noStroke();
    fill(255, 0, 0);
    ellipse(location.x, location.y, size, size);
  }

  void act () {
    super.act();

    // shot range
    timer--;
    if (timer == 0) lives = 0;

    // collision with ship to trigger life loss and immunity
    if (mode == GAME) {
      if (dist(location.x, location.y, myShip.location.x, myShip.location.y) < 28) {
        if (immune == false) myShip.lives--;
        immune = true;
      }
    }

    // change mode to gameover when ship dies
    if (myShip.lives == 0) {
      gameOver = false;
      mode = GAMEOVER;
    }
  }
}
