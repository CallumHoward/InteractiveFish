
// render size details
final int dW = 960;
final int dH = 540;
final int cellSize = 40;

Environment env = new Environment(int(dW / cellSize), int(dH / cellSize), cellSize);
EType currentEType = EType.SAND;
Brush cursor = new Brush(env.colors.get(EType.SAND), cellSize);
boolean brushChange = true;

int tick = 0;
int num = 50;  // initial number of fish
ArrayList<Fish> fishies = new ArrayList<Fish>();

Capture camera;
LightCursor lc;

int init = 0;

void setup() {
  // initialise window
  //fullScreen();
  size(960, 540);
  //frameRate(30);

  // initial blank screen
  background(#000000);

  // add some fish
  for (int i = 0; i < num; ++i) {
    fishies.add(new Fish(
          int(random(cellSize, dW - cellSize)),
          int(random(cellSize, dH - cellSize)), #5191AA));
  }
}

void draw() {
  if (init == 0) { intro(); init++; return; }
  if (init == 1) { cameraSetup(); init++; }

  background(#e0f0ff);  // clear screen between frames
  env.drawEnvironment();

  // draw cursor
  if (lc != null) {
    lc.readFrame();
    if (lc.isVisible()) {
      brushChange = false;
      //PVector brightest = lc.draw();  // debug
      PVector brightest = lc.getBrightest();
      cursor.drawBrush(brightest.x, brightest.y);

    } else if (!brushChange) {
      brushChange = true;
      cycleBrush();
    }
  }

  // Draw the fish
  for (int i = 0; i < num; ++i) {
    Fish f = fishies.get(i);

    if (f.isDead()) {
      fishies.set(i, new Fish(
            int(random(cellSize, dW - cellSize)),
            int(random(cellSize, dH - cellSize)), #5191AA));
      f = fishies.get(i);
    }

    f.drawFish(env);
  }

  if (++tick == 15) { tick = 0; }
}

void mouseDragged() {
  // which cell is the mouse over?
  for (PVector filled : cursor.getMask(mouseX / env.scale, mouseY / env.scale)) {
    env.changeCell(int(filled.x), int(filled.y), currentEType);
  }
}

void cycleBrush() {
  switch (currentEType) {
    case WATER: currentEType = EType.SAND; break;
    case SAND: currentEType = EType.GRASS; break;
    case GRASS: currentEType = EType.ROCK; cursor.size /= 4; break;
    case ROCK: currentEType = EType.WATER; cursor.size *= 4; break;
  }
  cursor.currentColor = env.colors.get(currentEType);
}

void keyPressed() { cycleBrush(); }

void intro() {
  // create the font
  printArray(PFont.list());
  PFont f = createFont("BrushScript.ttf", 48, true);
  textFont(f);

  textAlign(CENTER);
  fill(#ffffff);
  text("Loading...", dW / 2, dH / 2);
}

void cameraSetup() {
    // find connected cemera names
    String[] cameras = Capture.list();
    for (int i = 0; i < cameras.length; i++) { println(cameras[i]); }

    camera = new Capture(this, dW, dH, 30);   // 15 for external webcam
    lc = new LightCursor(this, dW, dH, camera);

    camera.start();
}

void captureEvent(Capture c) { c.read(); }
