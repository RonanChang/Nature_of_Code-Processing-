import java.util.Random;
Random generator;//This tells us generator is a random number

void setup(){
  size(400,300);
  background(255);
  smooth();
  generator = new Random();
  
} 

void draw(){

 float x = (float) generator.nextGaussian();
 //this random generator is chosen by Gaussian standard(mean= 0.0  standard deviation = 1.0)
 
 float sd = 60;
 float m = width/2;
 x = (x*sd)+m;
 
 noStroke();
 fill(0,10);
 noStroke();
 ellipse(x,height/2,16,16);
 
}