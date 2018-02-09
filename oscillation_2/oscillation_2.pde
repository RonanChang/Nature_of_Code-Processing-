float r = 150;
float a = 0.0;
float aVel = 0.0;
float aAcc = 0.001;


void setup() {
  size(640, 360);
}

void draw() {
  background(0);

  aVel += aAcc;
  a += aVel;
  aVel = constrain(aVel,0,0.1);

  float y = r * sin(a);
  float x = r * cos(a);

  translate(width/2, height/2);
  fill(255);
  stroke(255);
  line(0, 0, x, y);
  ellipse(x, y, 25, 25);
}