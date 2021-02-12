


void setup() {
  fullScreen();
}


int snowNumb = 100;
float[] startxCoord = new float[snowNumb];
float[] startyCoord = new float[snowNumb];
float[] xCoord = new float[snowNumb];
float[] yCoord = new float[snowNumb];
float[] randX = new float[snowNumb];
float[] startrandX = new float[snowNumb];
float[] randSpeed = new float[snowNumb];
float[] randReach = new float[snowNumb];
float[] randTurnspd = new float[snowNumb];
boolean loop = true;
boolean direc = false;

void draw() {
  background(150);
  while (loop == true) {

    for (int i = 0; i < snowNumb; i++) {

      startxCoord[i] = random(width);
      startyCoord[i] = random(-500, -50);
      randX[i] = random(0.5, 2);
      randSpeed[i] = random(0.7, 2.5);
      randReach[i] = random(10, 30);
      randTurnspd[i] = random(40, 80);

      xCoord[i] = startxCoord[i];
      yCoord[i] = startyCoord[i];
      startrandX[i] = randX[i];
    }
    loop = false;
  }


  for (int i = 0; i < snowNumb; i++) {

    if (xCoord[i] > startxCoord[i]+((startxCoord[i]/100)*randReach[i])) {
      direc = true;
    }
    if (xCoord[i] < startxCoord[i]-((startxCoord[i]/100)*randReach[i])) {
      direc = false;
    }

    if (direc == true) {
      randX[i] -= (startrandX[i]/randTurnspd[i]);
      if (randX[i] < -startrandX[i]) {
        randX[i] = -startrandX[i];
      }
    } else {
      randX[i] += (startrandX[i]/randTurnspd[i]);
      if (randX[i] > startrandX[i]) {
        randX[i] = startrandX[i];
      }
    }

    if (yCoord[i] > height+10) {
      yCoord[i] = startyCoord[i];
    }

    yCoord[i]+=randSpeed[i];
    xCoord[i]+=randX[i];

    stroke(255);
    ellipse(xCoord[i], yCoord[i], 10, 10);
  }
}
