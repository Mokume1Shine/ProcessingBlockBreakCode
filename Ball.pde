class Ball{
  float Balx;
  float Baly;
  float Balvx;
  float Balvy;
  float Balg=0.05;
  float BalSpeed=1;
  float Balr;
  
  float savX;
  float savY;
  
  boolean BalMode;
  
  Ball(float x,float y){
    Balx=x;
    Balx=y;
    savX=x;
    savY=y;
    Balr=10;
  }
  
  void Ball(float setx,float sety){
    if(BalMode){
      Balvy+=Balg;
      if(ItemType==8 && ItemFlag){
        Balvx+=random(-0.5,0.5);
        Balvy+=random(-0.5,0.5);
      }
      Balx+=Balvx*BalSpeed;
      Baly+=Balvy*BalSpeed;
      if(Balx<0){Balvx=abs(Balvx);}
      if(Balx>640){Balvx=-abs(Balvx);}
      if(Baly<10){Balvy*=-1;}
      if(Baly>height+10){BalMode=false;Balls--;}
    }else{
      Balx=setx;
      Baly=sety;
      if(mousePressed && mouseButton==LEFT && Menu==1){
        BalMode=true;
        Balvx=random(-3,3);
        Balvy=-10;
      }
    }
    noStroke();
    fill(255);
    ellipse(Balx,Baly,Balr*2,Balr*2);
  }
}