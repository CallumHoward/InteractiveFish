int num = 50;
ArrayList<Fish> fishies = new ArrayList<Fish>();

// fish spawn rate (0,1]
float rate = 0.9;
float counter = 0;

float tick = 0;

int mx = mouseX;
int my = mouseY;

int screenWidth = 500;
int screenHeight = 500;
float maxMovement = dist(0, 0, screenWidth, screenHeight);

void setup() {
  size(displayWidth, displayHeight);  // change both here and screenWidth, screenHeight
  noStroke();
  fill(255, 102);

  // add some fish
  for (int i = 0; i < num; ++i) {
    fishies.add(new Fish(int(random(displayWidth)), int(random(displayHeight)), #5191AA));
  }
}


void draw() {

  background(#F0FFFF);

  float mMovement = min(exp(dist(mx, my, mouseX, mouseY)), maxMovement);
  //println(mMovement);
  mx = mouseX;
  my = mouseY;

  if (counter < 1) {
    counter += norm(mMovement, 10, maxMovement);
  } else {
    counter = 0;
    fishies.add(new Fish(mx, my, #5191AA));
    fishies.remove(0);
  }
  
  // Draw the fish
  for (int i = 0; i < num; i++) {
    Fish f = fishies.get(i);
    f.drawFish(255 - (i*2));
  }
  
  // update the tick value
  tick += 0.01;
}