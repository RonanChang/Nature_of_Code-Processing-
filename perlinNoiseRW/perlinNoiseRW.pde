Walker w;
void setup() {

  size(400, 300);
  frameRate(10);

  w = new Walker();
}

void draw() {
  w.walk();
  w.display();
}

class Walker {
  float x;
  float y;
  float t=0;
  //float m=0;
  float m=10000;
  /*
This is because the noise function is deterministic:
   it gives you the same result for a specific time t each and every time. 
   If we asked for the noise value at the same time t for both x and y, 
   then x and y would always be equal, 
   meaning that the Walker object would only move along a diagonal.
   Instead, we simply use two different parts of the noise space, 
   starting at 0 for x and 10,000 for y 
   so that x and y can appear to act independently of each other.
   */

  Walker() {

    //x = width/2;
    //y = height/2;
  }
  void walk() {


    t = t+0.01;
    m = m+0.01;
    x = noise(t);
    x = map(x, 0, 1, 0, width);
    y = noise(m);
    y = map(y, 0, 1, 0, height);
  }

  void display() {
    ellipse(x, y, 1, 1);
  }
}