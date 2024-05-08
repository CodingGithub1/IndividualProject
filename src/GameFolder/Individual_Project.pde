//Aayush Silwal| 10 Apr 2023 | Bullseye Bonanza

PImage startGame;
PImage appScreen;

int score;
boolean play;
// Draw all shapes
int maxShapes = 10;
Shape[] shapes; //Declare the shapes array

void setup() {
  size(1500, 1000);
  startGame = loadImage("StartScreen.png");
  appScreen = loadImage("Background.png");
  play = false;

  //Initializing list for shapes
  ArrayList<Shape> shapesList = new ArrayList<Shape>();

 
  // Create shapes till condition
  while (shapesList.size() < maxShapes) {
    float xPos = (width);
    float yPos = (height);

    //Random shape
    shapesList.add(new Shape(xPos, yPos, color(random(255), random(255), random(255)), "Random Shape"));
  }

  //Convert the list to an array
  shapes = shapesList.toArray(new Shape[0]);
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    displayAppScreen();

    // Draw all shapes
    for (int i = 0; i < shapes.length; i++) {
      shapes[i].draw();
    }
  }
}

void displayAppScreen() {
  //Set it to center
  imageMode(CENTER);
  //Draw image at center of canvas
  image(appScreen, width/2, height/2, width, height);
}

void startScreen() {
  //Set it to center
  imageMode(CENTER);
  //Draw image at center of canvas
  image(startGame, width/2, height/2, width, height);
  if (mousePressed || keyPressed) {
    play = true;
  }
}

void mousePressed() {
  if (!play && mouseX > width/2 - startGame.width/2 && mouseX < width/2 + startGame.width/2 &&
    mouseY > height/2 - startGame.height/2 && mouseY < height/2 + startGame.height/2) {
    play = true;
  }
}


