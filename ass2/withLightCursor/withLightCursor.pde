
Capture camera;
LightCursor lc; 

void setup() {
  size(displayWidth, displayHeight);  // size only takes literals in Processing 3
  
  // find connected cemera names
  String[] cameras = Capture.list();
  for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
  }
  
  camera = new Capture(this, width, height, cameras[15], 30);
  camera.start();
  
  lc = new LightCursor(this, displayWidth, displayHeight, camera);
  
  background(#FFFFFF);

}

void draw() {
  lc.draw();

}

void captureEvent(Capture c) {
  c.read();
}