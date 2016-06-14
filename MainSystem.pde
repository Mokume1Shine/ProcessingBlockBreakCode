void MainSystem(){
  if(RemainBlock<20){
    if(HardMode){
      if(int(random(3))<2){
        switch(BackColor){
          case 0:
            background(255,150,150);
            break;
          case 1:
            background(150,255,150);
            break;
          case 2:
            background(150,150,255);
            break;
          case 3:
            background(255,255,150);
            break;
          case 4:
            background(255,150,255);
            break;
          case 5:
            background(150,255,255);
            break;
        }
      }else{
        background(0);
      }
    }else{
      switch(BackColor){
        case 0:
          background(245,140,140);
          break;
        case 1:
          background(140,245,140);
          break;
        case 2:
          background(140,140,245);
          break;
        case 3:
          background(245,245,140);
          break;
        case 4:
          background(245,140,245);
          break;
        case 5:
          background(140,245,245);
          break;
      }
    }
  }else{background(0);}
  RemainBlock=0;
  if(ItemFlag){
    if(SaveTime!=second() && ball.BalMode){SaveTime=second();ItemTime--;}
    if(ItemType==0){
      ItemReset();
      bar.BarWidth=150;
      ItemName="Bar Long";
    }
    if(ItemType==1){
      ItemReset();
      PointMag=1.5;
      ItemName="Point×1.5";
    }
    if(ItemType==2){
      ItemReset();
      ball.Balr=20;
      ItemName="Big Ball";
    }
    if(ItemType==3){
      ItemReset();
      ball.BalSpeed=0.7;
      ItemName="Speed Down";
    }
    if(ItemType==4){
      ItemReset();
      noStroke();
      fill(255,100);
      ellipse(ball.Balx,bar.Bary-10-ball.Balr,20,20);
      ItemName="Marking";
    }
    if(ItemType==5){
      ItemReset();
      ball.BalSpeed=1.5;
      ItemName="Speed Up";
    }
    if(ItemType==6){
      ItemReset();
      bar.BarWidth=50;
      ItemName="Bar Short";
    }
    if(ItemType==7){
      ItemReset();
      ball.Balg=0.1;
      ItemName="Gravity";
    }
    if(ItemType==8){
      ItemReset();
      ItemName="Randamize";
    }
    if(ItemTime<0){
      ItemReset();
      ItemTime=0;
      ItemFlag=false;
      ItemName="";
    }
  }
  for(int ix=0;ix<nx;ix++){
    for(int iy=0;iy<ny;iy++){
      b[ix][iy].Block();
      if(b[ix][iy].Blom){RemainBlock++;}
      if(b[ix][iy].Blom){
        if(b[ix][iy].Blox-40<ball.Balx && b[ix][iy].Blox+40>ball.Balx){
          if(b[ix][iy].Bloy-20-ball.Balr<ball.Baly && b[ix][iy].Bloy-20>ball.Baly){
            ball.Baly=b[ix][iy].Bloy-30.1;
            ball.Balvy=-abs(ball.Balvy);
            hit(ix,iy);
          }
          if(b[ix][iy].Bloy+20<ball.Baly && b[ix][iy].Bloy+20+ball.Balr>ball.Baly){
            ball.Baly=b[ix][iy].Bloy+30.1;
            ball.Balvy=abs(ball.Balvy);
            hit(ix,iy);
          }
        }
        if(b[ix][iy].Bloy-20<ball.Baly && b[ix][iy].Bloy+20>ball.Baly){
          if(b[ix][iy].Blox-40-ball.Balr<ball.Balx && b[ix][iy].Blox-40>ball.Balx){
            ball.Balx=b[ix][iy].Blox-50.1;
            ball.Balvx=-abs(ball.Balvx);
            hit(ix,iy);
          }
          if(b[ix][iy].Blox+40<ball.Balx && b[ix][iy].Blox+40+ball.Balr>ball.Balx){
            ball.Balx=b[ix][iy].Blox+50.1;
            ball.Balvx=abs(ball.Balvx);
            hit(ix,iy);
          }
        }
      }
      if(b[ix][iy].BloIm && bar.Barx-bar.BarWidth/2<b[ix][iy].BloIx && bar.Barx+bar.BarWidth/2>b[ix][iy].BloIx && bar.Bary-30<b[ix][iy].BloIy && bar.Bary+20>b[ix][iy].BloIy){
        b[ix][iy].BloIm=false;
        ItemFlag=true;
        ItemType=b[ix][iy].BloIt;
        ItemTime=10;
        if(ItemType<5){
          if(Mute==false){
            GoodIt1.trigger();
          }
        }else{
          if(Mute==false){
            BadIt1.trigger();
          }
        }
      }
      if(b[ix][iy].BloCm && bar.Barx-bar.BarWidth/2<b[ix][iy].BloCx && bar.Barx+bar.BarWidth/2>b[ix][iy].BloCx && bar.Bary-20<b[ix][iy].BloCy && bar.Bary+20>b[ix][iy].BloCy){
        b[ix][iy].BloCm=false;
        Point+=10*PointMag;
        if(Mute==false){
          Coin1.trigger();
        }
      }
    }
  }
  if(frameCount-MenuShiftTime>10){
    bar.Bar(mouseX,height-50);
    ball.Ball(bar.Barx,bar.Bary-20);
  }
  if(ball.BalMode && bar.Barx-bar.BarWidth/2<ball.Balx && bar.Barx+bar.BarWidth/2>ball.Balx && bar.Bary-10-ball.Balr<ball.Baly && bar.Bary+20>ball.Baly){
    ball.Baly=bar.Bary-10-ball.Balr;
    ball.Balvy=-10;
    if(mouseX>pmouseX){
      ball.Balvx=random(0,(80-RemainBlock)/5)+1;
    }else if(mouseX<pmouseX){
      ball.Balvx=random(-(80-RemainBlock)/5,0)-1;
    }else{ball.Balvx=random(-(80-RemainBlock)/10,(80-RemainBlock)/10);}
  }
  if(RemainBlock==0){
    Menu=7;
    Point+=1000;
    if(HardMode){
      Point*=1.5;
    }
    setting=true;
  }
  if(Balls==0){
    Menu=8;
    setting=true;
    if(HardMode){
      Point*=1.5;
    }
  }
  stroke(255);
  strokeWeight(1);
  fill(0);
  rect(width-200,0,199,height-1);
  fill(255);
  textSize(20);
  textAlign(CENTER,TOP);
  text("Point:"+Point,width-100,0);
  text("Balls:"+Balls,width-100,20);
  text("Remaining Block:",width-100,40);
  text(RemainBlock,width-100,60);
  if(ItemFlag){
    text("ItemTime:"+ItemTime,width-100,100);
    text("ItemType",width-100,120);
    text(ItemName,width-100,140);
  }
  fill(255,255,0);
  if(ball.BalMode==false){
    text("<Click to Start>",width-100,200);
  }
  //Button(width-100,650,"Pose",9);
  fill(255);
  textSize(20);
  textAlign(CENTER,CENTER);
  text("Pose:P key",width-100,height-100);
  if(keyPressed && key=='p'){
    Menu=9;
  }
  if(RemainBlock<=10 && HardMode){
    stroke(0);
    strokeWeight(8);
    for(int Blind=0;Blind<=300;Blind+=4){
      if(int(random(2))==0){
        line(0,Blind+200,width-200,Blind+200);
      }
    }
    strokeWeight(1);
  }
}

