class Shape {
  float x, y; // Position
  color fillColor;
  String shapeType; // Square, Triangle, and Circle
  float size; // Size of the shape

  // Constructor
  Shape(float x, float y, color fillColor, String shapeType, float size) {
    this.x = x;
    this.y = y;
    this.fillColor = fillColor;
    this.shapeType = shapeType;
    this.size = size;
  }

  // Draw the shape
  void draw() {
    fill(fillColor);
    if (shapeType.equals("Square")) {
      rectMode(CENTER);
      rect(x, y, size, size); // Draw a square
    } else if (shapeType.equals("Triangle")) {
      // Draw a triangle
      triangle(x - size/2, y + size/2, x + size/2, y + size/2, x, y - size/2);
    } else if (shapeType.equals("Circle")) {
      ellipseMode(CENTER);
      ellipse(x, y, size, size); // Draw a circle
    }
  }
}






