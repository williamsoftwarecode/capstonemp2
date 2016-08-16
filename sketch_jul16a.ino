/* Read Period */ 

#include <math.h> 
double alpha = 0.1; 
double T = 0;

void setup() {
  
  /* Define pin A0 as input */ 
  pinMode(0,INPUT); 
  Serial.begin(9600); 
}

void loop() {
  float temperature; 
  
  temperature = analogRead(A0); 
  
  //Serial.print("Output: ");
  Serial.println(temperature); 
  
  //delay(100);
}

