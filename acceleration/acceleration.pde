Mover m;

void setup(){

 size(400,300);
 m = new Mover();
}


void draw(){
background(255);
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
 
void update(){
 //acceleration =  PVector.random2D();//set a random scceleration
  
 PVector mouse = new PVector(mouseX,mouseY);
 mouse.sub(location);
 mouse.setMag(0.5);//becasue we don't want to simulate teleportation,and we don;t a huge accelaration
                   //so we need to shrink the acceleration.Ofc, we can use normalize() or mult();
 acceleration = mouse;
 
 velocity.add(acceleration);
 location.add(velocity);
 
 velocity.limit(5);//if the velocity is greater than 5, shrink it down to 5;
}

void edges(){

 if(location.x + 20> width) location.x = 20;
 if(location.x <  20 )   location.x = width;
 if(location.y + 20 > height) location.y = 20;
 if(location.y < 20 ) location.y = height;
}


void display(){

 stroke(0);
 fill(127);
 ellipse(location.x,location.y,40,40);

}

}