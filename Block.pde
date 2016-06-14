class Block{
  int Blox;
  int Bloy;
  int Blowidth=80;
  int Bloheight=40;
  int BloIx;
  int BloIy;
  int BloIt;
  int Blohard;
  int BloCx;
  float BloCy;
  float BloCvy;
  boolean Blom;
  boolean BloIm;
  boolean BloCm;
  int BloCol=int(random(6));
  
  int Blopt;
  float[][] Blopx=new float[Blowidth/20][Bloheight/20];
  float[][] Blopy=new float[Blowidth/20][Bloheight/20];
  float[][] Blopvx=new float[Blowidth/20][Bloheight/20];
  float[][] Blopvy=new float[Blowidth/20][Bloheight/20];
  
  boolean HardM;
  
  int Blofx,Blofy;
  int Blos;
  
  Block(int x,int y,boolean hm){
    Blox=x;
    Bloy=y;
    Blom=true;
    BloIx=x;
    BloIy=y;
    BloIt=int(random(9));
    BloCx=x;
    BloCy=y;
    HardM=hm;
    Blofx=Blox;
    Blofy=Bloy;
    Blos=int(random(360));
    if(int(random(3))==0){BloCm=true;}else{BloCm=false;}
    if(HardM){
      if(int(random(7))==0){Blohard=1;}else{Blohard=0;}
      if(int(random(5))==0){BloIm=true;}
    }else{Blohard=1;BloIm=false;}
    for(int pix=0;pix<Blowidth/20;pix++){
      for(int piy=0;piy<Bloheight/20;piy++){
        Blopx[pix][piy]=Blox-Blowidth/2+pix*20+10;
        Blopy[pix][piy]=Bloy-Bloheight/2+piy*20+10;
        Blopvx[pix][piy]=random(-1,1);
        Blopvy[pix][piy]=random(-1,1);
      }
    }
  }
  
  void Block(){
    if(HardM==false){
      Blox=Blofx+int(sin(radians(frameCount+Blos))*50);
    }
    if(BloIm==false){
      BloIx=Blox;
      BloIy=Bloy;
    }
    if(BloCm==false){
      BloCx=Blox;
      BloCy=Bloy;
    }
    if(Blom){
      colorset(255);
      rect(Blox-Blowidth/2,Bloy-Bloheight/2,Blowidth,Bloheight);
      if(Blohard==1){
        fill(0,100);
        rect(Blox-Blowidth/2,Bloy-Bloheight/2,Blowidth,Bloheight);
      }
      if(BloIm){
        fill(255);
        ellipse(Blox,Bloy,30,30);
      }
    }else{
      if(frameCount-Blopt<100){
        for(int pix=0;pix<Blowidth/20;pix++){
          for(int piy=0;piy<Bloheight/20;piy++){
            Blopvy[pix][piy]+=0.1;
            Blopx[pix][piy]+=Blopvx[pix][piy];
            Blopy[pix][piy]+=Blopvy[pix][piy];
            colorset(map(frameCount-Blopt,0,100,255,0));
            rect(Blopx[pix][piy]-10,Blopy[pix][piy]-10,20,20);
            if(Blohard==1){
              fill(0,100);
              rect(Blopx[pix][piy]-10,Blopy[pix][piy]-10,20,20);
            }
          }
        }
      }
      if(BloIm){
        BloIy+=3;
        if(BloIy>height){BloIm=false;}
        noStroke();
        if(BloIt<5){
          fill(200,0,0);
        }else{
          fill(0,0,200);
        }
        ellipse(BloIx,BloIy,30,30);
      }
      if(BloCm){
        BloCvy+=0.1;
        BloCy+=BloCvy;
        if(BloCy>height){BloCm=false;}
        noStroke();
        fill(200,200,0);
        ellipse(BloCx,BloCy,sin(radians(frameCount)*5)*20,20);
      }
    }
  }
  
  void colorset(float alpha){
    noStroke();
    switch(BloCol){
      case 0:
        fill(255,150,150,alpha);
        break;
      case 1:
        fill(150,255,150,alpha);
        break;
      case 2:
        fill(150,150,255,alpha);
        break;
      case 3:
        fill(255,255,150,alpha);
        break;
      case 4:
        fill(255,150,255,alpha);
        break;
      case 5:
        fill(150,255,255,alpha);
        break;
    }
  }
}