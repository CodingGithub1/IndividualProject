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
      triangle(x - size / 2, y + size / 2, x + size / 2, y + size / 2, x, y - size / 2);
    } else if (shapeType.equals("Circle")) {
      ellipseMode(CENTER);
      ellipse(x, y, size, size); // Draw a circle
    }
  }

  // Check if the shape is clicked
  boolean isClicked(float mx, float my) {
    if (shapeType.equals("Square")) {
      return mx > x - size / 2 && mx < x + size / 2 && my > y - size / 2 && my < y + size / 2;
    } else if (shapeType.equals("Triangle")) {
      return isPointInTriangle(mx, my, x - size / 2, y + size / 2, x + size / 2, y + size / 2, x, y - size / 2);
    } else if (shapeType.equals("Circle")) {
      return dist(mx, my, x, y) < size / 2;
    }
    return false;
  }


  boolean isPointInTriangle(float px, float py, float ax, float ay, float bx, float by, float cx, float cy) {
    float w1 = (ax * (cy - ay) + (py - ay) * (cx - ax) - px * (cy - ay)) / ((by - ay) * (cx - ax) - (bx - ax) * (cy - ay));
    float w2 = (py - ay - w1 * (by - ay)) / (cy - ay);
    return w1 >= 0 && w2 >= 0 && (w1 + w2) <= 1;
  }
}





