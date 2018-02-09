oscillator o;

void setup() {
  size(640, 360);
  o = new oscillator();
  background(255);
}

void draw() {
  fill(0,30);
  rect(0, 0, width, height);
  //background(25f,0f);//why can't I see the trail?
  o.update();
  o.display();
}

class oscillator {
  PVector angle;
  PVector vel;
  PVector amplitude;
  float x;
  float y;

  oscillator() {
    angle = new PVector(0, 0);
    vel = new PVector(0.03, 0.03);
    amplitude = new PVector(360, 180);
  }

  void update() {
    angle.add(vel);
    //x = amplitude.x * sin(angle.x);
    x++;
    y = amplitude.y * sin(angle.y );
    

  }

  void display() {
    pushMatrix();
    translate(0, height/2);
    fill(255);
    noStroke();
    ellipse(x, y, 36, 36);
    popMatrix();
  }
}