Walker w;

void setup(){
size(400,300);
w = new Walker();


}

void draw(){

w.walk();
w.display();

}

class Walker{
 //float x;
 //float y;
 PVector location;
 //float tx,ty;
 PVector time;
 //float sx,sy;
 PVector size;
 
 Walker(){
 
 //x = width/2;
 //y = height/2;
 location = new PVector(width/2,height/2);
 //tx = 0;
 //ty = 1000;
 time = new PVector(0,1000);
 size = new PVector(0,0);
 }

void walk(){
 time.x = time.x + 0.1;
 time.y = time.y + 0.1;
  size.x = map(noise(time.x),0,1,0,5);
  size.y=map(noise(time.y),0,1,0,5);
  
  int choice = (int)random(4);
  
  if (choice==0){
    
    location.x = location.x+size.x;
  }
  else if(choice == 1){
   location.x = location.x-size.x;
  }

  else if(choice ==2){
   location.y=location.y+size.y;
  }
  else{
   location.y=location.y-size.y;
  }


}

void display(){

 ellipse(location.x,location.y,1,1);

}

}