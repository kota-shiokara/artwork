float x, y;
int c = 0;
boolean isFlag = false;
ArrayList<Bubble> awa = new ArrayList<Bubble>();

void setup(){
  size(700,700);
}

void draw(){
  background(255, 50);
  x = mouseX;
  y = mouseY;
  
  fill(255);
  if(frameCount % 15 == 0) {
    awa.add(new Bubble(x - 100, y, 400));
    awa.add(new Bubble(x + 100, y, 400));
  }
  for(int i = 0; i < awa.size(); i++){
    awa.get(i).include();
    awa.get(i).display();
    if(awa.get(i).getCounter() > 10) awa.remove(i);
  }
  
  fill(0);
  ellipse(x, y + 200, 360, 550);
  fill(100);
  rect(x - 60, y - 30, 120, 400);
  if(isFlag){
    saveFrame("frames/####.png");
    c++;
    if(c == 60) println("one second");
    if(c == 120) println("two second");
    if(c == 180) println("three second");
    if(c == 240) println("four second");
    if(c == 300) println("capture complete");
    if(c > 300) exit();
  }
}

class Bubble{
  float x, y, size = 0, msize;
  int counter = 0;
  
  Bubble(float _x, float _y, float _msize){
    this.x = _x;
    this.y = _y;
    this.msize = _msize;
  }
  
  void display(){
    ellipse(x, y, size, size);
  }
  void include(){
    if(size < msize) size += 5;
    if(frameCount % 45 == 0) counter++;
  }
  int getCounter(){
    return counter;
  }
}

void mousePressed(){
  isFlag = !isFlag;
  println("Flag is " + isFlag + "!");
}
