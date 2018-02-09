Ball[] balls ;
Liquid liquid;

void setup() {
  //colorMode(HSL,360,100,100);
  size(800, 600);

  balls = new Ball[10];
  for (int i = 0; i<balls.length; i++) {
    balls[i] = new Ball(random(width), 0);
  }


  liquid = new Liquid(0, height/2, width, height/2, 0.5);
}

void draw() {

  background(0);

  liquid.display();


  for (int i = 0; i<balls.length; i++) {
    PVector gravity;
    gravity = new PVector(0, 0.1);
    gravity.mult(balls[i].mass);
    balls[i].applyForce(gravity);

    if (balls[i].isInside(liquid)) {
      balls[i].drag(liquid);
    }
    balls[i].update();
    balls[i].edges();
    balls[i].display();
    
  }
}

class Ball {
  PVector loc;
  PVector vel;
  PVector acc;
  float mass;
  float r;
  float d;

  Ball(float x_, float y_) {
    mass = random(2, 4);
    r = mass*5;
    d = 2*r;
    loc = new PVector(x_, y_);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }

  boolean isInside(Liquid l) {
    if (loc.x>l.x && loc.x<l.x+l.w && loc.y>l.y && loc.y < l.y+l.h) {
      return true;
    } else {
      return false;
    }
  }

  void update() {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }

  void drag(Liquid l) {

    PVector drag = vel.copy();
    float speed = vel.mag();
    float dragMag = l.c * speed * speed;
    drag.normalize();
    drag.mult(-1);
    drag.mult(dragMag);

    applyForce(drag);
  }
  void edges() {

    if (loc.x + r > width) {
      loc.x  = width - r;
      //vel.x = -vel.x;
    } else if (loc.x < r) {

      vel.x *= -1;
      loc.x = 0;
    }

    if (loc.y + r > height) {
      loc.y  = height - r;
      //vel.y = -velocity.y;
    }
  }

  void display() {
    noStroke();
    fill(255);
    ellipse(loc.x, loc.y, d, d);
  }
}

class Liquid {
  float x, y, w, h;
  float c;

  Liquid(float _x, float _y, float _w, float _h, float _c) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    c = _c;
  }

  void display() {
    fill(0, 0, 255);
    rect(x, y, w, h);
  }
}