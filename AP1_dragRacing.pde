int alt, larg;
float x1, x2, x3, pos1, pos2, pos3, chegada;
boolean val1 = false, val2 = false, val3 = false, val4 = true, carro1 = false, carro2 = false, carro3 = false, fechado = true;

void setup() {
  alt = height;
  larg = width;
  x1 = 0;
  x2 = 0;
  x3 = 0;
  pos1 = (float)random(0, 5);
  pos2 = (float)random(0, 5);
  pos3 = (float)random(0, 5);
  chegada = 0.9*larg;
  size(800, 400);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  textSize(15);
  textAlign(CENTER, CENTER);
  noStroke();

  //gramado
  fill(98, 66, 90);
  rect(0, 0.8*alt, larg, alt/5);

  //areia
  fill(17, 73, 90);
  rect(0, 0, larg, alt/5);

  //sombra dos guarda-sóis
  fill(0);
  circle(0.425*larg, 0.11*alt, alt/10);
  circle(0.69*larg, 0.11*alt, alt/10);

  //guarda-sóis
  fill(234, 56, 90);
  circle(0.4*larg, alt/10, alt/10);
  circle(2*larg/3, alt/10, alt/10);

  //meio-fio
  stroke(0);
  fill(0, 0, 50);
  rect(0, 0.18*alt, larg, alt/50);
  rect(0, 0.8*alt, larg, alt/50);

  //semáforo
  stroke(0);
  fill(0, 0, 60);
  rect(0.09*larg, alt/50, larg/20, 0.14*alt);
  circle(0.115*larg, 0.12*alt, 20);
  circle(0.115*larg, alt/20, 20);
}

