
int[] x = new int[360];
int[] y = new int[360];

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  for (int i = 0; i < x.length; i++) {
    x[i] = 0;
    y[i] = 0;
  }
}

void draw() {
  background(255);
  for (int i = 0; i < x.length - 1; i++) {
    x[i] = x[i + 1];
    y[i] = y[i + 1];
  } 

  x[x.length - 1] = mouseX;
  y[y.length - 1] = mouseY;

  for (int i = 0; i < x.length; i++) {
    noStroke();
    fill(0+i, 0+i, 0+i);
    ellipse(x[i], y[i], i/6, i/6);
  }
}
