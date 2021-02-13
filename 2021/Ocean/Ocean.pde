ArrayList<Bubble> backBubbles = new ArrayList<Bubble>();
ArrayList<Bubble> frontBubbles = new ArrayList<Bubble>();
float bubbleSize = 10;

Wakame wakame, wakame2;
float diffWakameX = random(20, 25);

PGraphics layerOne, layerTwo;
PGraphics mask;
PGraphics layerWakame;

void setup() {
  size(600, 500);
  smooth();
  layerOne = createGraphics(width, height);
  layerTwo = createGraphics(width, height);
  mask = createGraphics(width, height);
  layerWakame = createGraphics(width, height);
  wakame = new Wakame(random(0, width), random(100, 120));
  wakame2 = new Wakame(random(0, width), random(80, 100));
  for(int i = 0; i < 20; i++){
      backBubbles.add(new Bubble(random(0, width), random(0, height)));
      frontBubbles.add(new Bubble(random(0, width), random(0, height)));
  }
}

void draw() {
  if (frameCount % 60 == 0) {
      backBubbles.add(new Bubble(random(0, width), height));
      frontBubbles.add(new Bubble(random(0, width), height));
  }

  layerOne.beginDraw();
  layerOne.background(#3c24b3);
  for (int i = 0; i < backBubbles.size(); i++) {
    layerOne.noFill();
    layerOne.stroke(255);
    layerOne.ellipse(backBubbles.get(i).x, backBubbles.get(i).y, bubbleSize, bubbleSize);
    backBubbles.get(i).update(random(backBubbles.get(i).x - 1, backBubbles.get(i).x + 1));
    if(backBubbles.get(i).y < -bubbleSize/2) backBubbles.remove(i);
  }
  layerOne.endDraw();

  layerTwo.beginDraw();
  layerTwo.background(#bce2e8, 200);
  for (int i = 0; i < frontBubbles.size(); i++) {
    layerTwo.noFill();
    layerTwo.stroke(255);
    layerTwo.ellipse(frontBubbles.get(i).x, frontBubbles.get(i).y, bubbleSize, bubbleSize);
    frontBubbles.get(i).update(random(frontBubbles.get(i).x - 1, frontBubbles.get(i).x + 1));
    if(frontBubbles.get(i).y < -bubbleSize/2) frontBubbles.remove(i);
  }
  layerTwo.endDraw();

  mask.beginDraw();
  mask.background(#3c24b3, 100);
  mask.endDraw();

  
  float diffX = diffWakameX * sin(frameCount * 0.01);
  float diffXX = diffWakameX * sin(frameCount * 0.01 + PI/2);
  float lastX = diffWakameX * sin(frameCount * 0.01 + PI);
  layerWakame.beginDraw();
  layerWakame.background(0, 100);
  layerWakame.fill(#a7cc00);;
  layerWakame.beginShape();
  layerWakame.vertex(wakame.x, height);
  layerWakame.bezierVertex(wakame.x + diffX, (height - wakame.size) + wakame.size * 2 / 3, wakame.x - diffXX, (height - wakame.size) + wakame.size / 3, wakame.x + lastX, height - wakame.size);
  layerWakame.vertex(wakame.x + 10 + lastX, height - wakame.size);
  layerWakame.bezierVertex(wakame.x + 10 - diffXX, (height - wakame.size) + wakame.size / 3, wakame.x + 10 + diffX, (height - wakame.size) + wakame.size * 2 / 3, wakame.x + 10, height);
  layerWakame.endShape();
  
  float diffWakameXX = map(diffWakameX, 20, 25, 10, 15);
  diffX = diffWakameXX * cos(frameCount * 0.01);
  diffXX = diffWakameXX * cos(frameCount * 0.01 + PI/2);
  lastX = diffWakameXX * cos(frameCount * 0.01 + PI);
  layerWakame.beginShape();
  layerWakame.vertex(wakame2.x, height);
  layerWakame.bezierVertex(wakame2.x + diffX, (height - wakame2.size) + wakame2.size * 2 / 3, wakame2.x - diffXX, (height - wakame2.size) + wakame2.size / 3, wakame2.x + lastX, height - wakame2.size);
  layerWakame.vertex(wakame2.x + 10 + lastX, height - wakame2.size);
  layerWakame.bezierVertex(wakame2.x + 10 - diffXX, (height - wakame2.size) + wakame2.size / 3, wakame2.x + 10 + diffX, (height - wakame2.size) + wakame2.size * 2 / 3, wakame2.x + 10, height);
  layerWakame.endShape();
  layerWakame.endDraw();
  

  image(layerOne, 0, 0, width, height);
  image(mask, 0, 0, width, height);
  image(layerWakame, 0, 0, width, height);
  image(layerTwo, 0, 0, width, height);
}

class Bubble {
  float x, y;
  private float floatingSpeed;
  Bubble(float _x, float _y) {
    this.x = _x;
    this.y = _y;
    this.floatingSpeed = random(3, 6) * 0.1;
  }
  void display(float size) {
    ellipse(x, y, size, size);
  }
  void update(float next) {
    this.x = next;
    this.y -= floatingSpeed;
  }
  void run(float size, float next) {
    display(size);
    update(next);
  }
}

class Wakame{
    float x, size;
    Wakame(float _x, float _sise){
        this.x = _x;
        this.size = _sise;
    }
}