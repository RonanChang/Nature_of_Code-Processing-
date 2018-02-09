Walker w;
void setup(){
   w = new Walker();
   size(800,600);
   background(255);

}

void draw(){
  w.walk();
  w.display();
}

class Walker{
 float x;
 float y;
 
 Walker(){
  x=width/2;
  y=height/2;
 }
 void walk(){
   
 int choice = int(random(4));
 
 if(choice==0){
  x++;
 }
 
 else if(choice==1)
 {
  x--;
  
 }
 
 else if(choice ==3)
 {
 
 y++;}
 else{
  y--;
 }
 }
 
 void display(){
  point(x,y);
  stroke(0);
 }
}