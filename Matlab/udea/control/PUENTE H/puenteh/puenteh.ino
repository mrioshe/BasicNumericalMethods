float P = 0.5;
float pwm =0.25;
int Estado_Actual = 0;

void setup() {
Serial.begin(9600);
pinMode(7,OUTPUT);
pinMode(8,OUTPUT);
digitalWrite(7,HIGH);
digitalWrite(8,HIGH);
delay(1000);
}

void loop() {
  Estado_Actual = millis();

  
if (Estado_Actual < 1000){
digitalWrite(8,LOW);
delayMicroseconds(125);
digitalWrite(8,HIGH);
delayMicroseconds(125);
} 

else if (Estado_Actual >= 1000 && Estado_Actual < 1500){
digitalWrite(8,LOW);
delayMicroseconds(250);
digitalWrite(8,HIGH);
delayMicroseconds(250);
} 

else if (Estado_Actual >= 1500 && Estado_Actual < 2000){
digitalWrite(8,LOW);
delay(375);
digitalWrite(8,HIGH);
delay(125);
}

else if (Estado_Actual >= 2000 && Estado_Actual < 2500){
digitalWrite(8,LOW);
delayMicroseconds(5000);
}

else{
digitalWrite(7,HIGH);
digitalWrite(8,LOW);
}

}
