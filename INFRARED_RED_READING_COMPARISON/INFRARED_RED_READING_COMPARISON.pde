// PPG with Processing
// Created by Jiayi Chen
// Date: 29-09-2016

import processing.serial.*;

Serial myPort;        // The serial port
int xPos = 1;         // horizontal position of the graph
float oldinput = 0;
float oldave = 0;
PrintWriter output;   // Create an object for exporting data
PrintWriter output_average;

int LM_SIZE = 5;
float[] LM =  new float[LM_SIZE];      // LastMeasurements
int index = 0;
static float sum = 0;
int count = 0;

float movingAverage = 0;
float previous_time = 0;
float current_time = 0;
float time_difference = 0;
float heart_rate = 0;
float previous_heart_rate = 0;
float input;

int peak = 0;
int trough = 0;

void setup () {
  
  // Create a new file in the sketch directory
  //output = createWriter("infrared_data.txt");
  //output_average = createWriter("movingAverage.txt");
  
  // set the window size:
  size(800, 700);
  
  // I know that the first port on my mac is
  // Serial.list()[0].
  myPort = new Serial(this, Serial.list()[2], 9600);

  // don't generate a serialEvent() unless you get a newline character:
  myPort.bufferUntil('\n');

  // set inital background:
  background(0);
  
  //font = loadFont("Arial-BoldMT-24.vlw");
  //textFont(font);
}
void draw () {
  // draw the line:
  stroke(255, 255, 0);
  
      //line(xPos, (height-input), xPos, height);
  if (input > 100 && input < 600)
      line(xPos-1, (height-oldinput), xPos, height-input);
      oldinput = input;
      
      //line(xPos-1, (height-oldave), xPos, height-movingAverage);
      //oldave = movingAverage;
      // at the edge of the screen, go back to the beginning:
      if (xPos >= width) {
          xPos = 1;
          background(0);
      } else {
        // increment the horizontal position:
         xPos++;
      }
}

}

void serialEvent (Serial myPort) {
  // get the ASCII string:
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {
    
    // Store the old value for line drawing purpose
    //oldinput = input;
    // trim off any whitespace:
    //inString = trim(inString);
    // convert to an int and map to the screen height:
    input = float(inString)*2-300;
    //println("Input = " + input);
    movingAverage = runningAverage(input);
    //println(" Average = " + movingAverage);     
    //output.println(input);
    //output_average.println(movingAverage);
    //inByte = map(inByte*20, 0, 600, 0, height-400);
    
    // Wait 3 seconds before calculating heart rate
    if ( millis() > 5000){
    // Calculating heart rate
    
      // Detects peak of the period
      if ( (input > movingAverage) && (peak == 0)){
      
         current_time = millis();
         time_difference = current_time - previous_time;
         //println("Current_time = " + current_time);
         //println("previous_time = " + previous_time);
         heart_rate = 60.0/(time_difference*0.001);
         previous_time = current_time;
         if ( abs(heart_rate - previous_heart_rate) < 30.0 ){
           if ( heart_rate > 50 && heart_rate < 150 ){
               println("heart rate = " + heart_rate);
           }
         }
         previous_heart_rate = heart_rate;
         peak = 1;
         trough = 0;
      }
      
      // Detects trough of the period
      if (input < movingAverage && (trough == 0)){
          peak = 0;
          trough = 1;
         
      }    
    }
 
  }
}

// runningAverage for heart rate counting
float runningAverage(float M) {
  
  // keep sum updated to improve speed.
  sum -= LM[index];
  LM[index] = M;
  sum += LM[index];
  
  index++;
  index = index % LM_SIZE;
  if (count < LM_SIZE) count++;

  return (sum / count);
}
