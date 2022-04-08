private static final color birthdayColor = #f5b1aa; // 珊瑚色だってさ、綺麗だね
ArrayList<BoxCoordinate> boxCoordinate = new ArrayList<BoxCoordinate>();

float a;
int NUM = 50;
float offset = PI / NUM;
float boxSize = 10;

void setup() {
    size(800, 500, OPENGL);
    // fullScreen(OPENGL);
    noStroke();
    noFill();
    colorMode(HSB, 360, 100, 100, 100);
    lights();

    for (int i = 0; i < NUM; i++) {
        float newX = map(i, 0, NUM, -width * 0.8, width * 0.8);
        float ratio = map(i, 0, NUM, -200, 0);
        float highOffset = sin(map(i, 0, NUM, 0, PI)) * 50;
        float dy = map(i, 0, NUM, 0, 1);
        
        boxCoordinate.add(randomBox(i, newX, height / 2 + highOffset, ratio, dy));
        boxCoordinate.add(randomBox(i, newX, height / 3 + highOffset, ratio, dy));
        
        int randomBoxCount = (int) random(1, 3);
        for(int j = 0; j < randomBoxCount; j++) {
            boxCoordinate.add(randomBox(j, newX, height / 2 + highOffset, ratio, dy));
            boxCoordinate.add(randomBox(i, newX, height / 3 + highOffset, ratio, dy));
        }
    }

    boxSize = width / 25;
}

void draw() {
    // if(frameCount % 60 == 0) println(boxCoordinate.get(100).y);
    background(0);

    a += 0.001;
    translate(width / 2, height / 2, -20);

    for (int i = 0; i < boxCoordinate.size(); i++) {
        pushMatrix();
        
        boxCoordinate.get(i).update();
        if(boxCoordinate.get(i).checkAlpha()) {
            float newX = boxCoordinate.get(i).x;
            float newY = random(-height / 4, height / 2);
            float newZ = boxCoordinate.get(i).z;
            float newDy = boxCoordinate.get(i).dy;
            boxCoordinate.set(i, randomBox(i, newX, newY, newZ, newDy));
        }
        boxCoordinate.get(i).display(boxSize, a, offset, i);
        popMatrix();
    }
}

class BoxCoordinate {
    public float x, y, z;
    public float dy;
    float ratio = 0.2;
    color c = birthdayColor;
    float alpha = 100;

    BoxCoordinate(float _x, float _y, float _z, float _dy) {
        this.x = _x;
        this.y = _y;
        this.z = _z;
        this.dy = _dy;
    }

    void update() {
        this.y -= this.dy * this.ratio;
        if(this.y <= -width / 3 && this.alpha > 0) {
            this.alpha -= 1;
        }
    }

    void display(float a, float offset, int i) {
        stroke(c, this.alpha);
        translate(x, y, z);
        rotateY(a + offset * i);
        rotateX(a / 2 + offset * i);
        rotateZ(a / 3 + offset * i);
        box(width / 8);
        translate(-x, -y, -z);
    }

    void display(float size, float a, float offset, int i) {
        stroke(c, this.alpha);
        translate(x, y, z);
        rotateY(a + offset * i);
        rotateX(a / 2 + offset * i);
        rotateZ(a / 3 + offset * i);
        box(size);
        translate(-x, -y, -z);
    }

    boolean checkAlpha() {
        return this.alpha <= 0;
    }
}

BoxCoordinate randomBox(int i, float x, float y, float z, float dy) {
    float randomX = x, randomY = y, randomZ = z;

    if(i % 2 == 0) {
        randomX -= random(30, 50);
        randomY += random(30, 50);
        randomZ -= random(20, 80);
    } else {
        randomX += random(30, 50);
        randomY += random(30, 50);
        randomZ += random(20, 80);
    }
    
    return new BoxCoordinate(randomX, randomY, randomZ, abs(dy + random(-1, 1)));
}

int frame = 1;
void keyPressed() {
    if(key == 's') {
        save("frame/" + frame++ + ".png");
    }
}