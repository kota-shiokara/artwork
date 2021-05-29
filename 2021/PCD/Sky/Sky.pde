ArrayList<Air> aires = new ArrayList<Air>();
float size = 200;
boolean flag = false;

void setup() {
    size(512, 512);
    background(#3398ff);
    for(int i = 0; i < 5; i++)aires.add(new Air());
    for(int i = 0; i < 5; i++)aires.get(i).x = -width/2 + (i * width / 4);
    for(int i = 0; i < 5; i++)aires.get(i).y = height / 2;
    frameRate(1);
}

void draw() {
    if(flag)frameRate(60);
    if(frameCount > 3)flag = true;
    translate(width / 2, height / 2);
    stroke(255);
    strokeWeight(16);
    
    aires.get(0).x += 4 * sin(0.01 * frameCount);
    aires.get(1).x += 2 * sin(0.01 * frameCount);
    aires.get(3).x -= 2 * sin(0.01 * frameCount);
    aires.get(4).x -= 4 * sin(0.01 * frameCount);


    for(int i = 0; i < aires.size(); i++){
        //aires.get(i).x = size * sin(0.001 * frameCount);
        //aires.get(i).y = size * cos(0.001 * frameCount);
        aires.get(i).y -= 0.01 * frameCount;
        aires.get(i).display();
    }
}

class Air{
    float x, y;
    Air(){
        x = 0;
        y = 0;
    }
    void display(){
        point(x, y);
    }
}
