Attractor a;
Mover[] movers;

void setup() {
  size(800, 600);
  a = new Attractor();

  movers = new Mover[5];
  for (int i = 0; i<movers.length; i++) {
    movers[i] = new Mover(random(width),random(height));
  }
}

void draw() {
  background(0);
  
  for(int i = 0;i<movers.length;i++){

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

  Attractor() {
    loc = new PVector(width/2, height/2);
    mass = 20;
    G = 1;
  }

  //this is a function that returns a PVector
  //because we are in the attractor object so we don't need to say attractor.loaction
  PVector attract(Mover m) {
    PVector force = PVector.sub(loc, m.loc);//notice the order of the objects here
    float d = force.mag();
    d = constrain(d, 5, 25);//notice this is not the real world, so the distance may be too far for the pixels;
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

  Mover(float _x,float _y) {
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
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(force);
  }

  void display() {
    ellipse(loc.x, loc.y, size, size);
  }
}