Bar b1,b2,b3,b4,b5,b6,b7,b8;

void setup(){
  size(200,750);
  
  //以下脳筋インスタンス
  b1 = new Bar(0.0);
  b2 = new Bar(100.0);
  b3 = new Bar(200.0);
  b4 = new Bar(300.0);
  b5 = new Bar(400.0);
  b6 = new Bar(500.0);
  b7 = new Bar(600.0);
  b8 = new Bar(700.0);
}

void draw(){
  
  //背景を白、その中を赤、青のひし形が動きます
  
  background(255);
  b1.update();
  b1.rdisplay();
  
  b2.update();
  b2.bdisplay();
  
  b3.update();
  b3.rdisplay();
  
  b4.update();
  b4.bdisplay();
  
  b5.update();
  b5.rdisplay();
  
  b6.update();
  b6.bdisplay();
  
  b7.update();
  b7.rdisplay();
  
  b8.update();
  b8.bdisplay();
}
