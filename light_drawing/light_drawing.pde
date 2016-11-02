import processing.video.*;

Capture cam;

void setup() {
  //displays it full screen
  size (displayWidth, displayHeight);
  frameRate(30);
  background(0);
  
  // find connected cemera names
  String[] cameras = Capture.list();
  for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
  }
  
  cam = new Capture(this, width, height, cameras[15], 30);
  cam.start();
}

void draw() {

  if(cam.available()) {
    cam.read();
    cam.loadPixels();
    loadPixels();

    // Loop through every pixel. ++i is equivalent to i = i + 1.
    //for (int i=0; i<cam.pixels.length; i++) {
    for (int row = 0; row < cam.height; row++) {
      for (int col = 0; col < cam.width; col++) {
        
        int i = (row * cam.width) + col;
        int i_reversed = (row * cam.width) + (cam.width - 1 - col);
        
        if (brightness(cam.pixels[i]) > 220) {
          pixels[i_reversed] = color(255);
        }

        // fade the pixels out
        //pixels[i] = pixels[i] + 1;
        float red = red(pixels[i]);
        float green = green(pixels[i]);
        float blue = blue(pixels[i]);

        blue = blue - 5;
        if(blue < 0) blue = 0;

        red = red - 5;
        if(red < 0) red = 0;

        green = green - 5;
        if(green < 0) green = 0;

        pixels[i] = color(red, green, blue);
      }
    }

    updatePixels();
  }
}