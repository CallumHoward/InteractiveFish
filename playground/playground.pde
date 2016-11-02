
size(600, 200);
smooth();
background(#678c8b);
strokeWeight(5);

/*
// === bezier curves ===
noFill();

// first curve
// control points
stroke(#f1d6d4);
strokeWeight(2);
line(100, 50, 250, 50);
line(100, 150, 250, 150);
// curve spec
stroke(#791F33);
strokeWeight(3);
bezier(100, 50, 250, 50, 100, 150, 250, 150);

// second curve
// control points
stroke(#f1e6d4);
strokeWeight(2);
line(350, 75, 500, 25);
line(350, 125, 500, 175);
// curve spec
stroke(#ba3d49);
strokeWeight(3);
bezier(350, 75, 500, 25, 500, 175, 350, 125);


// === complex curves ===
noFill();

// white curve
strokeWeight(3);
curveTightness(4);
stroke(255);

beginShape();
curveVertex(100, 100);
curveVertex(100, 100);
curveVertex(150, 150);
curveVertex(250, 50);
curveVertex(300, 10);
curveVertex(400, 190);
curveVertex(500, 100);
curveVertex(500, 100);
endShape();

// grey curve
strokeWeight(3);
curveTightness(-3);
stroke(100);

beginShape();
curveVertex(100, 100);
curveVertex(100, 100);
curveVertex(150, 150);
curveVertex(250, 50);
curveVertex(300, 10);
curveVertex(400, 190);
curveVertex(500, 100);
curveVertex(500, 100);
endShape();

// black curve
strokeWeight(3);
curveTightness(0);
stroke(0);

beginShape();
curveVertex(100, 100);
curveVertex(100, 100);
curveVertex(150, 150);
curveVertex(250, 50);
curveVertex(300, 10);
curveVertex(400, 190);
curveVertex(500, 100);
curveVertex(500, 100);
endShape();

// red dots
strokeWeight(8);
stroke(200, 0, 0);
point(100, 100);
point(150, 150);
point(250, 50);
point(300, 10);
point(400, 190);
point(500, 100);


// === curves ===
stroke(#442412);
curve(100, 300, 100, 100, 200, 100, 200, 300);

noFill();
stroke(#b9961C);
curveTightness(3);
curve(250, 300, 250, 100, 350, 100, 350, 300);

curveTightness(-3);
curve(400, 300, 400, 100, 500, 100, 500, 300);

*/
// === polygons ===
beginShape();
vertex(200, 150);
vertex(150, 125);
vertex(150, 75);
vertex(200, 50);
vertex(250, 75);
vertex(250, 125);
endShape(CLOSE);


/*
// === triangles ===
triangle(150, 50, 200, 150, 100, 150);

noStroke();
fill(#74ad92);
triangle(250, 50, 300, 150, 350, 50);

stroke(#f07f47);
noFill();
triangle(450, 50, 500, 150, 400, 150);


// === quadrangles ===
strokeWeight(5);

quad(150, 50, 200, 100, 150, 150, 100, 100);

noStroke();
fill(#A3d0c1);
quad(300, 50, 350, 100, 300, 150, 250, 100);

stroke(#fdf6dd);
noFill();
quad(450, 50, 500, 100, 450, 150, 400, 100);

// rectangles and squares
rectMode(CORNER);
rect(60, 60, 80, 80);

rectMode(CENTER);
noStroke();
fill(#cc5c54);
rect(300, 100, 80, 80);

rectMode(CORNERS);
stroke(#f69162);
noFill();
rect(460, 60, 540, 140);


// === arc ===
// Form: arc (x, y, width, height, start, stop);
arc(100, 100, 75, 75, 0, PI * 0.5);

noFill();
arc(233, 100, 75, 75, 0, PI);

fill(0, 191, 255);
noStroke();
arc(367, 100, 75, 75, 0, radians(270));

stroke(0);
arc(500, 100, 75, 75, 0, TWO_PI);


// === ellipses and circles
noStroke();
fill(#8fa89b, 200);
ellipse(100, 100, 150, 100);

fill(#8fa89b, 200);
ellipse(200, 100, 150, 100);

fill(#8fa89b, 200);
ellipse(300, 100, 150, 100);

fill(#8fa89b, 200);
ellipse(400, 100, 150, 100);

ellipseMode(CORNER);
fill(#b3b597);
ellipse(500, 100, 150, 150);


// === lines ===
stroke(#e2e1dc);
strokeWeight(2);
line(100, 50, 500, 50);
line(100, 150, 500, 150);

// cross lines
stroke(#607F9C);
strokeWeight(8);

line(100, 50, 100, 150);
line(100, 50, 200, 150);
line(100, 50, 300, 150);
line(100, 50, 400, 150);
line(100, 50, 500, 150);

line(100, 50, 500, 150);
line(200, 50, 500, 150);
line(300, 50, 500, 150);
line(400, 50, 500, 150);
line(500, 50, 500, 150);

// === points ===
point(100, 100);
point(150, 100);
point(200, 100);
point(250, 100);
point(300, 100);
point(350, 100);
point(400, 100);
point(450, 100);
point(500, 100);
*/
