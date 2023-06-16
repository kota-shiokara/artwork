Bubble bubble;

void setup() {
    bubble = new Bubble(0, 0);
}

void draw() {
    translate(width / 2, height / 2);


}

int frame = 1;
void keyPressed() {
    if(key == 's') {
        save("frame/" + frame++ + ".png");
    }
}

class Bubble {
    float x, y;
    int bubbleCount;
    float bubbleMin = 1, bubbleMax = 5;

    Bubble(float _x, float _y) {
        this.x = _x;
        this.y = _y;
        bubbleCount = floor(random(bubbleMin, bubbleMax));
    }

    void update() {

    }

    void display() {
        
    }
}