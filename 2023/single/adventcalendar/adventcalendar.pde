float ellipseSize = 10;

void setup() {
    size(1280, 720);
    background(0);

    colorMode(HSB, 360, 100, 100, 100);
    noStroke();
}

void draw() {
    noLoop();
    background(0);
    
    for(int i = 0; i <= width; i+=10) {
        for (int j = 0; j <= height; j+=10) {
            float hue = noiseToHue(i * j * 0.01);
            fill(hue, 20, 100);
            ellipse(i, j, ellipseSize, ellipseSize);
        }
    }
}

float noiseToHue(float value) {
    return map(noise(value), 0, 1, 0, 360);
}

void keyPressed() {
    if(key == 's') {
        String timeStamp = str(year()) + nf(month(), 2) + nf(day(), 2) + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
        save("frame/" + timeStamp + ".png");
    }
}