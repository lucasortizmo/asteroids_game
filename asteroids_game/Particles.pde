class Particles extends GameObject {
  float w;
  int t;
  PVector nudge;
  PVector direction;

  Particles (float x, float y, float vx, float vy) {
    t = 255;
    lives = 1;
    location = new PVector (x, y);
    velocity = new PVector (vx, vy);
    w = (random(1, 3));
    velocity.rotate(random(-360, 360));
    vx = (random(-2, 2));
    vy = (random(-2, 2));
  }

  void show () {
    fill(255, t);
    square(location.x, location.y, w);
  }

  void act () {
    super.act();
    t = t - 7;
    if (t <= 0) lives = 0;
  }
}
