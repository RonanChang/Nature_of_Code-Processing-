import java.util.Random;

Random generator;

void setup(){

 size(400,300);
 generator = new Random();
 
}
void draw(){

  background(255);
  float h = (float) generator.nextGaussian();
  h=h*20;
  h=h+200;
  
  fill(0);
  ellipse(h,height/2,30,30);
  

}