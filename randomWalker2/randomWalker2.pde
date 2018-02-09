Walker w;

void setup() {

  size(500, 300);
  w = new Walker();
}


void draw() {

  //background(255);

  w.walk();
  w.display();
}

class Walker {

  int x, y;

  Walker() {


    x = width/2;
    y = height/2;
  }

  void walk() {

    float r = random(1);
    if (r < 0.5) {
      if (mouseX>x) {

        x+=2;
      } else {
        x-=2;
      }

      if (mouseY>y) {
        y+=2;
      } else {
        y-=2;
      }
    } else {

      if (mouseX<x) {
        x+=2;
      } else {
        x-=2;
      }

      if (mouseY<y) {

        y+=2;
      } else {
        y-=2;
      }


      x = constrain(x, 0, width-1);
      y = constrain(y, 0, height-1);
    }
  }

  void display() {

    fill(0);
    ellipse(x, y, 4, 4);
  }
}