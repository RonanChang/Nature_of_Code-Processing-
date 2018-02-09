Attractor a;
Mover[] movers;

void setup() {
  size(800, 600);
  //a = new Attractor(mouseX,mouseY);

  movers = new Mover[8];
  for (int i = 0; i<movers.length; i++) {
    movers[i] = new Mover(random(width), random(height));
  }
}

void draw() {
  background(0);
  a = new Attractor(mouseX,mouseY);

  for (int i = 0; i<movers.length; i++) {

    PVector f = a.attract(movers[i]);
    movers[i].applyForce(f);
    movers[i].update();
    movers[i].display();
  }
  a.display();
}

class Attractor {
  PVector loc;
  float mass;
  float G;

  Attractor(float _x, float _y) {
    loc = new PVector(_x, _y);
    mass = 20;
    G = 1;
  }

  //this is a function that returns a PVector
  //because we are in the attractor object so we don't need to say attractor.loaction
  PVector attract(Mover m) {
    PVector force = PVector.sub(loc, m.loc);//notice the order of the objects here
    float d = force.mag();
    d = constrain(d, 10, 15);//notice this is not the real world, so the distance may be too far for the pixels;
    force.normalize();//this is the direction of the force;
    force.mult(G*mass*m.mass/(d*d));

    return force;
  }

  void display() {
    ellipse(loc.x, loc.y, 50, 50);
  }
}

class Mover {
  PVector loc;
  PVector vel;
  PVector acc;
  float mass;
  float size;
  float a = 0.0;
  float aVel = 0.0;
  float aAcc = 0.001;

  Mover(float _x, float _y) {
    loc = new PVector(_x, _y);
    vel = new PVector(1, 0);
    acc = new PVector(0, 0);
    mass = random(2,3);
    size = mass*10;
  }

  void update() {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
    
    aAcc = map(noise(50),0,1,0,0.001);
    aVel += aAcc;
    a += aVel;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }

  void display() {

    pushMatrix();
    translate(loc.x, loc.y);
    rotate(a);
    rectMode(CENTER);
    noStroke();
    rect(0, 0, size, size);
    popMatrix();
  }
}