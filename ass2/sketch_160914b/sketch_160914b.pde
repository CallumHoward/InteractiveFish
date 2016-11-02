
import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture frame;
OpenCV opencv;

float x1;
float y1;
float easing1;

int wide2;  // half width of the window
int high2;  // half height of the window

void setup() {
  size(640, 480);  // size only takes literals in Processing 3
  wide2 = 640 / 2;
  high2 = 480 / 2;

  frame = new Capture(this, wide2, high2);
  opencv = new OpenCV(this, wide2, high2);  

  background(#FFFFFF);

  x1 = random(wide2);
  y1 = random(high2);
  easing1 = 0.1;

  frame.start();
}

void draw() {
  scale(2);
  opencv.loadImage(frame);

  // flip the frame and place it on the screen
  pushMatrix();
  scale(-1.0, 1.0);
  image(frame,-frame.width,0);
  popMatrix();

  // paint canvas on top of image
  noStroke();
  fill(#FFFFFF, 200);
  rect(0, 0, wide2, high2);

  // find the brightest point in the current frame
  PVector loc = opencv.max();
  PVector loc_min = opencv.min();

  // get pixel at the brightest and darkest points
  int bright = frame.get(int(loc.x), int(loc.y));
  print("bright: ", bright, "\n");

  // determine brightness and see if they are highly contrasting
  int dark = frame.get(int(loc_min.x), int(loc_min.y));
  print("dark: ", dark, "\n");

  print("diff: ", dark - bright, "\n");

  // flip the target coordinates to get 1:1 mapping
  loc.x = wide2 - loc.x;

  // draw target to indicate brightest point
  stroke(255, 0, 0);
  strokeWeight(1);
  noFill();
  ellipse(loc.x, loc.y, 5, 5);

  // draw circle that smoothly follows the target
  stroke(#607f93);
  noFill();
  ellipse(x1, y1, 20, 20);
  x1 += (loc.x - x1) * easing1;
  y1 += (loc.y - y1) * easing1;

}