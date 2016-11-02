// ==== Fish ====
public class Fish {

  static final int maxFishEnergy = 2000;

  public float x;
  public float y;
  private float orientation;   // degrees (0, 360]
  private float maxSteer;      // degrees (0, 360]
  private float scale;
  private float tick;
  private color fishColor;
  private int fishEnergy;      // (0, maxFishEnergy]
  private PShape fishShape;

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
    this.scale = 2;
    this.tick = random(100);
    this.fishColor = fishColor;
    this.fishEnergy = int(random(maxFishEnergy / 2, maxFishEnergy));

    // make fish shape
    this.fishShape = makeShape(this.fishColor, this.scale);
    this.setBearing(random(360));
  }

  private PShape makeShape(color c, float s) {
    PShape body = createShape(ELLIPSE, 0, 0, 12, 10);
    body.setStroke(false);
    body.setFill(c);

    PShape tail = createShape(TRIANGLE, 0, 0, 10, -5, 10, 5);
    tail.setStroke(false);
    tail.setFill(c);

    PShape fish = createShape(GROUP);
    fish.addChild(body);
    fish.addChild(tail);
    fish.scale(s);

    fish.rotate(radians(90 + this.orientation));

    return fish;
  }

  public void drawFish(Environment env) {
    float vitality = map(float(this.fishEnergy), 0, maxFishEnergy, 0.5, 1.5);
    this.fishShape = makeShape(lerpColor(this.fishColor, #e0f0ff, 1 - vitality), this.scale);
    shapeMode(CENTER);
    shape(this.fishShape, this.x, this.y);
    this.moveFish(env);
    // set bearing using perlin noise seeded on tick
    this.setBearing(this.orientation +
        map(noise(this.tick), 0, 1, -this.maxSteer, this.maxSteer));
    this.tick += 0.01;  // determines how fast fish will change their minds
    this.fishEnergy -= 1;
  }

  public void moveFish(Environment env) {
    float dist = 2 * noise(this.tick);
    float angle = 270 + this.orientation;
    PVector newP = new PVector(this.x, this.y);
    newP.x += dist * cos(radians(angle));
    newP.y += dist * sin(radians(angle));

    if (env.getInBounds(newP.x / env.scale, newP.y / env.scale) &&
        env.getEType(newP.x / env.scale, newP.y / env.scale) == EType.WATER) {
      this.y = newP.y;
      this.x = newP.x;
      this.maxSteer = 2;
    } else {
      this.maxSteer = 6;
      this.fishEnergy -= 20;
    }
  }

  public boolean isDead() {
    return this.fishEnergy <= 0;
  }

  private void setBearing(float bearing) {
    float diff = bearing - this.orientation;
    this.fishShape.rotate(radians(diff));
    this.orientation += diff;
  }
}
