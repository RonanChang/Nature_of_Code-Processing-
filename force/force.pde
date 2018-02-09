Mover m;

void setup(){
 size(640,360);
 m = new Mover();

}

void draw(){

 background(255);
 
 PVector gravity = new PVector(0,0.3);
 m.applyForce(gravity);
 
 if (mousePressed){
   PVector wind = new PVector(0.2,0);
  m.applyForce(wind);}
 
 m.update();
 m.edges();
 m.display();
}


class Mover{

 PVector location;
 PVector velocity;
 PVector acceleration;

 Mover(){
 
  location = new PVector(width/2,height/2);
  velocity = new PVector(0,0);
  acceleration = new PVector(0,0);

}
 
 
  //Newton's 2md law!!!(the beginning)
  void applyForce(PVector f){
  
   
    
    
    //acceleration = f; // if we write it like this, we can't apply two or more forces
   acceleration.add(f);//this can be used when we want two or more forces, but only works 
                //when the acceleration = 0, so we need to reset our acceleration to 0;
  
  }
  
  
 void update(){
 
  velocity.add(acceleration);
  location.add(velocity);
  velocity.limit(10);
  acceleration.mult(0);
 
 }
 
 void edges(){
 
   if(location.x + 20 > width) {
     location.x  = width - 20;
     velocity.x = -velocity.x;
   }else if(location.x < 20){
   
    velocity.x *= -1;
    location.x = 0;
   }
   
   if(location.y + 20>height){
     location.y  =height -20;
     velocity.y = -velocity.y;
   }
 }
 
 
 void display(){
 
  fill(0);
  noStroke();
  ellipse(location.x,location.y,40,40);
 }
 
}