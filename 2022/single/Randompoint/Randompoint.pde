ArrayList<Point> plist = new ArrayList<Point>();

float size = 500;

void setup() {
    size(500, 500);
    background(0);
    for(int i = 0; i < 1000; i++) {
        color tmp = color(random(0, 255), random(0, 255), random(0, 255));
        plist.add(new Point(random(50, size - 50), random(50, size - 50), tmp));
    }
}

void draw() {
    
    noStroke();
    fill(0, 15);
    rectMode(CORNER);
    rect(0, 0, width, height);

    for(int i = 0; i < plist.size(); i++) {
        plist.get(i).update();
        plist.get(i).display();
    }
}

int image = 1;
void keyPressed() {
    if(key == 's') {
        save("frame/" + image + "_fade.png");
        image++;
    }
}
