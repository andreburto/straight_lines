public enum Direction { 
  NONE, UP, DOWN, LEFT, RIGHT
}

public enum colorType {
  ALL, RED, GREEN, BLUE
}

ArrayList<lineWorker> lineWorkerList;
float[] lineLengths = {25, 50, 75, 100, 100, 75, 50, 25};

void setup() {
  // Set up the screen
  fullScreen();
  frameRate(30);
  
  lineWorkerList = new ArrayList<lineWorker>();
  for (int c = 0; c < lineLengths.length; c++) {
    lineWorkerList.add(new lineWorker(width, height, lineLengths[c], colorType.BLUE));
  }
  
  // Initialize background
  background(#000000);
}

void draw() {
  for (int c = 0; c < lineLengths.length; c++) {
    lineWorkerList.get(c).drawLine();
  }
  
  // Save frames for demo movies
  //saveFrame("line-######.png");
  //if (frameCount == 600)
  //  stop();
}
