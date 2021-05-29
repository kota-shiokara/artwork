ArrayList<TwinRectangle> tr = new ArrayList<TwinRectangle>();

void setup() {
    size(640, 360);
    rectMode(CENTER);
    noFill();
    strokeWeight(4);
    stroke(100);
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 5; j++){
            tr.add(new TwinRectangle(j * 150, i * 150, 200));
        }
    }
}

void draw() {
    background(#6495ed); // 薄い青
    //background(#000033); // 濃い青

    for(int i = 0; i < tr.size(); i++){
        //tr.get(i).update(map(noise(i), 0, 1, 0.3, 0.8), 2);
        tr.get(i).update(0.05, 1);
        tr.get(i).display();
    }
}

class TwinRectangle{
    private float x, y;
    private float firstSize, secondSize, size;
    private float firstAngle = 0, secondAngle = PI / 2;
    private boolean sizeFrag = false;

    TwinRectangle(float _x, float _y, float _size){
        x = _x;
        y = _y;
        size = _size;
        firstSize = _size;
        secondSize = 0;
    }

    void update(float angleMove, float sizeMove){
        firstAngle += angleMove * 0.01;
        secondAngle -= angleMove * 0.05;
        if(sizeFrag){
            firstSize += sizeMove * 0.5;
            secondSize -= sizeMove * 0.5;
        }else{
            firstSize -= sizeMove * 0.5;
            secondSize += sizeMove * 0.5;
        }
        if(firstSize > size || secondSize > size){
            sizeFrag = !sizeFrag;
        }
    }

    void display(){
        translate(x, y);
        rotate(firstAngle);
        rect(0, 0, firstSize, firstSize);
        rotate(-firstAngle);
        
        rotate(secondAngle);
        rect(0, 0, secondSize, secondSize);
        rotate(-secondAngle);
        translate(-x, -y);
    }
}