void Howtoplay(){
  background(0);
  pushMatrix();
  translate(Htpx+50,150);
  fill(255);
  textSize(20);
  textAlign(LEFT,CENTER);
  text("Ball",0,50);
  text("To baunce the ball at the bar.",0,300,200,100);
  text("Bar",300,50);
  text("Move this with your mouse.",300,300,200,100);
  text("Normal Block",600,50);
  text("Break this by the ball.\nAnd you get 100pt.",600,300,200,100);
  text("Hard Block",900,50);
  text("Breaking this will be Normal Block.",900,300,200,100);
  text("Coin",1200,50);
  text("If you catch this,\nyou get 10pt.",1200,300,200,100);
  text("Good Item",1500,50);
  text("If you catch this,\nyou get Good effect.",1500,300,200,100);
  text("Bad Item",1800,50);
  text("If you catch this,\nyou get Bad effect.",1800,300,200,100);
  stroke(255);
  strokeWeight(1);
  noFill();
  rect(0,70,200,200);
  rect(300,70,200,200);
  rect(600,70,200,200);
  rect(900,70,200,200);
  rect(1200,70,200,200);
  rect(1500,70,200,200);
  rect(1800,70,200,200);
  //ball
  fill(255);
  ellipse(Htpbx,Htpby,20,20);
  Htpbvy+=0.05;
  Htpbx+=Htpbvx;
  Htpby+=Htpbvy;
  if(Htpbx<10 || Htpbx>190){Htpbvx*=-1;}
  if(Htpby<80 || Htpby>260){Htpbvy*=-1;}
  //bar
  fill(255);
  rect(350+sin(radians(frameCount*2))*40,220,100,20);
  pushMatrix();
  translate(400+sin(radians(frameCount*2))*40,150);
  fill(255);
  stroke(0);
  beginShape();
  vertex(0,0);
  vertex(20,20);
  vertex(12,20);
  vertex(17,29);
  vertex(12,32);
  vertex(6,21);
  vertex(0,28);
  endShape(CLOSE);
  popMatrix();
  noStroke();
  fill(255,150,150);
  rect(660,150,80,40);
  fill(255,150,255);
  rect(960,150,80,40);
  fill(0,100);
  rect(960,150,80,40);
  fill(200,200,0);
  ellipse(1300,170,sin(radians(frameCount)*5)*20,20);
  fill(200,0,0);
  ellipse(1600,170,40,40);
  fill(0,0,200);
  ellipse(1900,170,40,40);
  popMatrix();
  if(mouseX>width/4*3){Htpx-=10;}
  if(mouseX<width/4  ){Htpx+=10;}
  if(Htpx>0){Htpx=0;}
  if(Htpx<-1300){Htpx=-1300;}
  Button(width/2,100,"Back to Start Menu",0);
}