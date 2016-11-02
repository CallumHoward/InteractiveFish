import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.Collections; 
import java.util.Arrays; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class drawing_attributes extends PApplet {






public void setup() {

  
  
  noFill();
  strokeWeight(5);
  frameRate(5);
  background(0xffffffcd);

}


public void draw() {
  // === placement modes ===
  strokeWeight(20);

  //rectMode(CORNER);
  //rect(250, 50, 100, 100);

//  rectMode(CENTER);
//  rect(width / 2, height / 2, 100, 100);

  rectMode(CORNERS);
  rect(250, 50, 350, 150);

/*
  // === line attributes ===
  color[] rainbow = new color[] {#cc5c54, #f69162, #85a562, #7ab5db};

  strokeWeight(10);
  stroke(rainbow[1]);

//  strokeCap(ROUND);
//  line(50, height * 0.25, 550, height * 0.25);
//
//  strokeCap(SQUARE);
//  line(50, height * 0.5, 550, height * 0.5);
//
//  strokeCap(PROJECT);
//  line(50, height * 0.75, 550, height * 0.75);

  noFill();
  //strokeJoin(MITER);
  strokeJoin(BEVEL);
  //strokeJoin(ROUND);
  rect(100, 50, 100, 100);


  // === shuffling ===

  Integer[] nums = {1, 2, 3, 4, 5};

  println(nums);

  Collections.shuffle(Arrays.asList(nums));
  println(nums);


  // === perlin noise ===
  int n = 100;
  int x;
  float y = 0.05;
  float noiseY;

  background(255);
  stroke(100);

  for (int i = 1; i < n; ++i) {
    y += 0.02;
    x = i * (width / n);
    noiseY = noise(y) * height;
    line(x, height, x, noiseY);
  }


  // === incorperating randomness ===
  color[] rainbow;
  rainbow = new color[] {#cc5c54, #f69162, #85a562, #7ab5db};

  float x = random(width);
  float y = random(height);
  float d = random(30, 300);

  //stroke(random(255), random(255), random(255));
  stroke(rainbow[int(random(4))]);
  ellipse(x, y, d, d);

*/

}
  public void settings() {  size(600, 200);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "drawing_attributes" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
