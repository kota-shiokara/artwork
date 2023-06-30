float rad = 0;
ArrayList<Circle> maru = new ArrayList<Circle>();

void setup(){
  size(700,700);
  for(int i = 0; i < 10; i++){
    maru.add(new Circle(random(-width / 2, width / 2), random(-height / 2, height / 2), random(10, 60)));
  }
}

void draw(){
  background(255);
  strokeWeight(1);
  translate(width/2, height/2);
  
  rad += 0.001;
  rotate(rad);
  
  fill(0);
  ellipse(0, 0, 300, 300);
  for(int i = 0; i < maru.size(); i++){
    maru.get(i).display();
  }
  
  stroke(0);
  strokeWeight(30);
  noFill();
  for(int i = 0; i < 10; i++){
    ellipse(0, 0, 150 * i, 150 * i);
  }
}

class Circle{
  float x, y, size;
  
  Circle(float _x, float _y, float _size){
    x = _x;
    y = _y;
    size = _size;
  }
  
  void display(){
    ellipse(x, y, size, size);
  }
}

void keyPressed() {
    if(key == 's') {
        String timeStamp = str(year()) + nf(month(), 2) + nf(day(), 2) + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
        save("frame/" + timeStamp + ".png");
    }
}