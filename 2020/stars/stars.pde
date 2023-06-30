Star[] s = new Star[200];
float r = 0;

void setup(){
  fullScreen();
  background(0);
  noStroke();
  for(int i = 0; i < 200; i++){
    s[i] = new Star(random(-width / 2, width / 2), random(- height / 2, height / 2));
    //println("x:" + s[i].posx + "y:" +s[i].posy);
  }
}
void draw(){
  translate(width / 2, height / 2);
  rotate(radians(r));
  r += 0.5;
  for(int i = 0; i < 200; i++){
    s[i].display();
  }
  saveFrame("frames/####.png");
  if(frameCount >= 150){
    exit();
  }
}

class Star{
  float posx, posy;
  
  Star(float _posx, float _posy){
    this.posx = _posx;
    this.posy = _posy;
  }
  
  void display(){
    ellipse(posx, posy, 1, 1);
  }
}
