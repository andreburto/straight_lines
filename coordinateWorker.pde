import java.util.Map;

class coordinate {
  public float x;
  public float y;
  
  public coordinate(float x, float y) {
    this.x = x; 
    this.y = y;
  }
}

class coordinateWorker extends coordinate {
  protected float spaceWidth; 
  protected float spaceHeight;
  protected float changeAmount;
  protected Direction currentD = Direction.NONE;
  protected Direction[] listD = { Direction.UP, Direction.DOWN, Direction.LEFT, Direction.RIGHT };
  protected HashMap<Direction, Direction> oppositeD;
  
  public coordinateWorker(float x, float y, float spaceWidth, float spaceHeight) {
    super(x, y);
    
    this.spaceWidth = spaceWidth;
    this.spaceHeight = spaceHeight;
    
    // setup opposite hash
    oppositeD = new HashMap<Direction, Direction>();
    oppositeD.put(Direction.UP, Direction.DOWN);
    oppositeD.put(Direction.DOWN, Direction.UP);
    oppositeD.put(Direction.LEFT, Direction.RIGHT);
    oppositeD.put(Direction.RIGHT, Direction.LEFT);
    oppositeD.put(Direction.NONE, Direction.NONE);
    
    // setup initial directions
    changeDirection();
    
    // set initial change anount
    changeAmount = 1;
  }
  
  protected Direction randomDirection() {
    return listD[int(random(listD.length))];
  }
  
  protected void changeDirection() {
    Direction newD = randomDirection();
    while (newD == oppositeD.get(currentD) || newD == currentD) {
      newD = randomDirection();
    }
    currentD = newD;
  }
  
  public void updateLocation() {
    float currentX = x;
    float currentY = y;
    
    switch(currentD) {
      case UP:
        if (y > 0)
          y -= changeAmount;
        break;
      case DOWN:
        if (y < spaceHeight)
          y += changeAmount;
        break;
      case LEFT:
        if (x > 0)
          x -= changeAmount;
        break;
      case RIGHT:
        if (x < spaceWidth)
          x += changeAmount;
        break;
      default:
        break;
    }
    
    if (x == currentX && y == currentY) {
      changeDirection();
      updateLocation();
    }
  }
  
  public void setChangeAmount(float newCA) {
    changeAmount = newCA;
  }
  
  public void setDirection(Direction newD) {
    currentD = newD;
  }
  
  public float getChangeAmount() {
    return changeAmount;
  }
  
  public coordinateWorker copy() {
    coordinateWorker copy = new coordinateWorker(x, y, spaceWidth, spaceHeight);
    copy.setChangeAmount(changeAmount);
    return copy;
  }
}
