//vector Math;
//add();sub() subtract..means take away
//mult(), "scale", grow or shrink it
//mag()
//normalize,keeo the direction but make it have length = 1;


void setup(){
 size(400,300);
}


void draw(){

 background(255);
 strokeWeight(2);
 stroke(0);
 noFill();
 
 translate(width/2,height/2);// translate x axis and y axis to the center of the screen
 ellipse(0,0,4,4);
 
 PVector mouse = new PVector(mouseX,mouseY);
 PVector center = new PVector(width/2,height/2);
 
 mouse.sub(center);//this is what we called "xiang(tone4) li  ang(4) " in physics, in China.
 //ine(0,0,mouse.x,mouse.y);
 //if we write line(0,0,mouseX,mouseY),we will find the line does not follow our mouse
 // that's because the axis has been changed, and mouseX,mouseY are just numbers in the new axis.
 
 //mouse.mult(2);
 
 //float m = mouse.mag();
 //fill(255,0,0);
 //rect(0,0,m,20);
 
 mouse.normalize();
 mouse.mult(50);
 line(0,0,mouse.x,mouse.y);
 

}