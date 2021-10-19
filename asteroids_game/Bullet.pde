class Bullet extends GameObject {

  int timer; // bullet range
  
  // constructor
  Bullet () {
    timer = 60;
    lives = 1;
    location = new PVector (myShip.location.x, myShip.location.y);
    velocity = new PVector (myShip.direction.x, myShip.direction.y);
    velocity.setMag(10);
    size = 10;
  }
  
  // behaviour funcitons
  void show () {
    
    // bullet visual
    stroke(255);
    noFill();
    ellipse(location.x, location.y, size, size);
  }

  void act () {
    super.act();
    
    // bullet range
    timer--;
    if (timer == 0) lives = 0;
  }
}
