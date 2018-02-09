//amp = width/2 = 360;
//period = 200 frames

float amplitude = 360;
//float period = 200;
float angle = 0.0;
float angleVel = 0.03;

void setup(){
 size(640,360);
}

void draw(){
 background(255);
 translate(width/2, height/2);
 
 
 //float x = amplitude * sin((frameCount/200)*TWO_PI);
 //float x = amplitude * sin((frameCount/period)*TWO_PI);
 float x = amplitude * sin(angle);
 fill(175);
 stroke(0);
 ellipse(x,0,36,36);
 line(0,0,x,0);
 
 angle += angleVel;
}