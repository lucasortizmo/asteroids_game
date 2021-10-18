class Fire extends GameObject {

  int t; // transparency
  PVector nudge;

  Fire() {
    lives = 1;
    size = int(random(5, 12));
    t = 255;
    location = new PVector (myShip.location.x, myShip.location.y);
    nudge = myShip.direction.copy();
    nudge.rotate(PI);
    nudge.setMag(32);
    location.add(nudge);
    velocity = myShip.direction.copy();
    velocity.rotate(PI+random(-1, 1)); //180 degrees
    velocity.setMag(2);
  }

  void show () {
    noStroke();
    fill(255, 0, 0, t);
    square(location.x, location.y, size);
  }

  void act () {
    super.act();
    t = t - 10;
    if (t <= 0) lives = 0;
  }
}
