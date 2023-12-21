void setup() {
  Serial.begin(9600);
    pinMode(11,OUTPUT);

}

void loop() {
  int a=analogRead(A0);
  Serial.println(a);
  delay(50);


}
