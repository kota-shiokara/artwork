ArrayList<Squid> squad = new ArrayList<Squid>();
float seed = 0;
color[] colors = { color(255), color(255, 0, 0), color(0, 255, 0), color(0, 0, 255) };

void setup() {
    size(600, 600);
    for(int i = 0; i < 4; i++) {
        int xBit = i & 0x01;
        int yBit = i & 0x02;
        float x = -width / 4 + xBit * width / 2;
        float y = -height / 4 + (yBit / 2) * height / 2;


        squad.add(new Squid(x, y, colors[i]));
    }
}

void draw() {
    background(0);
    translate(width / 2, height / 2);

    for(int i = 0; i < squad.size(); i++) {
        squad.get(i).update();
        squad.get(i).display();
    }
}

class Squid {
    final float legsWidth = 120;
    final float legWidth = legsWidth / 3;
    final float triangleHeight = 60;
    final float triangleWidth = legsWidth + 50;

    final float legMaxHeight = 120;
    final float legMinHeight = 80;
    final float legMoveValue = 2.5;

    final float rotateIncrease = 0.002;
    
    color squidColor = color(255, 255, 255);

    float x, y;
    float[] legs = { random(legMinHeight, legMaxHeight), random(legMinHeight, legMaxHeight), random(legMinHeight, legMaxHeight) };
    FloatList seedIncrease = new FloatList();
    float rotate = 0.001;

    Squid(float _x, float _y) {
        this.x = _x;
        this.y = _y;

        seedIncrease.append(random(0, 1));
        seedIncrease.append(random(0, 10));
        seedIncrease.append(random(0, 50));
    }

    Squid(float _x, float _y, color _squidColor) {
        this(_x, _y);
        this.squidColor = _squidColor;
    }

    void update() {
        for(int i = 0; i < legs.length; i++) {
            rotate += rotateIncrease;

            seedIncrease.set(i, seedIncrease.get(i) + 0.1);
            float noiseResult = noise(seedIncrease.get(i) * i) - 0.5;
            legs[i] += legMoveValue * noiseResult;

            if(legs[i] > legMaxHeight) {
                legs[i] = legMaxHeight;
            } else if(legs[i] < legMinHeight) {
                legs[i] = legMinHeight;
            }
        }
    }

    void update(float newX, float newY) {
        this.x = newX;
        this.y = newY;
        update();
    }

    void display() {
        pushMatrix();
        stroke(squidColor);
        rotate(rotate);
        translate(this.x, this.y);
        rotate(-rotate);
        fill(squidColor);
        // Head
        triangle(0, -triangleHeight, -triangleWidth / 2, 0, triangleWidth / 2, 0);

        rectMode(CENTER);
        ellipseMode(CENTER);
        // Leg
        float legLeft = -(legsWidth / 2) + (legWidth / 2);
        for(int i = 0; i < legs.length; i++) {
            float pointX = legLeft + (legWidth * i);
            rect(pointX, legs[i] / 2, legWidth, legs[i]);
            ellipse(pointX, legs[i], legWidth, legWidth);
        }
        popMatrix();
    }
}

int frame = 1;
void keyPressed() {
    if(key == 's') {
        save("frame/" + frame++ + ".png");
    }
}