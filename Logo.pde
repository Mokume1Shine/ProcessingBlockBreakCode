void Logo(){
  pushMatrix();
  translate(160,50);
  LogoTime+=2;
  strokeWeight(5);
  pushMatrix();
  translate(50,0);
  LogoLine(  0,  0,0, 50,  0,100,LogoTime);
  LogoLine( 50,  0,0,100, 50,100,LogoTime);
  LogoLine(100, 50,0,100,100,100,LogoTime);
  LogoLine(100,100,0, 50,150,100,LogoTime);
  LogoLine( 50,150,0,  0,150,100,LogoTime);
  LogoLine(  0,  0,0,  0,250,100,LogoTime);
  LogoCircle(100,240,20,90,100,LogoTime);
  popMatrix();
  pushMatrix();
  translate(200,0);
  LogoLine(  0,  0,0, 50,  0,100,LogoTime);
  LogoLine( 50,  0,0, 90, 40,100,LogoTime);
  LogoLine( 90, 40,0, 90, 85,100,LogoTime);
  LogoLine( 90, 85,0, 50,125,100,LogoTime);
  LogoLine(  0,125,0, 75,125,100,LogoTime);
  LogoLine( 75,125,0,125,175,100,LogoTime);
  LogoLine(125,175,0,125,200,100,LogoTime);
  LogoLine(125,200,0, 75,250,100,LogoTime);
  LogoLine( 75,250,0,  0,250,100,LogoTime);
  LogoLine(  0,  0,0,  0,250,100,LogoTime);
  LogoCircle(130,240,20,90,100,LogoTime);
  popMatrix();
  pushMatrix();
  translate(370,0);
  LogoLine(  0,  0,0, 50,  0,100,LogoTime);
  LogoLine( 50,  0,0, 90, 40,100,LogoTime);
  LogoLine( 90, 40,0, 90, 85,100,LogoTime);
  LogoLine( 90, 85,0, 50,125,100,LogoTime);
  LogoLine(  0,125,0, 75,125,100,LogoTime);
  LogoLine( 75,125,0,125,175,100,LogoTime);
  LogoLine(125,175,0,125,200,100,LogoTime);
  LogoLine(125,200,0, 75,250,100,LogoTime);
  LogoLine( 75,250,0,  0,250,100,LogoTime);
  LogoLine(  0,  0,0,  0,250,100,LogoTime);
  LogoCircle(130,240,20,90,100,LogoTime);
  popMatrix();
  pushMatrix();
  translate(50,320);
  LogoLine(0,0,0,450,0,100,LogoTime);
  if(LogoTime>100){
    if(LogoTime<228){
      fill((LogoTime-100)*2-random(55));
    }else{fill(random(200,255));}
    textAlign(CENTER,BOTTOM);
    textSize(40);
    text("Processing Block Break",225,-10);
  }
  popMatrix();
  popMatrix();
}

void LogoLine(float sx,float sy,int st,float ex,float ey,int et,int nt){
  float nx=sx;
  float ny=sy;
  if(nt>=st && nt<=et){
    nx+=(ex-sx)/(et-st)*(nt-st);
    ny+=(ey-sy)/(et-st)*(nt-st);
  }else if(nt>=et){
    nx=ex;
    ny=ey;
  }
  if(nt>=st){
    stroke(random(200,255));
    line(sx,sy,nx,ny);
  }
}

void LogoCircle(float lcx,float lcy,float er,int st,int et,int nt){
  float nr=0;
  if(nt>=st && nt<=et){
    nr+=er/(et-st)*(nt-st);
  }else if(nt>=et){
    nr=er;
  }
  if(nt>=st){
    noStroke();
    fill(random(200,255));
    ellipse(lcx,lcy,nr,nr);
  }
}