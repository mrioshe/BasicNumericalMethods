int cont1=0;
int cont2=0;
int cont3=0;
unsigned long a=0;
int b=0;
float rpm;
boolean estado1=true;
boolean estado2=true;
int A=2;
int B=3;
int ANTERIOR=50;
volatile int POSICION=50;

void setup() {
  pinMode(11,OUTPUT);
  pinMode(10,OUTPUT);
 // pinMode(A,INPUT);
  //pinMode(B,INPUT);
  attachInterrupt(digitalPinToInterrupt(2),atencion1,CHANGE);
  attachInterrupt(digitalPinToInterrupt(3),atencion2,CHANGE);
  //attachInterrupt(digitalPinToInterrupt(3),atencion2,RISING);
  //attachInterrupt(digitalPinToInterrupt(A),encoder,LOW);

  
  Serial.begin(9600);
}

void loop() {


  analogWrite(11,255);
  if (cont1==6 && cont2==6){
    b=millis()-a;
    a=millis();

    if(estado1==false && estado1==false){
      rpm=7500/b;
      }
    else{
      rpm=-7500/b;
      }
     
    Serial.println(rpm);
    cont1=0;
    cont2=0;
    cont3=0;
    }


}

void atencion1(){
  cont1++;
  estado1=!estado1;
  }

  void atencion2(){
  cont2++;
  estado1=!estado2;
  }



  //void encoder(){
    
   // if (digitalRead(B)==HIGH){
      //POSICION++;
      //}

     // else{
       // POSICION--;
       // }
    
    //}
