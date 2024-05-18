class Timer {
  int startTime;
  int elapsedTime;
  boolean running;

  // Constructor
  Timer() {
    startTime = 0;
    elapsedTime = 0;
    running = false;
  }

  // Start the timer
  void start() {
    startTime = millis();
    running = true;
  }

  // Stop the timer
  void stop() {
    elapsedTime = millis() - startTime;
    running = false;
  }

  // Get the elapsed time
  int getElapsedTime() {
    if (running) {
      return millis() - startTime;
    } else {
      return elapsedTime;
    }
  }

  // Check if the timer has reached 60 seconds
  boolean hasReachedLimit() {
    return getElapsedTime() >= 60000; // 60 seconds = 60000 milliseconds
  }

  // Display the elapsed time
  void display() {
    int seconds = getElapsedTime() / 1000;
    fill(0,255,0);
    textSize(60);
    textAlign(CENTER, CENTER);
    text("Timer: " + seconds + "s", width - 150, 350); // Display the time at the top-right corner
  }
}
