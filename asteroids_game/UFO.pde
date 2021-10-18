class UFO extends GameObject {

int u;
int t;

//Bullets from UFO
int shotTimer, threshold;

// bullet aiming
float vx, vy;

  UFO () {
    lives = 1;
    t = 0;
    u = int(random(0, 4));
    
    if (u == 1) {
      location = new PVector (840, random(0, 600));
      velocity = new PVector (-1, 0);
    } else if (u == 0) {
      location = new PVector (random(0, 800), -40);
      velocity = new PVector (0, 1);
    } else if (u == 2) {
      location = new PVector (random(0, 800), 640);
      velocity = new PVector (0, -1);
    } else if (u == 3) {
      location = new PVector (-40, random(0, 600));
      velocity = new PVector (1, 0);
    }
    
    // Bullets' control
    shotTimer = 0;
    threshold = 50;
    
    // aiming
    vx = myShip.location.x - location.x;
    vy = myShip.location.y - location.y;
  }   


  void show () {

    pushMatrix();
    translate(location.x, location.y);
    noStroke();
    fill(255, 0, 0);
    circle(0, 0, 30);
    ellipse(0, 10, 60, 30);
    popMatrix();
    
  }

  void act () {
    super.act();
    shotTimer++;
    
    
    if(location.x > 830 || location.x < -30 || location.y > 630 || location.y < -30) {
     t++;
     velocity = new PVector (0, 0);
     if (t > 700) {
      u = int(random(0, 4)); 
      t = 0;
    
    if (u == 1) {
      location = new PVector (800, random(0, 600));
      velocity = new PVector (-1, 0);
    } else if (u == 0) {
      location = new PVector (random(0, 800), 0);
      velocity = new PVector (0, 1);
    } else if (u == 2) {
      location = new PVector (random(0, 800), 600);
      velocity = new PVector (0, -1);
    } else if (u == 3) {
      location = new PVector (0, random(0, 600));
      velocity = new PVector (1, 0);
    }
     }
    } else {
    if (shotTimer > threshold) {
      myObjects.add(new UFOBullet(vx, vy, location.x, location.y));
      vx = myShip.location.x - location.x;
      vy = myShip.location.y - location.y;
      shotTimer = 0;
    }
    }  
      }  
}
