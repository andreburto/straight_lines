public enum Direction { 
  NONE, UP, DOWN, LEFT, RIGHT
}

lineWorker lw1, lw2, lw3;

void setup() {
  // Set up the screen
  fullScreen();
  frameRate(30);
  
  lw1 = new lineWorker(width, height, 25);
  lw2 = new lineWorker(width, height, 50);
  lw3 = new lineWorker(width, height, 75);
  
  // Initialize background
  background(#000000);
}

void draw() {
  lw1.drawLine();
  lw2.drawLine();
  lw3.drawLine();
  
  // Save frames for demo movies
  //saveFrame("line-######.png");
  //if (frameCount == 600)
  //  stop();
}
