int[][] M = new int [10][10]; //campo
int n = (int)random(0, 10);
int m = (int)random(0, 10);
boolean explodiu = false;
boolean continua = false;

void setup() {
  colorMode(HSB, 360, 100, 100);
  size(300, 300);
  bombas();
}

void draw() {
  tabuleiro();
  if (explodiu == false && continua == false) {
    fill(0, 0, 100);
  } else if (explodiu == true && continua == false || explodiu == true && continua == true) {
    fill(0, 100, 100);
  } else {
    fill(137, 100, 100);
  }
}

void tabuleiro() {
  for (int i = 0; i < M.length; i++) {
    for (int j = 0; j < M[0].length; j++) 
      rect(i*30, j*30, 30, 30);
  }
}

void bombas() {
  for (int i = 0; i < M.length; i++) {
    for (int j = 0; j < M[0].length; j++) {
      M[i][j] = (int)random(0, 2);
    }
  }
}

void mousePressed() {
  int a = int(mouseX/30);
  int b = int(mouseY/30);
  testar(a, b);
}

void testar(int a, int b) {
  if (M[a][b] == 1) {
    explodiu = true;
    println("a bomba explodiu e você perdeu! GAME OVER!!!");
  } else {
    continua = true;
    println("você clicou na linha ", a, " e na coluna ", b);
    println("você escapou!");
    println("posições vizinhas: ");
    println("linha ", a, ", coluna ", b+1);
    println("linha ", a, ", coluna ", b-1);
    println("linha ", a+1, ", coluna ", b);
    println("linha ", a+1, ", coluna ", b+1);
    println("linha ", a+1, ", coluna ", b-1);
    println("linha ", a-1, ", coluna ", b);
    println("linha ", a-1, ", coluna ", b+1);
    println("linha ", a-1, ", coluna ", b-1);
  }
}
