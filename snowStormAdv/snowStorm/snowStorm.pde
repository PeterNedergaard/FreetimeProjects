
class Snowflake {

  float startxCoord;
  float startyCoord;
  float xCoord;
  float yCoord;
  float randX;
  float startrandX;
  float randSpeed;
  float randReach;
  float randTurnspd;
  float size;
  boolean direc;

  Snowflake() {
    reset();
  }

  public void move() {
    if (this.xCoord > this.startxCoord + ((this.startxCoord / 100) * this.randReach)) {
      direc = true;
    }
    if (this.xCoord < this.startxCoord - ((this.startxCoord / 100) * this.randReach)) {
      direc = false;
    }

    if (direc == true) {
      this.randX -= (this.startrandX / this.randTurnspd);
      if (this.randX < - this.startrandX) {
        this.randX = - this.startrandX;
      }
    } else {
      this.randX += (this.startrandX / this.randTurnspd);
      if (this.randX > this.startrandX) {
        this.randX = this.startrandX;
      }
    }

    if (this.yCoord > height + 10) {
      reset();
      return;
    }

    this.yCoord +=this.randSpeed;
    this.xCoord +=this.randX;

    stroke(255);
    ellipse(this.xCoord, this.yCoord, this.size, this.size);
  }



  void reset() {
    this.startxCoord = random(width);
    this.startyCoord = random( - 500, - 50);
    this.randX = random(0.5, 2);
    this.randSpeed = random(0.7, 2.5);
    this.randReach = random(10, 30);
    this.randTurnspd = random(40, 80);
    this.size = random(8, 12);

    this.xCoord = startxCoord;
    this.yCoord = startyCoord;
    this.startrandX = randX;

    this.direc = false;
  }
}

int snowNumb = 100;
Snowflake[] snow = new Snowflake[snowNumb];

void setup() {
  fullScreen();

  for (int i = 0; i < snowNumb; i++) {

    snow[i] = new Snowflake();
  }
}





void draw() {
  background(150);

  for (int i = 0; i < snowNumb; i++) {

    snow[i].move();
  }
}
