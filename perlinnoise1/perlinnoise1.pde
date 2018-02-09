// perlin noise
// a way to make things more natural,smooth and organic

//float x = random(width);//it's wrong to write it here,bcz it wrong run this code repeatedly

float t = 0;//global variable; t is specific,so the circle is not moving, so..

void setup(){

size(400,300);
frameRate(10);//slow it down, 10 frames per second
}

void draw(){
  
  background(0);
  fill(255);
  
  t = t + 0.05;
  //float x = random(width);
  //noise() will always give a number between 0 and 1, unless we map() it
  
  float x = noise(t);//t = time
  x = map(x,0,1,0,width);
  ellipse(x,height/2,40,40);

}