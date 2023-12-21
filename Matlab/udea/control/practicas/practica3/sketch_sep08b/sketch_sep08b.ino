int Paso [ 8 ][ 4 ] =
   {  {1, 0, 0, 0},
      {1, 1, 0, 0},
      {0, 1, 0, 0},
      {0, 1, 1, 0},
      {0, 0, 1, 0},
      {0, 0, 1, 1},
      {0, 0, 0, 1},
      {1, 0, 0, 1}
   };
#define IN1  13
#define IN2  12
#define IN3  11
#define IN4  10


int steps_left=45;
boolean Direction = true;
int Steps = 0;                       // Define el paso actual de la secuencia
int act=0;
int ant=0;
int k=0;

void setup()
   { pinMode(IN1, OUTPUT);
     pinMode(IN2, OUTPUT);
     pinMode(IN3, OUTPUT);
     pinMode(IN4, OUTPUT);
     Serial.begin(9600);
   }
void loop()
   { 
    if(Serial.available()>0){
      String a=Serial.readString();
      float b=a.toFloat();
      Serial.println(b);
      if (k==0){
        act=b+1;
        k=1;
        }
        else
        {
          act=b;
          }
      
      
      if (act-ant>0){
      steps_left=act-ant;
      ant=act+1;}
      else
      {
        Direction =! Direction;
        steps_left=-ant-act;

      }




    while(steps_left>0)
        { 
           stepper() ;     // Avanza un paso
           steps_left-- ;  // Un paso menos
           delay (100) ;
           
        }
     /*delay(300);
     Direction =! Direction;  // Invertimos la direceccion de giro
     steps_left = 45;*/
   }
   }
   
void stepper()            //Avanza un paso
   {  digitalWrite( IN1, Paso[Steps][ 0] );
      digitalWrite( IN2, Paso[Steps][ 1] );
      digitalWrite( IN3, Paso[Steps][ 2] );
      digitalWrite( IN4, Paso[Steps][ 3] );


      SetDirection();
   }
void SetDirection()
   {  
      if(Direction)
         Steps++;
      else
         Steps--;


      Steps = ( Steps + 8 ) % 8 ;
   }
