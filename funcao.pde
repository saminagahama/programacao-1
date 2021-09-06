void setup() {
  size(500,500);
  noStroke();
  background(255);
  rectMode(CENTER);
  for (int j=0; j<10; j++)
    for (int i=0; i<10; i++)
    desenho(i*50+25, j*50+25,50);
}

void desenho(int x, int y, int l) {
  for (int i=10; i>0; i--) {
    fill(i*20);
    rect(x*2,y*2,i*20,i*20);
  }
}
