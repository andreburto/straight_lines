class lineWorker extends coordinateWorker {
  class randomColor {
    public int r; 
    public int g; 
    public int b;
    
    public randomColor() {
      changeColor(colorType.ALL);
    }
    
    public randomColor(colorType ct) {
      changeColor(ct);
    }
    
    public void changeColor(colorType ct) {
      switch(ct) {
        case RED:
          this.r = floor(random(255));
          this.g = 0;
          this.b = 0;
          break;
        case GREEN:
          this.r = 0;
          this.g = floor(random(255));
          this.b = 0;
          break;
        case BLUE:
          this.r = 0;
          this.g = 0;
          this.b = floor(random(255));
          break;
        default:
          this.r = floor(random(255));
          this.g = floor(random(255));
          this.b = floor(random(255));
      }
    }
  }
  
  protected float lineLength = 10;
  protected randomColor rc;
  protected float colorChangeCount = 25;
  protected float colorCounter = 0;
  protected colorType currentC = colorType.ALL;
  
  public lineWorker(float spaceWidth, float spaceHeight) {
    super(random(spaceWidth), random(spaceHeight), spaceWidth, spaceHeight);
    rc = new randomColor();
  }
  
  public lineWorker(float spaceWidth, float spaceHeight, float lineLength) {
    this(spaceWidth, spaceHeight);
    this.lineLength = lineLength;
  }
  
  public lineWorker(float spaceWidth, float spaceHeight, float lineLength, colorType ct) {
    this(spaceWidth, spaceHeight);
    this.lineLength = lineLength;
    this.currentC = ct;
    
    // Reset the random color.
    rc.changeColor(currentC);
  }
  
  public void drawLine() {
    stroke(rc.r, rc.g, rc.b);
    strokeWeight(1);
    noFill();
    
    for (float counter = 0; counter < lineLength; counter++) {
      point(x, y);
      updateLocation();
    }
    
    changeDirection();
    
    colorCounter += 1;
    
    if (colorCounter == colorChangeCount) {
      rc.changeColor(currentC);
      colorCounter = 0;
    }
  }
}
