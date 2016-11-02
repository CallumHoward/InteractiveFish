import processing.video.*;
int cols, rows;
Capture cam;

void setup() {
  
  //displays it full screen
  size (displayWidth, displayHeight);
  
  cols = width;  
  rows = height;
  //30 fps is default so bellow won't change anything
  cam = new Capture(this, width, height, 30);
  
  // Start capturing the images from the camera
  cam.start();  
  
  frameRate(30);
  background(0);
}


void draw() { 
  if(cam.available()) {
    //reads fresh-est  pixels from camera
    cam.read();
    cam.loadPixels();
    loadPixels();
    // Loop through every pixel. ++i is equivalent to i = i + 1.
    //for (int i=0; i<cam.pixels.length; i++) {
  
    // Begin loop for columns(using width)
    for (int i = 0; i < cols;i++) {
      // Begin loop for rows(using length)
      for (int j = 0; j < rows;j++) {
        
        // Where are we, pixel-wise? (cam.width - i - 1) means x-coordinate of the pixel mirrored
        //int loc = (cam.width - i - 1) + j*cam.width;  // Reversing x to mirror the image
        int loc = (i) + j*cam.width;  // Reversing x to mirror the image
        println(loc, width, displayWidth, height, displayHeight);
        delay(10);
        
        if (brightness(cam.pixels[loc]) > 253) {
 
          pixels[loc] = color(255);       
        }
        
      
     float red = red(pixels[loc]);
     float green = green(pixels[loc]);
     float blue = blue(pixels[loc]);
     
     blue = blue - 5;
     if(blue < 0) blue = 0;
     
     red = red - 5;
     if(red < 0) red = 0;
   
     green = green - 5;
     if(green < 0) green = 0;
      
     pixels[loc] = color(red, green, blue);
      
    } 
  }
  
  updatePixels();
  
  }
}