void setup() {
    size(460, 200);
    background(255);
}

int boxSize = 25;
int boxDiff = boxSize / 2;
int distX = 35;
void draw() {
    fill(0);
    for(int i = 0; (i + 1) * boxSize <= height; i++){
        noStroke();
        float firstX = i % 4 == 3 ? boxDiff : (i % 4) * boxDiff;
        for(int j = 0; firstX + j * boxSize * 2 + distX + boxSize < width; j++){
            rect(firstX + j * boxSize * 2 + distX, i * boxSize, boxSize, boxSize);
        }
        stroke(150);
        strokeWeight(1);
        line(0, i * boxSize, width, i * boxSize);
        line(0, (i + 1) * boxSize, width, (i + 1) * boxSize);
    }
}

void keyPressed() {
    if(key == 'p') save("frame/CafeWall.png");
}
