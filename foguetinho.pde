int x;

void setup() {
  size(300, 300);
  colorMode(HSB, 360, 100, 100);
  noStroke();
}

void draw() {
  background(255, 88, 36);
  x = 0;
  //estrelinhas
  for (int i = 0; i < 300; i = i + 50) {
    for (int j = 0; j < 300; j = j + 100) {
      fill(255, 10, 100);
      circle(i, j, 2);
      circle(i + 30, j+ 50, 2);
      circle(i + 50, j + 100, 2);
    }
  }

  //chamas
  fill(34, 79, 100);
  rect(0, 135, 65, 30);
  fill(46, 71, 100);
  rect(0, 138, 65, 24);
  fill(48, 25, 100);
  rect(0, 141, 65, 18);


  //foguetinho
  fill(8, 85, 91);
  ellipse(x + 88, 150, 65, 40);
  triangle(x + 41, 123, x+43, 139, x+55, 133);
  triangle(x + 43, 159, x+55, 167, x+41, 176);
  fill(0, 0, 97);
  ellipse(x + 75, 150, 75, 50);
  stroke(8, 85, 91);
  fill(196, 62, 97);
  ellipse(x + 90, 150, 20, 20);
  noStroke();
  fill(195, 13, 100);
  ellipse(x+95, 147, 5, 5);
}
