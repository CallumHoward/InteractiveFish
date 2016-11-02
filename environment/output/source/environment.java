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

public class environment extends PApplet {



enum EType {
  WATER,
  SAND,
  GRASS,
  ROCK
}


class Environment {
  EType[][] map;
  int nRows, nCols;

  Environment(int nRows, int nCols) {
    this.map = new EType[nRows][nCols];
    this.nRows = nRows;
    this.nCols = nCols;
    
    for (int r = 0; r < nRows; ++r) {
      for (int c = 0; c < nCols; ++c) { map[r][c] = EType.WATER; }
    }
  }

}


Environment env = new Environment(60, 80);
int scale = 10;

public void setup() {
  
}

public void draw() {
  background(0xffFFFFFF);
  stroke(1);
  fill(0xffE0F0FF);

  for (int r = 0; r < env.nRows; ++r) {
    for (int c = 0; c < env.nCols; ++c) {
      rect(r * scale, c * scale, scale, scale);
      println(c);
    }
    //delay(1000);
  }
}
  public void settings() {  size(800, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "environment" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
