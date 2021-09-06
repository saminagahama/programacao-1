int[][]mapa = new int [21][21];
int x, y, p;

void setup() {
  size(600, 600);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  //coordenadas do pacman
  x = 10;
  y = 10;
  //randomizar();

  //posições do pacman
  p = 5;
}  



void draw() {
  tabuleiro();
  pacman();
}



void mousePressed() {
  if (mouseButton == LEFT) {
    mapa[mouseX/30][mouseY/30] = 1;
  }  
  if (mouseButton == RIGHT) {
    mapa[mouseX/30][mouseY/30] = 0;
  }
}

void keyPressed() {
  if (keyCode == ENTER) {
    for (int m = 0; m < mapa.length; m++) {
      for (int n = 0; n < mapa[0].length; n++) {
        if (mapa[m][n] == 0) {
          mapa[m][n] = 2;
          p = 0;
        }
      }
    }
  }

  if (keyCode == DOWN) {
    if (y<19) {
      p = 0;
      if (mapa[x][y+1] != 1)
        y += 1;
      if (mapa[x][y] == 2) {
        mapa[x][y] = 0;
      }
    }
  }
  if (keyCode == UP) {
    if (y>0) {
      p = 1;
      if (mapa[x][y-1] != 1)
        y -= 1;
      if (mapa[x][y] == 2) {
        mapa[x][y] = 0;
      }
    }
  }
  if (keyCode == RIGHT) {
    if (x<19) {
      p = 2;
      if (mapa[x+1][y] != 1)
        x += 1;
      if (mapa[x][y] == 2) {
        mapa[x][y] = 0;
      }
    }
  }
  if (keyCode == LEFT) {
    if (x>0) {
      p = 3;
      if (mapa[x-1][y] != 1)
        x -= 1;
      if (mapa[x][y] == 2) {
        mapa[x][y] = 0;
      }
    }
  }
}

void randomizar() {
  for (int m = 0; m < mapa.length; m++) {
    for (int n = 0; n < mapa[0].length; n++) {
      mapa[m][n] = (int)random(0, 2);
      print(mapa[m][n]);
      println();
    }
  }
}

void tabuleiro() {
  for (int m = 0; m < mapa.length; m++) {
    for (int n = 0; n < mapa[0].length; n++) {
      //grama
      if (mapa[m][n] == 0) {
        fill(96, 50, 90);
        rect(m*30, n*30, 30, 30);
      } 
      //parede
      if (mapa[m][n] == 1) {
        fill(298, 50, 50);
        rect(m*30, n*30, 30, 30);
      } 
      //frutinhas
      if (mapa[m][n] == 2) {
        fill(96, 50, 90);
        rect(m*30, n*30, 30, 30);
        fill(34, 100, 100);
        ellipse(m*30+15, n*30+15, 5, 5);
      }
    }
  }
}


void pacman() {

  if (p==0) {
    fill(201, 54, 90);
    ellipse(x*30+15, y*30+15, 30, 30);
    fill(0, 0, 0);
    ellipse(x*30+6, y*30+5, 5, 5);
    ellipse(x*30+24, y*30+5, 5, 5);
    ellipse(x*30+15, y*30+20, 15, 15);
  }
  if (p==1) {
    fill(201, 54, 90);
    ellipse(x*30+15, y*30+15, 30, 30);
    fill(0, 0, 0);
    ellipse(x*30+6, y*30+25, 5, 5);
    ellipse(x*30+24, y*30+25, 5, 5);
    ellipse(x*30+15, y*30+10, 15, 15);
  }
  if (p==2) {
    fill(201, 54, 90);
    ellipse(x*30+15, y*30+15, 30, 30);
    fill(0, 0, 0);
    ellipse(x*30+6, y*30+6, 5, 5);
    ellipse(x*30+6, y*30+24, 5, 5);
    ellipse(x*30+20, y*30+15, 15, 15);
  }
  if (p==3) {
    fill(201, 54, 90);
    ellipse(x*30+15, y*30+15, 30, 30);
    fill(0, 0, 0);
    ellipse(x*30+24, y*30+6, 5, 5);
    ellipse(x*30+24, y*30+24, 5, 5);
    ellipse(x*30+10, y*30+15, 15, 15);
  }
}
