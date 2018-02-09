ArrayList<Box> boxes;
Box b;

void setup(){
  size(800,600);
  boxes = new ArrayList<Box>();
  
}

void draw(){
  background(255);
  
  if(mousePressed){
   Box box = new Box(mouseX,mouseY);
   boxes.add(box);
  }
  
  for(int i = 0;i<boxes.size();i++){
   Box b = boxes.get(i);
   b.update();
   b.display();
  }
}

class Box{
  PVector loc;
  PVector vel;
  PVector acc;
  
  
  Box(int x,int y){
    loc = new PVector(x,y);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    
  }
  
  void update(){
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  }
  
  void display(){
    pushMatrix();
    translate(loc.x,loc.y);
    fill(0);
    noStroke();
    ellipse(0,0,16,16);
    popMatrix();
  }
  
}