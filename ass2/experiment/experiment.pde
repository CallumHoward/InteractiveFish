
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


PImage sprite;  

int npartTotal = 10000;
int npartPerFrame = 25;
float speed = 1.0;
float gravity = 0.05;
float partSize = 20;

int partLifetime;
PVector positions[];
PVector velocities[];
int lifetimes[];  

int fcount, lastm;
float frate;
int fint = 3;


void draw() {
  background(#ffffff);
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
  
  
  //background(0);

  for (int n = 0; n < npartTotal; n++) {
    lifetimes[n]++;
    if (lifetimes[n] == partLifetime) {
      lifetimes[n] = 0;
    }      

    if (0 <= lifetimes[n]) {      
      float opacity = 1.0 - float(lifetimes[n]) / partLifetime;
            
      if (lifetimes[n] == 0) {
        // Re-spawn dead particle
        positions[n].x = x1;
        positions[n].y = y1;
        
        float angle = random(0, TWO_PI);
        float s = random(0.5 * speed, 0.5 * speed);
        velocities[n].x = s * cos(angle);
        velocities[n].y = s * sin(angle);
      } else {
        positions[n].x += velocities[n].x;
        positions[n].y += velocities[n].y;
        
        velocities[n].y += gravity;
      }
      drawParticle(positions[n], opacity);
    }
  }
  
  fcount += 1;
  int m = millis();
  if (m - lastm > 1000 * fint) {
    frate = float(fcount) / fint;
    fcount = 0;
    lastm = m;
    println("fps: " + frate); 
  } 

}

void captureEvent(Capture c) {
  c.read();
}



void setup() {
  size(640, 480, P3D);
  frameRate(120);
  
  sprite = loadImage("sprite.png");

  partLifetime = npartTotal / npartPerFrame;
  initPositions();
  initVelocities();
  initLifetimes(); 

  // Writing to the depth buffer is disabled to avoid rendering
  // artifacts due to the fact that the particles are semi-transparent
  // but not z-sorted.
  hint(DISABLE_DEPTH_MASK);
  
  // Testing some hints
  //hint(DISABLE_TRANSFORM_CACHE);
  //hint(ENABLE_ACCURATE_2D);
  
  //size(640, 480);  // size only takes literals in Processing 3
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


void drawParticle(PVector center, float opacity) {
  beginShape(QUAD);
  noStroke();
  tint(255, opacity * 255);
  texture(sprite);
  normal(0, 0, 1);
  vertex(center.x - partSize/2, center.y - partSize/2, 0, 0);
  vertex(center.x + partSize/2, center.y - partSize/2, sprite.width, 0);
  vertex(center.x + partSize/2, center.y + partSize/2, sprite.width, sprite.height);
  vertex(center.x - partSize/2, center.y + partSize/2, 0, sprite.height);                
  endShape();  
}

void initPositions() {
  positions = new PVector[npartTotal];
  for (int n = 0; n < positions.length; n++) {
    positions[n] = new PVector();
  }  
}

void initVelocities() {
  velocities = new PVector[npartTotal];
  for (int n = 0; n < velocities.length; n++) {
    velocities[n] = new PVector();
  }
}

void initLifetimes() {
  // Initializing particles with negative lifetimes so they are added
  // progressively into the screen during the first frames of the sketch   
  lifetimes = new int[npartTotal];
  int t = -1;
  for (int n = 0; n < lifetimes.length; n++) {    
    if (n % npartPerFrame == 0) {
      t++;
    }
    lifetimes[n] = -t;
  }
} 