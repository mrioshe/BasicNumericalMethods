bool encendido=false;
bool derecha=false;
bool marcha=false;
bool izquierda=false;

void setup() {
 Serial.begin(9600);
 pinMode(13,OUTPUT);
 pinMode(12,OUTPUT);
 pinMode(11,OUTPUT);

}

void loop() {
if(Serial.available()>0){
  String q=Serial.readString();
  int a=0;

  if (q=="led_on\r")
  a=1;
  
  else if (q=="led_off\r")
  a=2;
  
  else if (q=="motor_on\r")
  a=3;
  
  else if (q=="derecha\r")
  a=4;
  
  else if (q=="izquierda\r")
  a=5;
  
  else if (q=="motor_off\r")
  a=6;
  
  switch (a){

  case 1:
  digitalWrite(13,HIGH);
  break;

  case 2:
  digitalWrite(13,LOW);
  break;

  case 3:
  encendido=true;
  break;

   case 4:
  if (encendido==true & marcha==false & izquierda==false ){
      digitalWrite(12,HIGH);
      marcha=true;
      derecha=true;
    }

     if (encendido==true & marcha==false & izquierda==true ){
      digitalWrite(11,LOW);
      marcha=false;
      derecha=true;
      izquierda=false;
      delay(2000);
      digitalWrite(12,HIGH);
      marcha=true;
    }
  break;
  
   case 5:
  if (encendido==true & marcha==false & derecha==false ){
      digitalWrite(11,HIGH);
      marcha=true;
      izquierda=true;
    }

     if (encendido==true & marcha==false & derecha==true ){
      digitalWrite(12,LOW);
      marcha=false;
      derecha=false;
      izquierda=true;
      delay(2000);
      digitalWrite(11,HIGH);
      marcha=true;
    }
  break;

  case 6:

      digitalWrite(12,LOW);
      marcha=false;
      derecha=false;
      izquierda=false;
      digitalWrite(11,LOW);
      marcha=false;
      encendido=false;
  break;


  }  
 }
}
