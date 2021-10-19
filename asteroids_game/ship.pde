class Ship extends GameObject {

  // instance variables
  PVector direction;
  int shotTimer, threshold;
  int t; // immunity timer

  // constructor
  Ship() {
    lives = 3;
    location = new PVector(400, 300);
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.05);
    shotTimer = 0;
    threshold = 40;
    t = 0;
  }

  // Behaviour Functions
  void show () {

    // ship visual
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    if (immune == false) {
      fill(255);
      stroke(255);
      ellipse(0, 0, 50, 18);
      fill(0);
      triangle(-25, -12.5, -25, 12.5, 25, 0);
    } else if (immune == true) {
      fill(255);
      stroke(255);
      ellipse(0, 0, 50, 18);
      fill(27, 247, 12);
      triangle(-25, -12.5, -25, 12.5, 25, 0);
      t++;
    }
    popMatrix();
  }

  void act () {
    super.act();
    shotTimer++;

    // keyboard controls
    if (upkey) {
      velocity.add(direction);
      myObjects.add(new Fire());
    }
    if (downkey) velocity.sub(direction);
    if (leftkey) direction.rotate(- radians(3));
    if (rightkey) direction.rotate(radians(3));
    if (spacekey && shotTimer > threshold) {
      myObjects.add(new Bullet());
      shotTimer = 0;
    }

    // immunity reset and timer
    if (t > 400) {
      t = 0;
      immune = false;
    }

    // location and velocity reset once destroyed
    if (lives == 0) {
      gameOver = false;
      lives = 3;
      Alives = 9;
      myShip.velocity.x = 0;
      myShip.velocity.y = 0;
      myShip.location.x = width/2;
      myShip.location.y = height/2;
      myShip.direction.x = 0;
    }
  }
}
