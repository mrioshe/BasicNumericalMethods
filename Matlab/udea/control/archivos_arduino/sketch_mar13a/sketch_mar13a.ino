void setup() 
{Serial.begin(9600);
pinMode(13,OUTPUT);
}
void loop() {
  if(Serial.available()>0){
    String a=Serial.readString();
    if(a=="hola"){digitalWrite(13,HIGH);
    Serial.println('\n');Serial.println("Led encendido");
    }
    else if(a=="adios"){
      digitalWrite(13,LOW);
      Serial.println('\n');
      Serial.println("Led apagado");
      }
      else
      Serial.println("no escriba bobadas");
      
      }
      }
