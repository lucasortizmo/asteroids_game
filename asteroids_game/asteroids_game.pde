// Lucas Ortiz Molina
// 1 - 4
// Sunday October 17th 


// color palette
color bloodred = #FF0705;
color greenbanana = #C6ED79;

// pause image
PImage space;

// gif array INTRO
PImage[] gif;
int numberOfFrames;
int frame;

// keyboard controls
boolean upkey, downkey, leftkey, rightkey, spacekey;

// calling classes
Ship myShip;
UFO myUFO;
Asteroid myAsteroid;

// game engine array list
ArrayList<GameObject> myObjects;

// immunity detection
boolean immune;

// Win/Lose
boolean gameOver;

// asteroid life counter
int Alives;

// mode framework
int mode;
final int INTRO = 1;
final int GAME = 2;
final int GAMEOVER = 3;
final int PAUSE = 4;

// fonts
PFont asteroids;
PFont game;
PFont DemiBold;

void setup () {

  // visuals initialization
  size(800, 600, FX2D);
  imageMode(CENTER);
  rectMode(CENTER);

  // class construction
  myShip = new Ship();
  myUFO = new UFO();
  myAsteroid = new Asteroid();
  myObjects = new ArrayList<GameObject>();


  // mode initialization
  mode = INTRO;
  Alives = 9;

  // immunity detection
  immune = false;

  // gif array INTRO
  numberOfFrames = 30;
  gif = new PImage [numberOfFrames];
  int i = 0;
  while (i < numberOfFrames) {
    gif[i] = loadImage("intro_gif/frame_"+i+"_delay-0.04s.gif");
    i++;
  }

  // intitialize win/lose 
  gameOver = false;

  // fonts
  asteroids = loadFont("CopperplateGothic-Bold-48.vlw");
  game = loadFont("BookmanOldStyle-BoldItalic-48.vlw");

  // pause screen
  space = loadImage("space.jpg");
}

void draw () {
  game();

  // mode framework
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == GAMEOVER) { 
    gameover();
  } else if (mode == PAUSE) {
    pause();
  }
}

// keyboard game functions
void keyPressed () {
  if (key == 'w') upkey = true;
  if (key == 's') downkey = true;
  if (key == 'a') leftkey = true;
  if (key == 'd') rightkey = true;
  if (key == ' ') spacekey = true;

  if (key == 'W') upkey = true;
  if (key == 'S') downkey = true;
  if (key == 'A') leftkey = true;
  if (key == 'D') rightkey = true;
  if (key == ' ') spacekey = true;
}

void keyReleased () {
  if (key == 'w') upkey = false;
  if (key == 's') downkey = false;
  if (key == 'a') leftkey = false;
  if (key == 'd') rightkey = false;
  if (key == ' ') spacekey = false;

  if (key == 'W') upkey = false;
  if (key == 'S') downkey = false;
  if (key == 'A') leftkey = false;
  if (key == 'D') rightkey = false;
  if (key == ' ') spacekey = false;
}
