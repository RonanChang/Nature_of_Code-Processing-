int[] randomCounts;
//create a array to count how often a number get picked;
 
void setup() {
  size(640,240);
  randomCounts = new int[20];//the length of the array is 20, which means we can pick from 20 numbers
}
 
void draw() {
  background(255);
 
//Pick a random number and increase the count.
  int index = int(random(randomCounts.length));//pick a number called "index" from 0-20;
  randomCounts[index]++;
  //increase the count,for example, if we pick "1", then the first number in the array add 1,
  //so at the beginning, the 20 number are all 0,0,0,0,....
  //then the first number is picked "once", so the array becomes, 1,0,0,0,....
 
  stroke(0);
  fill(175);
  int w = width/randomCounts.length;//the width of the rectangle.
  
//Graphing the results
  for (int x = 0; x < randomCounts.length; x++) {
    rect(x*w,height-randomCounts[x],w-1,randomCounts[x]);//draw 20 rectangles to represent how often all 20 number(from 0 -20) get picked
  }
}