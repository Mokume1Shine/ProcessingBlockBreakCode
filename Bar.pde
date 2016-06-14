class Bar{
  float Barx;
  float Bary;
  int BarWidth=100;
  
  void Bar(float tx,float ty){
    if(tx<640){
      Barx=tx;
    }else{
      Barx=640;
    }
    Bary=ty;
    noStroke();
    fill(255);
    rect(Barx-BarWidth/2,Bary-10,BarWidth,20);
  }
}