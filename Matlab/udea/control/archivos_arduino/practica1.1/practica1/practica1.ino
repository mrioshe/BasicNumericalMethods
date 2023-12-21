bool control=false;
int cont=0;


void setup() {
 Serial.begin(9600);
 pinMode(13,OUTPUT);
 pinMode(12,OUTPUT);
 pinMode(11,OUTPUT);
 pinMode(9,OUTPUT);

}

void loop() {

if(Serial.available()>0){
  String a=Serial.readString();

   if (a=="1234\r"){
  cont=0;
  Serial.println("Bienvenido, abriendo puerta");
  digitalWrite(13,HIGH);
  digitalWrite(12,HIGH);
  delay(5000);
  digitalWrite(12,LOW);
   digitalWrite(13,LOW);
  delay(1000);
  digitalWrite(11,HIGH);
  Serial.println("Cerrando puerta");
  delay(2000);
  digitalWrite(11,LOW);
  Serial.println("Confirme ingreso, digite clave de cierre");
  delay(3000);
  String b=Serial.readString();
    if (b=="4321\r"){
      Serial.println("Gracias por confirmar");
      }
      
      control==true;
      cont=0;
    }

    
    else if (cont==2 & control==false){
    
   digitalWrite(9,HIGH);
   Serial.println("Clave erronea, sistema bloqueado por 5 segundos");
   delay(5000);
   digitalWrite(9,LOW);
   cont=0;}
  
  else if (cont!=2 & control==false){
  cont=cont+1;
  digitalWrite(9,HIGH);
  Serial.println("Clave erronea, intente de nuevo");
  delay(2000); 
  digitalWrite(9,LOW);
  

  }
  }  
 }
