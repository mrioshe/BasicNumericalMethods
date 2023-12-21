void setup() {
 pinMode(10,OUTPUT);
 pinMode(11,OUTPUT);
}

void loop() {
  for (int i=0;i<256;i++){
    analogWrite(10,i);
    delay(50);
    }

  for (int i=255;i>-1;i--){
    analogWrite(10,i);
    delay(50);
    }

      for (int i=0;i<256;i++){
    analogWrite(11,i);
    delay(50);
    }

  for (int i=255;i>-1;i--){
    analogWrite(11,i);
    delay(50);
    }

    
analogWrite(10,191);
delay(5000);
analogWrite(10,0);
delay(5000);

}
