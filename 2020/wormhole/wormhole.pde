import gifAnimation.*;

//GifMaker gifExport;

float z = 0;
ArrayList<Wormhole> c; 

void setup(){
  frameRate(60);
  size(800,800, P3D);
  c = new ArrayList<Wormhole>();
  
  /*gifExport = new GifMaker(this, "export2.gif");
  gifExport.setRepeat(0);
  gifExport.setQuality(10);
  gifExport.setDelay(16);*/
}

void draw(){
  translate(width / 2, height / 2, 0);
  background(255);
  noFill();
  strokeWeight(5);
  if(frameCount % 15 == 0){
    z += 0.1;
    c.add(new Wormhole(z));
  }
  
  for(int i=0;i<c.size();i++){
      if(c.get(i).z > 500)c.remove(i);
      if(c.size()==0)break;
      c.get(i).move();
      c.get(i).display();
  }
  
  /*if(frameCount >= 60*4){
    gifExport.addFrame(); // フレームを追加
  } else if(frameCount >= 390) {
    gifExport.finish(); // 終了してファイル保存
    exit();
  }*/
}

class Wormhole{
  float z;
  color c;
  float rota;
  
  Wormhole(float _rota){
    z = -7000;
    c = color(random(255),random(255),random(255));
    rota = _rota;
  }
  
  void display(){
    stroke(c);
    rotateZ(rota);
    translate(0,0,this.z);
    rect(-width / 2, -height / 2,width,height);
    ellipse(0,0,800,800);
    translate(0,0,-this.z);
    rotateZ(-rota);
  }
  
  void move(){
    z += 30;
  }
  
}

void keyPressed(){
  if(key == 's'){
    saveFrame("frame/export.png");
  }
}