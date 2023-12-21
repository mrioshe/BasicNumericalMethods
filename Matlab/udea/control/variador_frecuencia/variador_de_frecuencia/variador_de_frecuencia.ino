int M[1][8]={1,3,5,7,7,5,3,1};
int N[1][8]={7,5,3,1,1,3,5,7};
int k=125;
void setup() {
  pinMode(13,OUTPUT);
   pinMode(12,OUTPUT);
 
  /*pinMode(6,OUTPUT);
  pinMode(5,OUTPUT);
  pinMode(3,OUTPUT);*/
}

void loop() {
 for(int i=0;i<8;i++){
  int a=k*M[0][i];
  int b=k*N[0][i];
 digitalWrite(13,HIGH);
 delayMicroseconds(a);
 digitalWrite(13,LOW);
 delayMicroseconds(b);
 digitalWrite(12,LOW);
 delayMicroseconds(a);
 digitalWrite(12,LOW);
 delayMicroseconds(b);
 }
 for(int i=0;i<8;i++){
  int a=k*M[0][i];
  int b=k*N[0][i];
 digitalWrite(13,LOW);
 delayMicroseconds(a);
 digitalWrite(13,LOW);
 delayMicroseconds(b);
 digitalWrite(12,HIGH);
 delayMicroseconds(a);
 digitalWrite(12,LOW);
 delayMicroseconds(b);
 }
  
}
