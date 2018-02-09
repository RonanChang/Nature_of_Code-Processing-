// vector has x,y components. it has magnitude(size) and direction

//we can use operation + for PVector;However, we have some methods to add PVectors
Ball b;
void setup(){
  size(400,300);
  b = new Ball();
}


void draw(){
 background(255);
 b.move();
 b.bounce();
 b.display();
}

class Ball{

  //float x;
  //float y;
  PVector location;
  //float xspeed;
  //float yspeed;
  PVector velocity;
  
Ball(){

 //x = width/2;
 //y = height/2;
 location = new PVector(width/2,height/2);
 //xspeed = 2;
 //yspeed = 3;
 velocity = new PVector(2,3);
}


void move(){

 //x = x + xspeed;
 //y = y + yspeed;
 location.add(velocity);
 // we can't say location = location + velocity
 
}

void bounce(){

 if(location.x+20>400 || location.x < 20)
 {
 
 //xspeed = -xspeed; 
 velocity.x = -velocity.x;
 }
 if(location.y+20>300 || location.y<20){
 
 //yspeed = -yspeed;
 velocity.y = -velocity.y;
 }

}
 void display(){
   fill(0);
   ellipse(location.x,location.y,40,40); 
 
 }
}