Moon moon;
Ground ground;
Cloud cloud;

void setup() {
    size(400, 620);
    background(255);

    moon = new Moon(width * (13 / 15.0), 140, 280);
    ground = new Ground(width / 2, height, 400);
    cloud = new Cloud(width / 8, 140, 200);
}

void draw() {
    background(255, 0, 0);
    
    moon.display();
    ground.display();
    cloud.display();
    //cloud.update(frameCount * 0.01);
    //noLoop();
}

class Moon{
    float mx, my;
    float size;
    Moon(float _mx, float _my, float _size){
        mx = _mx;
        my = _my;
        size = _size;
    }
    void display(){
        stroke(0);
        strokeWeight(2);
        fill(255);
        ellipse(mx, my, size, size);
    }
}

class Ground{
    float gx, gy;
    float size;
    Ground(float _gx, float _gy, float _size){
        gx = _gx;
        gy = _gy;
        size = _size;
    }
    void display(){
        stroke(0);
        fill(0);
        ellipse(gx, gy, size * 1.5, size);
    }
}

class Cloud{
    float cx, cy;
    float size;
    float vertical = 30;

    Cloud(float _cx, float _cy, float _size){
        cx = _cx;
        cy = _cy;
        size = _size;
    }

    void display(){
        strokeWeight(1);
        stroke(0);
        fill(255);
        rect(cx - (size / 10), cy - vertical, size, vertical, 20);
        rect(cx + (size / 12), cy + vertical, size * 1.3, vertical, 20);

        noStroke();
        rect(cx + (size / 8), cy - (vertical / 2), vertical, size/3);
        stroke(0);
        line(cx + (size / 8), cy, cx + (size / 8), cy + vertical);
        line(cx + (size / 8) + vertical, cy, cx + (size / 8) + vertical, cy + vertical);
    }

    void update(float t){
        //cx += cos(t);
        cy += sin(t);
    }
}

void keyPressed() {
    if(key == 's'){
        save("frame/JapaneseStyle.png");
    }
}