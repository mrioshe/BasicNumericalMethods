int error=0;
int IN=0;
int RTA=0;
int pwm=0;
int rpm=0;
void setup() {
 pinMode(10,OUTPUT);
 pinMode(11,OUTPUT);
 Serial.begin(9600);
}

void loop() {
if(Serial.available()>0){

  IN=Serial.readString().toInt();
  
  }

  
error=IN-RTA;
rpm=rpm+k*error;
pwm=rpm*255/500;
analogWrite(10,pwm)
if (pwm>255)
pwm=255;
if(pwm<0)
pwm=0;
delay(10000)
function encoder
RTA=encoder

}
