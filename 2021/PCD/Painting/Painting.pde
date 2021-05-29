void setup() {
    background(255);
    size(512, 512);
}

void draw() {
    for(int i = -48; i < width; i+=16){
        color c = color(random(0, 150), random(0, 150), random(0, 150));
        float nextJ = 0;
        stroke(c);
        fill(c);
        beginShape();
        vertex(i, 0);
        for(int j = 0; j < height; j=floor(nextJ)){
            nextJ += height / 10;
            float rnd = random(i - 64, i + 64);
            float rnd2 = i > rnd ? random(i + 8, i + 64) : random(i - 8, i - 64);
            bezierVertex(rnd, j + ((nextJ - j) / 3), rnd2, j + ((nextJ - j) * 2 / 3), i, nextJ);
        }
        vertex(width, height);
        vertex(width, 0);
        endShape();
    }
    noLoop();
}