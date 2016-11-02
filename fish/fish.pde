// ==== Fish ====
public class Fish {

  private int x;
  private int y;
  private color fishColor;

  public Fish(int x, int y, color fishColor) {
    this.x = x;
    this.y = y;
    this.fishColor = fishColor;
  }

  public Fish(int x, int y) {
    this.x = x;
    this.y = y;
    this.fishColor = #000000;
  }

  public void drawFish() {
    noStroke();
    fill(fishColor);  // fish colour

    //       x1, y1,   x2, y2,   x3, y3
    triangle(x + 10, y + 10, x + 20, y + 5, x + 20, y + 15);

    // center x, center y, width, height
    ellipse(x + 10, y + 10, 12, 10);
    
    moveFish();
  }
  
  private void moveFish() {
    this.x += random(-5, 5);
    this.y += random(-5, 5);
  }
}


// ==== start program ====
int n_fish = 10;
Fish[] fishies = new Fish[n_fish];

void setup() {
  size(800, 600);
  smooth();
  
  for (int i = 0; i < n_fish; i++) {
    fishies[i] = new Fish(int(random(500)), int(random(500)), #5191AA); 
  }
   
}

void draw() {
  background(#FFFFFF);
  for (int i = 0; i < n_fish; i++) {
    fishies[i].drawFish();
  }
  delay(30);
}