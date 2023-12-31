ArrayList<Dust> dusts = new ArrayList<Dust>();
int snowDepth = 0;

void setup() {
    size(1080, 720);
    background(0);
    noStroke();
    textSize(72);
    textAlign(CENTER);

    for(int i = 0; i < 500; i++) {
        dusts.add(new Dust(random(0, width), random(0, height), random(1, 8)));
    }
}

void draw() {
    background(0);

    fill(255);
    text("Desember 2023", width / 2, height / 2);

    drawGround(snowDepth);

    int index = 0;
    for(Dust dust : dusts) {
        snowDepth += dust.update(frameCount * 0.01 + index);
        dust.display();
        index++;
    }
}

void drawGround(int snowDepth) {
    fill(255);

    float waveHeight = height * 0.9 - (snowDepth * 0.5);
    int waveCount = 8;
    float waveUnit = width / waveCount;

    beginShape();
    vertex(0, height);
    vertex(0, waveHeight);
    for(int i = 1; i <= waveCount; i++) {
        float waveUnitStart = waveUnit * (i - 1);
        float waveUnitEnd = waveUnit * i;
        float positive = i % 2 == 0 ? 1 : -1;
        float waveControlHeight = waveHeight + (positive * height * 0.01);
        bezierVertex(waveUnitStart + waveUnit / 3, waveControlHeight, waveUnitEnd - waveUnit / 3, waveControlHeight, waveUnitEnd, waveHeight);
    }
    vertex(width, height);
    endShape();
}

class Dust {
    float x, y, size;
    float alpha;
    float fallSpeed;

    float alphaRange = 0.5;

    Dust(float x, float y, float size) {
        this.x = x;
        this.y = y;
        this.size = size;
        this.alpha = random(0, 255);
        this.fallSpeed = random(0.1, 1);
    }

    int update(float seed) {
        this.x += noise(seed) - 0.5;
        this.y += fallSpeed;
        this.alpha += random(-alphaRange, alphaRange);

        if(this.alpha > 255) {
            this.alpha = 255;
        } else if(this.alpha < 0) {
            this.alpha = 0;
        }

        if(this.y > height || this.x > width || this.x < 0) {
            this.x = random(0, width);
            this.y = random(0, height);
            this.alpha = random(0, 255);
            return 1;
        }

        return 0;
    }

    void display() {
        fill(255, 255, 255, this.alpha);
        ellipse(this.x, this.y, this.size, this.size);
    }
}

void keyPressed() {
    if(key == 's') {
        String timeStamp = str(year()) + nf(month(), 2) + nf(day(), 2) + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
        save("frame/" + timeStamp + ".png");
    }
}