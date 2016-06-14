void MainMenu(){
  background(0);
  if(setting){
    for(int ix=0;ix<nx;ix++){
      for(int iy=0;iy<ny;iy++){
        b[ix][iy]=new Block(ix*80+40,iy*40+50,true);
      }
    }
    Point=0;
    ball.Balx=width/2;
    ball.Baly=500;
    Balls=3;
    ball.BalMode=false;
    ItemReset();
    setting=false;
    ItemTime=0;
  }
  Logo();
  MenuShiftTime=frameCount;
  Htpbx=100;
  Htpbx=170;
  Htpbvx=random(-5,5);
  Htpbvy=-4;
  if(keyPressed && key=='h'){
    for(int ix=0;ix<nx;ix++){
      for(int iy=0;iy<ny;iy++){
        b[ix][iy]=new Block(ix*80+40,iy*40+50,false);
      }
    }
    Button2(width/2-200,500,"Start",1,'h');
    setting=true;
    HardMode=true;
  }else{
    Button(width/2-200,500,"Start",1);
    HardMode=false;
  }
  SaveCheck=true;
  Button(width/2+100,500,"How to Play",6);
  Button(width/2-200,600,"Credit",5);
  Button(width/2+100,600,"Exit",10);
  Mute=check(width-120,50,Mute,"Mute");
  fill(255);
  textAlign(RIGHT,TOP);
  textSize(20);
  text("Best Score:"+BestPoint,width-10,10);
}

void Music(){
  if(Mute){
    Player1.pause();
    Player3.pause();
    Player2.pause();
  }else{
    if(Menu==0 || Menu==5 || Menu==6){
      if(Player1.isPlaying()==false){
        Player1.loop();
      }
    }else{
      Player1.rewind();
      Player1.pause();
    }
    if(Menu==7){
      if(Player3.isPlaying()==false){
        Player3.loop();
      }
    }else{
      Player3.rewind();
      Player3.pause();
    }
    if(Menu==8){
      if(Player2.isPlaying()==false){
        Player2.loop();
      }
    }else{
      Player2.rewind();
      Player2.pause();
    }
  }
}

boolean check(int chex,int chey,boolean cheboo,String Name){
  noStroke();
  fill(255);
  ellipse(chex,chey,16,16);
  textSize(20);
  textAlign(LEFT,CENTER);
  text(Name,chex+20,chey-3);
  if(cheboo==true){
    fill(0);
    ellipse(chex,chey,5+abs(sin(radians(frameCount*2))*5),5+abs(sin(radians(frameCount*2))*5));
  }
  if(dist(chex,chey,mouseX,mouseY)<8 && mousePressed && pmousePressed==false){
    if(cheboo){
      cheboo=false;
    }else{
      cheboo=true;
    }
  }
  return cheboo;
}