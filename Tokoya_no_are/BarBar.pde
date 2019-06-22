class Bar{
  float x,y,h,velocity;
  
  Bar(float _y){
    x = 0.0; //x座標は横幅に合わせるため原点に
    y = _y; //yの初期座標は引数から取得
    h = 50; //高さは50くらいがちょうどいいかと
    velocity = 2.5; //velocityで速度の制御をします、速度を変えたい場合ここを弄ってください
  }
  
  void update(){ //ひし形のy座標をどんどんと上に上げていきます
    y -= velocity;
    if(y+h < 0){
      y = height; //ひし形の左下の頂点が画面から消えた時に、ひし形の位置を一番下に移します
    }
  }
  
  void rdisplay(){ //赤色のひし形
    fill(255,0,0);
    beginShape();
    vertex(x,y);
    vertex(x+width,y-30);
    vertex(x+width,y+h-30);
    vertex(x,y+h);
    endShape();
  }
  
  void bdisplay(){ //青色のひし形
    fill(0,0,255);
    beginShape();
    vertex(x,y);
    vertex(x+width,y-30);
    vertex(x+width,y+h-30);
    vertex(x,y+h);
    endShape();
  }
}
