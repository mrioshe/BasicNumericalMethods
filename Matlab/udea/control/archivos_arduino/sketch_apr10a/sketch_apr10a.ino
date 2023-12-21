void setup() {
  pinMode(11,OUTPUT);
  Serial.begin(9600);

}

void loop() {
  int a=analogRead(A0);
  int b=map(a,0,1023,0,255);
  analogWrite(11,b);
  Serial.println(b);

}
