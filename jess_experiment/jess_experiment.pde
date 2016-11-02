import processing.video.*;

Capture cam;

void setup() {
  size (1280, 720);
  frameRate(30);
  background(0);
  cam = new Capture(this, 1280, 720, "FaceTime HD Camera (Built-in)", 30);
  cam.start();
}

void draw() {
  if(cam.available()) {
    cam.read();
    cam.loadPixels();
    loadPixels();
    for (int i=0; i<cam.pixels.length; i++) {
      if (brightness(cam.pixels[i]) > 200) {
        pixels[i] = color(255);
      }
    }
    updatePixels();
  }
}