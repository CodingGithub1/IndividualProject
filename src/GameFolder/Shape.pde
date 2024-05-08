class Shape {
  float x, y; // Position
  color fillColor;
  String shapeType; // Square, Triangle, and Circle

  // Constructor
  Shape(float x, float y, color fillColor, String shapeType) {
    this.x = x;
    this.y = y;
    this.fillColor = fillColor;
    this.shapeType = shapeType;
  }

 // Draw the shape
void draw() {
  fill(fillColor);
  if (shapeType.equals("Square")) {
    rectMode(CENTER);
    rect(x, y, 50, 50); // Draw a square
  } else if (shapeType.equals("Triangle")) {
    // Draw a triangle
    triangle(x - 25, y + 20, x + 25, y + 20, x, y - 30);
  } else if (shapeType.equals("Circle")) {
    ellipseMode(CENTER);
    ellipse(x, y, 50, 50); // Draw a circle
  }
}






