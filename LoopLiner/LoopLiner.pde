color coltmp;
Track[] track = new Track[6];

void setup(){
  size(700, 700, P3D);
  for(int i = 0; i < 6; i++){
    coltmp = color(random(0,255), random(0,255), random(0,255));
    track[i] = new Track(i * 100 + 350, coltmp);
  }
}


void draw(){
  background(255);
  translate(width / 2, height / 2);
  for(int i = 0; i < 6; i++){
    rotateX(radians(i * 40));
    rotateY(radians(i * 40));
    track[i].display();
  }
}

class Track{
  float size;
  color col;
  Track(float _size, color _col){
    this.size = _size;
    this.col = _col;
  }
  
  void display(){
    stroke(col);
    noFill();
    ellipse(0,0,size, size);
    ellipse(0,0,size + 20, size + 20);
    
    fill(col);
    for(int i = 0; i < 45; i++){
      rotate(radians(8));
      rect(0, -size / 2 - 15, 10, 20);
    }
  }
}
