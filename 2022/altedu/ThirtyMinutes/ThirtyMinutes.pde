PImage img = createImage(600, 600, RGB);

void setup() {
    size(600, 600);
    noStroke();
    for(int i = 0; i < width; i += 50) {
        for(int j = 0; j < height; j += 50) {
            int r = int(random(0, 255));
            int g = int(random(0, 255));
            int b = int(random(0, 255));
            fill(r, g, b);
            rect(i, j, 50, 50);
        }
    }
    loadPixels();
    rectMode(CENTER);
}

float rectSize = 30;
float rectX = 300;
float rectY = 300;
float xoff = 50;
float yoff = 0;

void draw() {
    img.pixels = pixels;
    background(img);

    color newColor = color(0, 0, 0);
    for(int i = 10; i < rectSize; i++) {
        for(int j = 10; j < rectSize; j++) {
            newColor += img.pixels[(i + int(rectX)) + 600 * (j + int(rectY)) % (600 * 600 - 1200)];
        }
    }
    newColor /= rectSize * rectSize;

    xoff += 0.05;
    rectX += width * noise(xoff);
    yoff += 0.05;
    rectY += height * noise(yoff);
    if(rectX - rectSize < 0) {
        rectX = width - rectSize;
    } else if(width < rectX - rectSize) {
        rectX = rectSize / 2;
    }
    if(rectY - rectSize < 0) {
        rectY = height - rectSize;
    } else if(height < rectY - rectSize) {
        rectY = rectSize / 2;
    }
    

    fill(newColor);
    rect(rectX, rectY, rectSize, rectSize);
    loadPixels();
}

// 画像用
int frame = 0;
void keyPressed() {
    if(key == 's') {
        save("frame/" + frame +".png");
        frame += 1;
    }
}