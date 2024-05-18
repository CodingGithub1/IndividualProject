//Aayush Silwal| 10 Apr 2023 | Bullseye Bonanza

PImage startGame;
PImage appScreen;

int score;
boolean play;
boolean gameOver; // Variable to track game over state
Timer gameTimer; // Create an instance of the Timer class

// Draw all shapes
int maxShapes = 50;
Shape[] shapes; // Declare the shapes array

void setup() {
  size(1500, 1000);
  startGame = loadImage("StartScreen.png");
  appScreen = loadImage("Background.png");
  play = false;
  gameOver = false; // Initialize game over state
  gameTimer = new Timer(); // Initialize the timer
  score = 0; // Initialize the score

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
      xPos = random(boundaryStartX, boundaryEndX);
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
  if (gameOver) {
    gameOverScreen();
  } else if (!play) {
    startScreen();
  } else {
    displayAppScreen();

    // Draw all shapes
    for (int i = 0; i < shapes.length; i++) {
      if (shapes[i] != null) {
        shapes[i].draw();
      }
    }

    // Display the timer
    gameTimer.display();

    // Check if the timer has reached 60 seconds
    if (gameTimer.hasReachedLimit()) {
      play = false;
      gameOver = true;
    }
    
    // Check if all shapes are gone
    if (allShapesGone()) {
      score = 100; // Set score to 100 when all shapes are gone
      play = false;
      gameOver = true;
    }
  }
}

boolean allShapesGone() {
  for (int i = 0; i < shapes.length; i++) {
    if (shapes[i] != null) {
      return false;
    }
  }
  return true;
}

void displayAppScreen() {
  // Set it to center
  imageMode(CENTER);
  // Draw image at center of canvas
  image(appScreen, width / 2, height / 2, width, height);
}

void startScreen() {
  // Set it to center
  imageMode(CENTER);
  // Draw image at center of canvas
  image(startGame, width / 2, height / 2, width, height);
  if (mousePressed || keyPressed) {
    play = true;
    gameOver = false; // Reset game over state
    gameTimer.start(); // Start the timer
  }
}

void gameOverScreen() {
  background(100); // Black background
  fill(255); // White text
  textSize(100);
  textAlign(CENTER, CENTER);
  text("Game Over", width / 2, height / 2 - 100);
  fill(0,0,255);
  textSize(45);
  text("Results", width / 2, height / 2 + 50);
  textSize(32);
    text("Score: " + score + "%", width / 2, height / 2 + 100); // Display score
}


void mousePressed() {
  if (!play && !gameOver && mouseX > width / 2 - startGame.width / 2 && mouseX < width / 2 + startGame.width / 2 &&
      mouseY > height / 2 - startGame.height / 2 && mouseY < height / 2 + startGame.height / 2) {
    play = true;
    gameOver = false; // Reset game over state
    gameTimer.start(); // Start the timer
  } else if (play) {
    for (int i = 0; i < shapes.length; i++) {
      if (shapes[i] != null && shapes[i].isClicked(mouseX, mouseY)) {
        shapes[i] = null; // Remove the shape
        break;
      }
    }
  }
}
