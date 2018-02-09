//air resistance, fluid resistance
//density -- mi du
//the difference between friction and drag force is 
//drag force need to mult(c*speed*speed);
//speed is the magnitude of the velocity

Mover m;

void setup() {

  size(640, 300);
  m = new Mover();
}

void draw() {

  background(255);

  PVector gravity = new PVector(0, 0.3);
  gravity.mult(m.mass);
  m.applyForce(gravity);

  //mousePressed means you need to hold the mouse
  if (mousePressed) {
    PVector drag = m.velocity.copy();
    drag.normalize();
    //drag.mult(-1);
    float c = -0.03;
    float speed = m.velocity.mag();
    drag.mult(c*speed*speed);
    m.applyForce(drag);
  }


  m.move();
  m.edges();
  m.display();
}

class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;


  Mover() {

    location = new PVector(width/2, 0);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = 2;
  }


  void move() {

    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(10);
    acceleration.mult(0);
  }

  void edges() {

    if (location.x + 20 > width) {
      location.x  = width - 20;
      velocity.x = -velocity.x;
    } else if (location.x < 20) {

      velocity.x *= -1;
      location.x = 0;
    }

    if (location.y + 20>height) {
      location.y  =height -20;
      velocity.y = -velocity.y;
    }
  }

void display() {

  fill(175);
  ellipse(location.x, location.y, 20, 20);
}

void applyForce(PVector force) {
  PVector f = PVector.div(force, mass);
  acceleration.add(f);
}

}