import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class easing extends PApplet {


int[] minard = {0xff666666, 0xff607f9c, 0xffe9ccae, 0xfffffff3, 0xffd01312};
int[] palette = minard;

int wide = 600;
int high = 200;

int d = 20;

float x1 = random(wide);
float y1 = random(high);
float easing1 = 0.01f;

float x2 = random(wide);
float y2 = random(high);
float easing2 = 0.03f;

float x3 = random(wide);
float y3 = random(high);
float easing3 = 0.05f;

public void setup() {
  
  
  strokeWeight(3);
  noCursor();
}

public void draw() {
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

  public void settings() {  size(600, 200);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "easing" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