void ItemReset(){
  ball.BalSpeed=1;
  ball.Balg=0.05;
  bar.BarWidth=100;
  PointMag=1;
  ball.Balg=0.05;
  ball.Balr=10;
}

void hit(int x,int y){
  if(Mute==false){
    Bloken1.trigger();
  }
  if(b[x][y].Blohard==1){
    b[x][y].Blohard=0;
  }else{
    b[x][y].Blom=false;
    b[x][y].Blopt=frameCount;
    Point+=100*PointMag;
    BackColor=b[x][y].BloCol;
  }
}

void Button(int ButtonX,int ButtonY,String ButtonName,int ToMenuNo){
  textAlign(CENTER,CENTER);
  textSize(40);
  float StringLength=textWidth(ButtonName)+50;
  noStroke();
  if(abs(mouseX-ButtonX)<StringLength/2 && abs(mouseY-ButtonY)<25 && mousePressed && mouseButton==LEFT){
    Menu=ToMenuNo;
    if(Mute==false){
      Door.trigger();
    }
  }
  if(abs(mouseX-ButtonX)<StringLength/2 && abs(mouseY-ButtonY)<25){
    fill(100,255,100);
    ellipse(ButtonX-StringLength/2-20,ButtonY,sin(radians(frameCount)*5)*30,30);
  }
  fill(100,100,255);
  if(abs(mouseX-ButtonX)<StringLength/2 && abs(mouseY-ButtonY)<25){
    fill(150,150,255);
  }
  rect(ButtonX-StringLength/2,ButtonY-25,StringLength,50);
  fill(255,150,255);
  text(ButtonName,ButtonX,ButtonY-5);
}

void Button2(int ButtonX,int ButtonY,String ButtonName,int ToMenuNo,char KEY){
  textAlign(CENTER,CENTER);
  textSize(40);
  float StringLength=textWidth(ButtonName)+50;
  noStroke();
  if(abs(mouseX-ButtonX)<StringLength/2 && abs(mouseY-ButtonY)<25 && mousePressed && mouseButton==LEFT && keyPressed && key==KEY){
    Menu=ToMenuNo;
    if(Mute==false){
      Door.trigger();
    }
  }
  if(abs(mouseX-ButtonX)<StringLength/2 && abs(mouseY-ButtonY)<25){
    fill(255,100,255);
    ellipse(ButtonX-StringLength/2-20,ButtonY,sin(radians(frameCount)*5)*30,30);
  }
  fill(255,255,100);
  if(abs(mouseX-ButtonX)<StringLength/2 && abs(mouseY-ButtonY)<25){
    fill(255,255,150);
  }
  rect(ButtonX-StringLength/2,ButtonY-25,StringLength,50);
  fill(150,255,150);
  text(ButtonName,ButtonX,ButtonY-5);
}

void Rank(){
  if(Point <=300){RankText="What's?";
  }else if(Point<2000){RankText="C-";
  }else if(Point<3000){RankText="C";
  }else if(Point<4000){RankText="C+";
  }else if(Point<5000){RankText="B-";
  }else if(Point<6000){RankText="B";
  }else if(Point<6500){RankText="B+";
  }else if(Point<7000){RankText="A-";
  }else if(Point<7500){RankText="A";
  }else if(Point<8000){RankText="A+";
  }else if(Point<9000){RankText="S";
  }else if(Point<1000){RankText="SS";
  }else{RankText="SSS";}
}