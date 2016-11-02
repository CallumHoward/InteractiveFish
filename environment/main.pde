Environment env = new Environment(60, 80);
int scale = 10;
EType currentEType = EType.SAND;

void setup() {
  size(800, 600);
}

void draw() {
  background(#ffffff);
  env.drawEnvironment();
  
  // draw cursor
  
  ellipse(mouseX, mouseY, scale, scale);
}

void mouseDragged() {
  println("click");
  // which cell is the mouse over?
  env.changeCell(mouseX / scale, mouseY / scale, currentEType);
}