void draw() {
  //pista
  fill(0, 0, 40);
  rect(0, alt/5, larg, 0.6*alt);
  stroke(0, 0, 60);
  line(0, 0.41*alt, larg, 0.41*alt);
  line(0, 0.62*alt, larg, 0.62*alt);

  //faixa de largada e chegada
  noStroke();
  fill(0, 0, 100);
  rect(0.085*larg, 0.195*alt, 0.035*larg, 0.61*alt);
  rect(chegada, 0.195*alt, 0.035*larg, 0.61*alt);

  //carro 1
  fill(195, 20, 90);
  rect(x1, alt/4, 0.085*larg, alt/10);
  fill(0, 0, 0);
  text(1, x1+0.085*larg/2, alt/4+alt/20);

  //carro 2
  fill(56, 20, 90);
  rect(x2, 0.465*alt, 0.085*larg, alt/10);
  fill(0, 0, 0);
  text(2, x2+0.085*larg/2, 0.465*alt+alt/20);

  //carro 3
  fill(344, 20, 90);
  rect(x3, 0.66*alt, 0.085*larg, alt/10);
  fill(0, 0, 0);
  text(3, x3+0.085*larg/2, 0.66*alt+alt/20);

  //semáforo
  if (fechado) {
    stroke(0);
    fill(0, 0, 60);
    rect(0.09*larg, alt/50, larg/20, 0.14*alt);
    circle(0.115*larg, 0.12*alt, 20);
    fill(0, 100, 100);
    circle(0.115*larg, alt/20, 20);
  } else if (!fechado) {
    stroke(0);
    fill(120, 71, 82);
    circle(0.115*larg, 0.12*alt, 20);
    fill(0, 0, 60);
    circle(0.115*larg, alt/20, 20);
  }

  //movimento dos carros
  if (!fechado) {
    x1 = x1 + pos1;
    x2 = x2 + pos2;
    x3 = x3 + pos3;
  }

  if (x1+0.085*larg >= chegada) {
    pos1 = 0;
    fechado = true;
    carro1 = true;
    carro2 = false;
    carro3 = false;
  } else if (x2+0.085*larg >= chegada) {
    pos2 = 0;
    fechado = true;
    carro2 = true;
    carro1 = false;
    carro3 = false;
  } else if (x3+0.085*larg >= chegada) {
    pos3 = 0;
    fechado = true;
    carro3 = true;
    carro1 = false;
    carro2 = false;
  } 

  //escolha do carro
  if (val1) {
    println(1);
    noStroke();
    fill(98, 66, 90);
    rect(0.38*larg, 0.85*alt, 0.25*larg, 0.05*alt);
    fill(0, 0, 0);
    text("O carro escolhido foi o 1", larg/2, 0.86*alt);
  } else if (val2) {
    println(2);
    noStroke();
    fill(98, 66, 90);
    rect(0.38*larg, 0.85*alt, 0.25*larg, 0.05*alt);
    fill(0, 0, 0);
    text("O carro escolhido foi o 2", larg/2, 0.86*alt);
  } else if (val3) {
    println(3);
    noStroke();
    fill(98, 66, 90);
    rect(0.38*larg, 0.85*alt, 0.25*larg, 0.05*alt);
    fill(0, 0, 0);
    text("O carro escolhido foi o 3", larg/2, 0.86*alt);
  } else if (!val1 && !val2 && !val3) { 
    noStroke();
    fill(98, 66, 90);
    rect(0.38*larg, 0.85*alt, 0.25*larg, 0.05*alt);
  }

  //mensagem de vitória ou derrota
  if (carro1) {
    if (val1) {
      fill(98, 66, 90);
      rect(0.35*larg, 0.89*alt, 0.65*larg, 0.05*alt);
      fill(0, 0, 0);
      text("Você ganhou!", larg/2, 0.91*alt);
    } else if (val2 || val3) {
      fill(98, 66, 90);
      rect(0.35*larg, 0.89*alt, 0.65*larg, 0.05*alt);
      fill(0, 0, 0);
      text("Carro 1 ganhou e você perdeu!", larg/2, 0.91*alt);
    }
  }
  if (carro2) {
    if (val2) {
      fill(98, 66, 90);
      rect(0.35*larg, 0.89*alt, 0.65*larg, 0.05*alt);
      fill(0, 0, 0);
      text("Você ganhou!", larg/2, 0.91*alt);
    } else if (val1 || val3) {
      fill(98, 66, 90);
      rect(0.35*larg, 0.89*alt, 0.65*larg, 0.05*alt);
      fill(0, 0, 0);
      text("Carro 2 ganhou e você perdeu!", larg/2, 0.91*alt);
    }
  }
  if (carro3) {
    if (val3) {
      fill(98, 66, 90);
      rect(0.35*larg, 0.89*alt, 0.65*larg, 0.05*alt);
      fill(0, 0, 0);
      text("Você ganhou!", larg/2, 0.91*alt);
    } else if (val1 || val2) {
      fill(98, 66, 90);
      rect(0.35*larg, 0.89*alt, 0.65*larg, 0.05*alt);
      fill(0, 0, 0);
      text("Carro 3 ganhou e você perdeu!", larg/2, 0.91*alt);
    }
  }
}

void keyPressed() {
  if (keyCode == ENTER)
    fechado = false;
}


void mousePressed() {
  if (mouseX >= x1 && mouseX <= x1+0.085*larg 
    && mouseY >= alt/4 && mouseY <= alt/4 + alt/10) {
    val1 = true;
    val2 = false;
    val3 = false;
  } else if (mouseX >= x2 && mouseX <= x2+0.085*larg 
    && mouseY >= 0.465*alt && mouseY <= 0.465*alt + alt/10) {
    val1 = false;
    val2 = true;
    val3 = false;
  } else if (mouseX >= x3 && mouseX <= x3+0.085*larg 
    && mouseY >= 0.66*alt && mouseY <= 0.66*alt + alt/10) {
    val1 = false;
    val2 = false;
    val3 = true;
  } else {
    val1 = false;
    val2 = false;
    val3 = false;
  }
}
