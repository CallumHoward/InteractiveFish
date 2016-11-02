

Fish nemo;  // global variable nemo can be used inside any function

void setup() {  
  size(displayWidth, displayHeight);

  nemo = new Fish(500, 500, #5191AA);  // this has to be done inside a function
}

void draw() {
  background(#FFFFFF);  // clear the frame each time
  
  nemo.drawFish(); 
}