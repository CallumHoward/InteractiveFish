Environment env = new Environment(144, 90, 10);
EType currentEType = EType.SAND;
Brush cursor = new Brush(env.colors.get(EType.SAND), 10);

void setup() {
  size(displayWidth, displayHeight);
}

void draw() {
  background(#ffffff);
  env.drawEnvironment();
  
  // draw cursor
  cursor.drawBrush();
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