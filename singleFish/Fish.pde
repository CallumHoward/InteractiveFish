// ==== Fish ====
public class Fish {

  private float x;
  private float y;
  private float orientation;   // degrees (0, 360]
  private float maxSteer;      // degrees (0, 360]
  private float scale;
  private float tick;
  private color fishColor;
  PShape fishShape;

  // construct a fish with position x and y
  public Fish(float x, float y) {
    this(x, y, #000000);
  }

  // construct a fish with a color
  public Fish(float x, float y, color fishColor) {
    this.x = x;
    this.y = y;
    this.orientation = 270;
    this.maxSteer = 2;
    this.scale = 1;
    this.tick = random(100);
    this.fishColor = fishColor;

    // make fish shape
    PShape body = createShape(ELLIPSE, 0, 0, 12, 10);
    body.setStroke(false);
    body.setFill(this.fishColor);

    PShape tail = createShape(TRIANGLE, 0, 0, 10, -5, 10, 5);
    tail.setStroke(false);
    tail.setFill(this.fishColor);

    this.fishShape = createShape(GROUP);
    this.fishShape.addChild(body);
    this.fishShape.addChild(tail);
    this.fishShape.scale(this.scale);
    
    this.setBearing(random(360));
  }

  public void drawFish(float alpha) {
    shapeMode(CENTER);
    shape(this.fishShape, this.x, this.y);
    this.moveFish();
    // set bearing using perlin noise seeded on tick
    this.setBearing(this.orientation +
        map(noise(this.tick), 0, 1, -this.maxSteer, this.maxSteer));
    this.tick += 0.01;  // determins how fast fish will change their minds
  }
  
  public void drawFish() {
    this.drawFish(255);
  }

  public void moveFish() {
    float dist = 1;
    float angle = 270 + this.orientation;
    this.y += dist * sin(radians(angle));
    this.x += dist * cos(radians(angle));
  }
  
  private void setBearing(float bearing) {
    float diff = bearing - this.orientation;
    this.fishShape.rotate(radians(diff));
    this.orientation += diff;
  }
}