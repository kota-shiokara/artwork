ArrayList<Bubble> bubbles = new ArrayList<Bubble>();

void setup() {
    size(700, 700);
    colorMode(HSB, 360, 100, 100);

    for (int i = 0; i < 100; i++) {
        float initX = random(-width / 2, width / 2);

        bubbles.add(new Bubble(initX, height / 2));
    }
}

void draw() {
    translate(width / 2, height / 2);
    background(0);
    strokeWeight(1);
    for(int i = -height / 2; i < height / 2; i++) {
        stroke(180, map(i, -height / 2, height / 2, 100, 60), 100);
        line(-width / 2, i, width / 2, i);
    }

    for(int i = 0; i < bubbles.size(); i++) {
        bubbles.get(i).update();
        bubbles.get(i).display();
        if (!bubbles.get(i).isInDisplay()) {
            bubbles.remove(i);

            float initX = random(-width / 2, width / 2);
            bubbles.add(new Bubble(initX, height / 2));
            i--;
        }
    }
}

void keyPressed() {
    if(key == 's') {
        String timeStamp = str(year()) + nf(month(), 2) + nf(day(), 2) + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
        save("frame/" + timeStamp + ".png");
    }
}

class Bubble {
    float x, y;
    float dy;
    float minDelta = 0.5, maxDelta = 5;

    float size;
    float minSize = 15, maxSize = 25;

    Bubble(float _x, float _y) {
        this.x = _x;
        this.y = _y;
        this.size = floor(random(minSize, maxSize));
        this.dy = random(minDelta, maxDelta);
    }

    void update() {
        this.y -= this.dy;
    }

    void display() {
        noFill();
        stroke(0, 0, 100);
        strokeWeight(2);

        ellipse(this.x, this.y, size, size);
    }

    boolean isInDisplay() {
        return -height / 2 < this.y && this.y < height / 2;
    }
}