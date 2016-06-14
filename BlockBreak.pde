import ddf.minim.*;

Minim minim;
AudioSample Bloken1;
AudioSample GoodIt1;
AudioSample BadIt1;
AudioSample Coin1;
AudioSample Door;
AudioPlayer Player1;  //start
AudioPlayer Player2;  //GameOver
AudioPlayer Player3;  //Congratulation
boolean Mute=false;

PImage img; 

int nx=8,ny=10;
Block[][] b=new Block[nx][ny];
Ball ball;
Bar bar;

    int Point;
  float PointMag=1;
    int Balls=3;
    int ItemType;
 String ItemName="";
    int ItemTime;
boolean ItemFlag;
    int SaveTime;
    int Menu=0;
    int MenuShiftTime=0;
boolean setting=true;
    int Htpx;
  float Htpbx=100;
  float Htpby=170;
  float Htpbvx=random(5);
  float Htpbvy=-5;
 String RankText="";
    int RemainBlock=0;
    int BackColor;
boolean HardMode=false;
    int LogoTime;
boolean pmousePressed;

String lines[];
PrintWriter output;
int BestPoint;
boolean SaveCheck=true;

void setup(){
  size(840,700);
  background(0);
  ball=new Ball(width/2,400);
  bar=new Bar();
  minim=new Minim(this);
  Bloken1=minim.loadSample("bomb.wav");
  GoodIt1=minim.loadSample("powerup01.wav");
  BadIt1=minim.loadSample("powerdown03.wav");
  Coin1=minim.loadSample("coin03.wav");
  Door=minim.loadSample("自動車のドアの開閉音.wav");
  Player1=minim.loadFile("Alcool_et_amour.mp3");
  Player2=minim.loadFile("luminous_2.mp3");
  Player3=minim.loadFile("LUX.mp3");
  img=loadImage("LogoPxVer.png");
  lines=loadStrings("Points.sav");
  BestPoint=int(lines[0]);
  if(BestPoint>1000000){BestPoint=0;}
  Mute=boolean(lines[1]);
  output=createWriter("data\\Points.sav");
  output.println(BestPoint);
  output.println(Mute);
  output.flush();
  output.close();
}

void draw(){
  if(frameCount<60){
    background(0);
    imageMode(CENTER);
    image(img,width/2,height/2);
  }else{
    Music();
    if(Menu!=0){LogoTime=0;}
    if(Menu==0){
      MainMenu();
    }else if(Menu==1){
      MainSystem();
    }else if(Menu==5){
      //Credit
      background(0);
      pushMatrix();
      translate(width/2,height/2);
      imageMode(CENTER);
      image(img,-300,-150,100,100);
      fill(255);
      textSize(20);
      textAlign(LEFT,CENTER);
      text("Made by Mokume 1Shine",-200,-150);
      text("https://sites.google.com/site/mokume1shin/home",-200,-130);
      text("Taira Komori:",-200,-50);
      text("Sound Effect",50,-50);
      text("http://taira-komori.jpn.org/",-200,-30);
      text("DOVA-SYNDROME:",-200,50);
      text("Background Music by ISAo.",50,50);
      text("Background Music by Kazuchi",50,70);
      text("Background Music by MATSU",50,90);
      text("Sound Effect by taroN",50,110);
      text("http://dova-s.jp/",-200,70);
      text("Processing:",-200,160);
      text("Used Tool",50,160);
      text("https://processing.org/",-200,180);
      text("Test Play:",-200,260);
      text("Joken",50,260);
      popMatrix();
      Button(width/2,100,"Back to Start Menu",0);
    }else if(Menu==6){
      //How to Play
      Howtoplay();
    }else if(Menu==7){
      //Congratulation!
      background(0);
      fill(150,255,255);
      textAlign(CENTER,CENTER);
      textSize(80);
      text("Congratulation!",width/2,height/2-200);
      fill(255,255,120);
      textSize(60);
      text("Final Score"+Point,width/2,height/2);
      Rank();
      text("Rank:"+RankText,width/2,height/2+100);
      if(HardMode==true){
        textSize(40);
        fill(255,100,100);
        text("HardMode",width/2,height-50);
      }else{
        textSize(20);
        fill(255,255,100);
        text("If you want to play Hard Mode,push the H key on the Main Menu.",width/2,height-50);
      }
      Button(width/2,height/2+200,"Back to Start Menu",0);
      setting=true;
      PointSave();
    }else if(Menu==8){
      //GameOver
      background(0);
      fill(150,255,255);
      textAlign(CENTER,CENTER);
      textSize(80);
      text("Game Over.",width/2,height/2-200);
      fill(255,255,120);
      textSize(60);
      text("Final Score:"+Point,width/2,height/2);
      Rank();
      text("Rank:"+RankText,width/2,height/2+100);
      Button(width/2,height/2+200,"Back to Start Menu",0);
      setting=true;
      PointSave();
    }else if(Menu==9){
      //Pose
      background(0);
      fill(255);
      textSize(20);
      textAlign(CENTER,CENTER);
      text("Quit:Q key"  ,width/2,height/2-50);
      text("Return:R key",width/2,height/2);
      Mute=check(width/2-30,height/2+50,Mute,"Mute");
      if(keyPressed && key=='r'){
        Menu=1;
      }
      if(keyPressed && key=='q'){
        Menu=0;
        setting=true;
      }
      MenuShiftTime=frameCount;
    }else if(Menu==10){
      //Exit
      output=createWriter("data\\Points.sav");
      output.println(BestPoint);
      output.println(Mute);
      output.flush();
      output.close();
      exit();
    }
  }
  pmousePressed=mousePressed;
  println(Mute);
}

void PointSave(){
  if(SaveCheck){
    output=createWriter("data\\Points.sav");
    if(Point>BestPoint){
      output.println(Point);
      BestPoint=Point;
    }
    output.println(Mute);
    SaveCheck=false;
    output.flush();
    output.close();
  }
}