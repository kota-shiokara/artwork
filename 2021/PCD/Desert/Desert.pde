float lineStartX, lineEndX, lineY;
float t = 0;
boolean flag = false;
float bValue = 0, gValue = 0;
float x, y;
PGraphics pg;


void setup() {
    size(512, 512);
    background(#3398ff);
    lineStartX = width;
    lineEndX = width/2 + width / 10;
    lineY = height;
    x = width / 5;
    y = height;
    pg = createGraphics(width, height);
    frameRate(1);
}

void draw() {
    if(frameCount > 3) {
        frameRate(150);
    }
    background(#3398ff);
    gValue = map(abs(sin(0.1 * t)), 0, 1, 85, 121);
    bValue = map(abs(sin(0.1 * t)), 0, 1, 0, 84);
    pg.beginDraw();
    pg.stroke(153, gValue, bValue);
    
    if(flag){
        lineY -= 0.8 * sin(0.02 * t);
        lineEndX += 0.5;
        pg.line(lineEndX, lineY, lineEndX - width, lineY);
    }else{
        lineY -= sin(0.01 * t);
        lineStartX -= 0.5;
        pg.line(lineStartX, lineY, lineStartX + width, lineY);
        if(lineY >= height && frameCount > 60) flag = true;
    }
    pg.endDraw();

    image(pg, 0, 0, width, height);
    if(y > height / 10) y-=0.5;
    noStroke();
    fill(255, 0, 0);
    ellipse(x, y, 40, 40);
    t++;
}
