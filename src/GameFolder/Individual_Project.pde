//Aayush Silwal| 10 Apr 2023 | Bullseye Bonanza

PImage startGame;
PImage appScreen;

int score;
boolean play;
// Draw all shapes
Shape[] shapes = new Shape[3];

void setup() {
  size(1500, 1000);
  startGame = loadImage("StartScreen.png");
  appScreen = loadImage("Background.png");
  play = false;

  // Create shapes
  shapes[0] = new Shape(100.0, 100.0, color(255, 0, 0), "Square");
  shapes[1] = new Shape(200.0, 100.0, color(0, 255, 0), "Triangle");
  shapes[2] = new Shape(300.0, 100.0, color(0, 0, 255), "Circle");
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
