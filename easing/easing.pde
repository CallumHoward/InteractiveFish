
color[] minard = {#666666, #607f9c, #e9ccae, #fffff3, #d01312};
color[] palette = minard;

int wide = 600;
int high = 200;

int d = 20;

float x1 = random(wide);
float y1 = random(high);
float easing1 = 0.01;

float x2 = random(wide);
float y2 = random(high);
float easing2 = 0.03;

float x3 = random(wide);
float y3 = random(high);
float easing3 = 0.05;

void setup() {
  size(600, 200);
  smooth();
  strokeWeight(3);
  noCursor();
}

void draw() {
  background(palette[0]);

  // circle 1
  stroke(palette[1]);
  noFill();
  ellipse(x1, y1, d + 15, d + 15);
  x1 += (mouseX - x1) * easing1;
  y1 += (mouseY - y1) * easing1;

  // circle 2
  stroke(palette[1]);
  noFill();
  ellipse(x2, y2, d + 15, d + 15);
  x2 += (mouseX - x2) * easing2;
  y2 += (mouseY - y2) * easing2;

  // circle 1
  stroke(palette[1]);
  noFill();
  ellipse(x3, y3, d + 15, d + 15);
  x3 += (mouseX - x3) * easing3;
  y3 += (mouseY - y3) * easing3;

  // dot
  noStroke();
  fill(palette[4]);
  ellipse(mouseX, mouseY, d, d);

}

