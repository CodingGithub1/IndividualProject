//Aayush Silwal| 10 Apr 2023 | Bullseye Bonanza

PImage startGame;
PImage appScreen;

int score;
boolean play;
// Draw all shapes
int maxShapes = 50;
Shape[] shapes; //Declare the shapes array

void setup() {
  size(1500, 1000);
  startGame = loadImage("StartScreen.png");
  appScreen = loadImage("Background.png");
  play = false;

  // Define boundaries
  float boundaryStartX = 120; // Start a little bit right of the left screen
  float boundaryEndX = width * 0.77;
  float boundaryStartY = 50;
  float boundaryEndY = height * 0.73;
  // Initialize array for shapes
  shapes = new Shape[maxShapes];

  // Create shapes
  for (int i = 0; i < maxShapes; i++) {
    float xPos, yPos;
    boolean overlapping;

    do {
      overlapping = false;
      // Random x position within the defined boundaries
      xPos = random(boundaryStartX, boundaryEndX );
      // Random y position within the top boundary
      yPos = random(boundaryStartY, boundaryEndY);

      // Check for collision with existing shapes
      for (int j = 0; j < i; j++) {
        if (dist(xPos, yPos, shapes[j].x, shapes[j].y) < shapes[j].size + 40) {
          overlapping = true;
          break;
        }
      }
    } while (overlapping);

    // Randomly choose shape type
    String[] possibleShapes = {"Square", "Triangle", "Circle"};
    String randomShape = possibleShapes[int(random(possibleShapes.length))];

    // Randomly generate color
    color randomColor = color(random(255), random(255), random(255));

    shapes[i] = new Shape(xPos, yPos, randomColor, randomShape, 50);
  }
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
