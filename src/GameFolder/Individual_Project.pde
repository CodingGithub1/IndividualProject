//Aayush Silwal| 10 Apr 2023 | Bullseye Bonanza

//Aayush Silwal| 10 Apr 2023 | Bullseye Bonanza

PImage startGame;
PImage appScreen;
ArrayList<Shape> shapes = new ArrayList<Shape>();
int score;
boolean play;

void setup() {
  size(1500, 1000);
  startGame = loadImage("StartScreen.png");
  appScreen = loadImage("GUIMOCKUP.png");
  play = false;
}

void draw() {
  if (!play) {
    startScreen(); 
  }else{
    displayAppScreen();
  }
}
void displayAppScreen(){
//Set it to center
  imageMode (CENTER);
 //Draw image at center of canvas
  image(appScreen, width/2, height/2, width, height);
  }

void startScreen() {
  //Set it to center
  imageMode (CENTER);
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
