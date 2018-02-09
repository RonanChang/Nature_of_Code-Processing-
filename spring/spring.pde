float angle = 0;
float aVel = 0.1;
float y;
void setup(){
 size(640,360);
}

void draw(){
 background(255);
 
 angle += aVel;
 y = map(cos(angle),-1,1,50,150);
 
 translate(width/2,0);
 line(0,0,0,y);
 fill(175);
 ellipse(0,y,36,36);
 
}