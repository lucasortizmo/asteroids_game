class Asteroid extends GameObject {

  // initial constructor
  Asteroid() {
    lives = 1;
    location = new PVector (random(0, width), random(0, height));
    velocity = new PVector (0, 1);
    velocity.rotate(random(0, TWO_PI));
    size = 100;
  }

  // custom constructor
  Asteroid(int s, float x, float y) {
    lives = 1;
    location = new PVector (x, y);
    velocity = new PVector (0, 1);
    velocity.rotate(random(0, TWO_PI));
    size = s;
  }

  // behaviour functions
  void show () {

    // Asteroid visual
    noFill();
    stroke(255);
    ellipse(location.x, location.y, size, size);
  }

  void act () {
    super.act();

    // Asteroid collision with bullet
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet) {
        if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size && size > size/4) {
          myObj.lives = 0;
          lives = 0;
          Alives--;

          // particles when broken
          myObjects.add(new Particles(location.x, location.y, velocity.x, velocity.y));
          myObjects.add(new Particles(location.x, location.y, velocity.x, velocity.y));
          myObjects.add(new Particles(location.x, location.y, velocity.x, velocity.y));
          myObjects.add(new Particles(location.x, location.y, velocity.x, velocity.y));
          myObjects.add(new Particles(location.x, location.y, velocity.x, velocity.y));
          myObjects.add(new Particles(location.x, location.y, velocity.x, velocity.y));
          myObjects.add(new Particles(location.x, location.y, velocity.x, velocity.y));
          myObjects.add(new Particles(location.x, location.y, velocity.x, velocity.y));
          myObjects.add(new Particles(location.x, location.y, velocity.x, velocity.y));
          myObjects.add(new Particles(location.x, location.y, velocity.x, velocity.y));

          // creation of smaller Asteroids
          if (size > 50) {
            myObjects.add(new Asteroid(size/2, location.x, location.y));
            myObjects.add(new Asteroid(size/2, location.x, location.y));
          }
        }
      }
      i++;

      // immunity/life loss trigger with Asteroid collision
      if (myObj instanceof Ship) {
        if (mode == GAME) {
          if (dist(location.x, location.y, myObj.location.x, myObj.location.y) < size/2 + 18 && size > size/4) {
            if (immune == false) myObj.lives--;
            immune = true;
          }
        }
      }
    }

    // trigger gameover when all asteroids are destroyed - reset locations and velocities
    if (Alives == 0) { 
      mode = GAMEOVER;
      gameOver = true;
      myShip.lives = 3;
      Alives = 9;
      myShip.velocity.x = 0;
      myShip.velocity.y = 0;
      myShip.location.x = width/2;
      myShip.location.y = height/2;
      myShip.direction.x = 0;
  
    }
  }
}
