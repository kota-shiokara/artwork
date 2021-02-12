ArrayList<Grass> grasses = new ArrayList<Grass>();
ArrayList<Float> zPos = new ArrayList<Float>();
float t = 0;

void setup() {
  size(500, 500, P3D);
  zPos.add(random(150, 1500));
  grasses.add(new Grass(random(-300, 300), random(250, 300)));
}

void draw() {
  background(#95c0ec);
  fill(0, 255, 0);
  if (t++ % 20 == 0) {
    zPos.add(random(150, 1500));
    grasses.add(new Grass(random(-500, 500), random(250, 300)));
  }
  for (int i = 0; i < grasses.size(); i++) {
    translate(0, 0, -zPos.get(i));
    grasses.get(i).display();
    translate(0, 0, zPos.get(i));
  }
}

class Grass {
  float tx, ty;
  private float dx, dy, t;

  Grass(float _tx, float _ty) {
    this.tx = _tx;
    this.ty = _ty;
    this.dx = 0;
    this.dy = 0;
    this.t = random(-2*PI, 2*PI);
  }

  void display() {
    change(width/2, height/4);
    box(250, 50, 100);
    reset();

    change(width/3, height/4);
    box(50, 100, 100);
    reset();

    change(width*2/3, height/4);
    box(50, 100, 100);
    reset();

    change(width/2, height/3 + height/10);
    box(180, 25, 100);
    reset();

    change(width/2, height/3 + height*2/10);
    box(180, 25, 100);
    reset();

    change(width/2, height/3 + height*3/10);
    box(180, 25, 100);
    reset();

    change(width/3 + width/28, height/3 + height*2/10);
    box(50, 125, 100);
    reset();

    change(width*2/3 - width/28, height/3 + height*2/10);
    box(50, 125, 100);
    reset();

    change(width/2, height*3/4);
    box(300, 30, 100);
    reset();

    change(width/2, height*3/4 + height/20);
    box(50, 140, 100);
    reset();
    this.t+=0.03;
  }

  void change(float _dx, float _dy) {
    dx = _dx + (10 * sin(t));
    dy = _dy;
    translate(tx + dx, ty + dy);
  }

  void reset() {
    translate(-(tx + dx), -(ty + dy));
  }
}
