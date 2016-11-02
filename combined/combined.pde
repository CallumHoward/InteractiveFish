
// render size details
final int dW = 1440;
final int dH = 900;
final int cellSize = 40;

Environment env = new Environment(int(dW / cellSize), int(dH / cellSize), cellSize);
EType currentEType = EType.SAND;
Brush cursor = new Brush(env.colors.get(EType.SAND), 2);

int num = 50;  // initial number of fish
ArrayList<Fish> fishies = new ArrayList<Fish>();

Capture camera;
LightCursor lc; 
int tick;

void setup() {
  //fullScreen();
  size(1440, 900);
  //frameRate(30);
  
  // add some fish
  for (int i = 0; i < num; ++i) {
    fishies.add(new Fish(int(random(dW)), int(random(dH)), #5191AA));
  }
  
  tick = 0;
}

void draw() {
  background(#ffffff);
  env.drawEnvironment();
  
  // draw cursor
  cursor.drawBrush();
  
  // Draw the fish
  for (int i = 0; i < num; i++) {
    Fish f = fishies.get(i);
    f.drawFish(env);
    //if (env.getColor(int(f.x / env.scale), int(f.y / env.scale)) != EType.WATER);
  }
  
  if (++tick == 15) {
    //println(frameRate);  //TODO comment this
    tick = 0;
  }
}

void mouseDragged() {
  // which cell is the mouse over?
  for (PVector filled : cursor.getMask(mouseX / env.scale, mouseY / env.scale)) {
    env.changeCell(int(filled.x), int(filled.y), currentEType);
  }
}

void keyPressed() {
  switch (currentEType) {
    case WATER: currentEType = EType.SAND; break;
    case SAND: currentEType = EType.GRASS; break;
    case GRASS: currentEType = EType.ROCK; cursor.size /= 4; break;
    case ROCK: currentEType = EType.WATER; cursor.size *= 4; break;
  }
  cursor.currentColor = env.colors.get(currentEType);
}