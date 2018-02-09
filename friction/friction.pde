//the direction of friction is opposite to the velocity
//so
//PVector friction = velocity.copy();
//friction.normalize();
//friction.mult(-1);   this is the direction of the friction
//friction.mult(c);    c is a constant number


Mover[] movers;

void setup() {
  size(640, 360);

  movers = new Mover[5];
  for (int i = 0; i < movers.length; i++)
  {
    movers[i] = new Mover();
  }
}

void draw() {

  background(255);

  for (Mover m : movers) {

    PVector gravity = new PVector(0, 0.3);
    gravity.mult(m.mass);//simulate gravity, every ball falls in the same way
    m.applyForce(gravity);

    //let's apply friction
    if (mousePressed) {
      PVector friction = m.velocity.copy();
      friction.normalize();
      friction.mult(-1);
      float c = 0.01;
      friction.mult(c);
      m.applyForce(friction);
    }

    m.update();
    m.edges();
    m.display();
  }
}

class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover() {

    location = new PVector(random(width), 0);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = random(1, 2);
  }


  //Newton's 2md law with mass
  void applyForce(PVector force) {

    PVector f = PVector.div(force, mass);
    //in this way,every time we copy the force and then divide it
    //if we write" force.div(miss); "
    //the same force will be divided again and again


    //acceleration = f; // if we write it like this, we can't apply two or more forces
    acceleration.add(f);
  }


  void update() {

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

    fill(175, 100);
    stroke(0);
    ellipse(location.x, location.y, mass*20, mass*20);
  }
}