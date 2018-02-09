PVector origin;
PVector bob;
float len;
float angle = PI/4;
float aVel;
float aAcc;
float c;

void setup() {
  size(600, 360);
  len = 180;
  c= 0.01;
  origin = new PVector(width/2, 0);
  bob = new PVector(width/2, len);
}
void draw() {
  background(255);

 //notice the order of the lines that we put here.
  angle += aVel;
  aAcc = -c * sin(angle);
  aVel += aAcc;
  aVel *= 0.98;
  bob.x = origin.x + len * sin(angle);
  bob.y = origin.y + len * cos(angle);

  line(origin.x, origin.y, bob.x, bob.y);
  fill(100);
  ellipse(bob.x, bob.y, 36, 36);
}