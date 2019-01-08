import processing.video.*;          //Importing the "Video" Library (Select "Add Library..." from the "Import Library..." Sub-Menu within the "Sketch" Menu).
import processing.serial.*;         //Importing the "Serial" Library.
Capture Video;                      //Making an Object Video of class Capture.

void captureEvent(Capture Video)    //captureEvent() is  a built-in function that runs whenever there is a frame avialable.
{
Video.read();                       //Whenever the frame is available we read the frame.
}

void setup()                        // void setup() function runs only once during program initialization.
{
  size(640,480);                    //Size of the window.
  Video=new Capture(this,640,480);  //Information about the video.
  Video.start();                    //Starting the video.
}

void draw()                         //void draw() function runs infinite number of times until the program is closed.
{
  int k=0,l=0,m=0;
  loadPixels();                     //Loading pixels of the screen.
  Video.loadPixels();               //Loading pixels of the video.
  image(Video,0,0);                 //Drawing one frame of video on the screen.
  rectMode(CENTER);                 //Setting the starting drawing point for the rectangle to be the point where the diagonals of the rectangle cross each other.
  stroke(255,255,255);              //Setting outline color to be white.
  strokeWeight(5);                  //Setting thickness of the outline.
  noFill();                         //Setting no color fill in the shape.
  rect(width/2,height/2,100,100);   //Drawing a rectangle taking reference point to be width/2 and height/2 and length and breadth of the rectangle to be 100 by 100 pixels.
  stroke(0);                        //Setting color of line to be black.

  for(int x=(width/2-50);x<(width/2+50);x++)   //Starting a loop from begining of the ractangle to end (width wise).
  {
  for(int y=(height/2-50);y<(height/2+50);y++) //starting loop from begining of the rectangle to end (height wise).
  {
   int loc=x+y*Video.width;                    //To refer to the pixels in the format of coordinate sytem (since the pixels on the screen are in the form of an array).
   color currentColor=Video.pixels[loc];       //Declaing a variable of type currentColor which contains the color of the specific pixel.
   float r=red(currentColor);                  //Obtaining the RED value of that currentColor.
   float g=green(currentColor);                //Obtaining the GREEN value of that currentColor.
   float b=blue(currentColor);                 //Obtaining the BLUE value of that currentColor.
   float h=dist(r,g,b,255,0,0);                //Finding distance between currentColors' r,g,b values and RED color.
   float i=dist(r,g,b,0,255,0);                //Finding distance between currentColors' r,g,b values and GREEN color.
   float j=dist(r,g,b,0,0,255);                //Finding distance between currentColors' r,g,b values and BLUE color.
   
   if(((h<i)&&(h<j)))             //Checking if RED color is closest to the obtained color from the screen.               
   {
   k++;
   }
   
   if(((i<h)&&(i<j)))            //Checking if GREEN color is closest to the obtained color from the screen.
   {
   l++;
   }
   
   if(((j<i)&&(j<h)))            //Checking if BLUE color is closest to the obtained color from the screen.
   {
   m++;
   }
   }
   }
  
  if((k>l)&&(k>m))                      //If the quantity of pixels whose "RED Value" is closest to "RED Color" is maximum, then color is RED.
{ fill(225,30,30);                      //Setting fill color RED.
  strokeWeight(3);                      //Setting line thickness.
  textSize(40);                         //Setting text size.
  text("Color Detected: RED",120,40);   //Printing text and its starting point on screen.
}

  if((l>k)&&(l>m))                       //If the quantity of pixels whose "GREEN Value" is closest to "GREEN Color" is maximum, then color is GREEN.
{ fill(0,255,30);                        //Setting fill color GREEN.
  strokeWeight(3);                       //Setting line thickness.
  textSize(40);                          //Setting text size.
  text("Color Detected: GREEN",100,40);  //Printing text and its starting point on screen. 
}

  if((m>k)&&(m>l))                      //If the quantity of pixels whose "BLUE Value" is closest to "BLUE Color" is maximum, then color is BLUE.
{ fill(0,30,255);                       //Setting fill color BLUE.
  strokeWeight(3);                      //Setting line thickness.
  textSize(40);                         //Setting text size.
  text("Color Detected: BLUE",110,40);  //Printing text and its starting point on screen.
}
}
