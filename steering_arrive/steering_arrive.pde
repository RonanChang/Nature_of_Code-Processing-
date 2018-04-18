ArrayList<Vehicle> vehicles = new ArrayList<Vehicle>();
int num_vehicle = 30;
void setup(){
size(800,600);
for(int i = 0;i<num_vehicle;i++){
  vehicles.add(new Vehicle(random(width),random(height)));
}
}
void draw(){
background(255);
PVector mouseVector = new PVector(mouseX,mouseY);

for(int i = 0;i<vehicles.size();i++){
 
     Vehicle v = vehicles.get(i); 
        v.update();
        //v.seek(mouseVector);
        v.arrive(mouseVector);
        v.display();
}
//we can also use an enhanced loop.
//for(Vehicle v:vehicles){
//  v.update();
//  v.seek(mouseVector);
//  v.display();
//}
}

class Vehicle{
  
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float neighborDistance;
  float maxspeed;
  float maxforce;
 Vehicle(float x, float y){
 
  loc = new PVector(x,y);
  vel = new PVector(random(-1,1),random(-2,2));
  acc = new PVector(0,0);
  r = 4;
  neighborDistance = 100;
  maxspeed = 4;
  maxforce = 0.1;
  
 }
 void seek(PVector target){
   PVector desired = PVector.sub(target,loc);
   desired.normalize();
   desired.mult(maxspeed);
   PVector seekForce = PVector.sub(desired,vel);
   seekForce.limit(maxforce);
   applyForce(seekForce);
   
 }
 void arrive(PVector target){
   PVector desired = PVector.sub(target,loc);
   float d = desired.mag();
   if(d < neighborDistance){
    float m = map(d,0,neighborDistance,0,maxspeed);
    desired.setMag(m);
   }
  else{
    desired.setMag(maxspeed);
  }
  
  PVector steer = PVector.sub(desired,vel);
  steer.limit(maxforce);
  applyForce(steer);
  
  //show the distance
  pushMatrix();
  noFill();
  stroke(255,0,0);
  ellipse(target.x,target.y,neighborDistance,neighborDistance);
  popMatrix();
  
 }
 void applyForce(PVector f){
   acc.add(f);
 }
 void update(){
  vel.add(acc);
  vel.limit(maxspeed);
  loc.add(vel);
  acc.mult(0);
 }
 
 void display(){
   float theta = vel.heading2D() + PI/2;
   
   pushMatrix();
   translate(loc.x,loc.y);
   noStroke();
   fill(0);
   rotate(theta);
   beginShape();
   vertex(0, -r*2);
   vertex(-r, r*2);
   vertex(r, r*2);
   endShape(CLOSE);
   popMatrix();
 }

}