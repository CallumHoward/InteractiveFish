

color[] styleyou = {#262b30, #e09a25, #f0d770, #f2edbc, #c51c30};
color[] palette = styleyou;

int i = 1;
int x = 0;

void setup() {
  size(600, 200);
  smooth();
  stroke(palette[4]);
  strokeWeight(5);
}

void draw() {
  background(palette[0]);
  fill(palette[i]);
  rect(x, 75, 50, 50);
}

void keyPressed() {
  x += 3;
}

void mousePressed() {
  i = int(random(1, 5));
}
