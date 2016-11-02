import gab.opencv.*;
import processing.video.*;
import java.awt.*;

class LightCursor {
  Capture frame;
  OpenCV opencv;

  PVector pos;  // position
  float easing;
  
  LightCursor(PApplet papplet, int width, int height) {
    frame = new Capture(papplet, width, height);
    opencv = new OpenCV(papplet, width, height);  
    
    // sets initial cursor location
    pos.x = random(width);
    pos.y = random(height);
    easing = 0.1;
    
    frame.start();
  }
  
  void draw() {
    
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
    x1 += (loc.x - x1) * easing;
    y1 += (loc.y - y1) * easing; 
    
  }
  
}