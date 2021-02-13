ArrayList<Circuit> circuit = new ArrayList<Circuit>();

int lineScale = 30;
float tX = 0, tY = 0;
boolean stop = false;

void setup() {
    background(255);
    size(500,500);
}

void draw() {
    background(255);
    translate(tX, tY);
    strokeWeight(8);
    point(width / 2, height);
    strokeWeight(1);
    if(frameCount == 1) circuit.add(new Circuit(width / 2, height, width / 2, height - lineScale));
    for(int i = 0; i < circuit.size(); i++){
        if(!stop){
            circuit.get(i).update();
            if(circuit.get(i).flag && !circuit.get(i).created){
                int rnd = (int)random(0, 10);
                if(rnd > 3) rnd = 0;
                else if(rnd > 1) rnd = (int)random(10, 35);
                else rnd = -(int)random(10, 35);
                circuit.add(new Circuit(circuit.get(i).nextX, circuit.get(i).nextY, circuit.get(i).nextX + rnd, circuit.get(i).nextY - lineScale));
                if(rnd != 0) circuit.add(new Circuit(circuit.get(i).nextX, circuit.get(i).nextY, circuit.get(i).nextX - rnd, circuit.get(i).nextY - lineScale));
                circuit.get(i).created = true;
            }
        }
        circuit.get(i).display();
    }
}

class Circuit{
    float x, y, nextX, nextY;
    float crtX, crtY;
    boolean flag;
    boolean created;
    float numX, numY;

    Circuit(float _x, float _y, float _nextX, float _nextY){
        x = _x;
        y = _y;
        nextX = _nextX;
        nextY = _nextY;
        crtX = 0;
        crtY = 0;
        flag = false;
        created = false;
        float rnd = (int)random(0,3) == (2|3) ? 100 : (int)random(0,2) == (1|2) ? 70 : 30;
        numX = abs(x - nextX) / rnd;
        numY = abs(y - nextY) / rnd;
    }

    void update(){
        if(x > nextX && x + crtX >= nextX) crtX-=numX;
        else if(x < nextX && x + crtX <= nextX) crtX+=numX;
        if(y > nextY && y + crtY >= nextY) crtY-=numY;
        if(y + crtY <= nextY) flag = true;
    }

    void display(){
        line(x, y, x + crtX, y + crtY);
    }
}

void mouseDragged() {
    tX += mouseX - pmouseX;
    tY += mouseY - pmouseY;
}

int photo = 0;
void keyPressed() {
    if(key == 'q'){
        stop = !stop;
    }
    if(key == 's'){
        save("frame/" + photo + ".png");
        photo++;
    }
}