import gab.opencv.*;
import processing.video.*;
import java.awt.*;

class LightCursor {
  Capture frame;
  OpenCV opencv;

  PVector pos = new PVector();  // position
  float easing;
  
  int width1, height1;
  
  LightCursor(PApplet papplet, int width1, int height1, Capture camera) {   
    this.width1 = width1;
    this.height1 = height1;
    
    // find connected cemera names
    String[] cameras = Capture.list();
    for (int i = 0; i < cameras.length; i++) {
        println(cameras[i]);
    }
    
    this.frame = camera; 
    opencv = new OpenCV(papplet, this.width1, this.height1);  
    
    // sets initial cursor location
    println(this.width1, this.height1);
    pos.x = random(width1);
    pos.y = random(height1);
    easing = 0.1;
    
    //frame.start();
  }
  
  PVector draw() {
    
    opencv.loadImage(frame);
  
    // flip the frame and place it on the screen
    pushMatrix();
    scale(-1.0, 1.0);
    image(frame,-frame.width,0);
    popMatrix();
  
    // paint canvas on top of image
    noStroke();
    fill(#FFFFFF, 200);
    rect(0, 0, width, height);
  
    // find the brightest point in the current frame
    PVector loc = opencv.max();
    //PVector loc_min = opencv.min();
  
    // flip the target coordinates to get 1:1 mapping
    loc.x = width - loc.x;
  
    // draw target to indicate brightest point
    stroke(255, 0, 0);
    strokeWeight(1);
    noFill();
    ellipse(loc.x, loc.y, 5, 5);
  
    // draw circle that smoothly follows the target
    stroke(#607f93);
    noFill();
    ellipse(pos.x, pos.y, 20, 20);
    pos.x += (loc.x - pos.x) * easing;
    pos.y += (loc.y - pos.y) * easing; 
  
    return loc;
  }
  
}