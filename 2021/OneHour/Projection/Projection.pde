float scale = 18;
float sectionScale = scale * 5;
PGraphics pg;
HeartBeat hb;

void setup() {
    size(960, 540);

    pg = createGraphics(960, 540);
    createBackground();

    hb = new HeartBeat();
}

void draw() {
    background(0);
    tint(255, 255, 255, 80);
    image(pg, 0, 0);
    translate(0, height/2);
    hb.display();
}

void createBackground(){
    pg.beginDraw();
    pg.colorMode(RGB, 255);
    pg.background(#001400);
    pg.stroke(#19a019);
    for(int i = 0; i < 960; i += scale){
        if(i % sectionScale == 0){
            pg.strokeWeight(2);
            pg.stroke(#19a019);
        }else{
            pg.strokeWeight(1);
            pg.stroke(25, 160, 25, 90);
        }
        pg.line(i, 0, i, height);
    }
    for(int i = 0; i < 540; i += scale){
        if(i % sectionScale == 0){
            pg.strokeWeight(2);
            pg.stroke(#19a019);
        }else{
            pg.strokeWeight(1);
            pg.stroke(25, 160, 25, 90);
        }
        pg.line(0, i, width, i);
    }
    pg.endDraw();
}

class HeartBeat{
    float first = width/8;
    float cuurentPoint = 0;

    int mountNum;
    FloatList mountPos = new FloatList();
    float mountSum = 0;
    float mountArea = width - (first*2);
    float mountWidth;

    HeartBeat(){
        mountNum = (int)random(8, 10);
        mountWidth = mountArea / (mountNum / 2.0);
        //first = width/10;
        for(int i = 0; i < mountNum; i++){
            mountPos.append(random(10, 250));
        }
        /*for(int i = 0; i < mountPos.size(); i++){
            mountSum += mountPos.get(i);
        }*/
    }

    void display(){
        stroke(0, 255, 0);
        strokeWeight(6);
        if(cuurentPoint < first){
            line(0, 0, cuurentPoint, 0);
        }else if(cuurentPoint > first && cuurentPoint < (width - first)){
            line(0, 0, first, 0);
            float beforePosX = first;
            float beforePosY = 0;
            int cnt = 0;
            for(float i = first; i < cuurentPoint; i+=mountWidth){
                if(cnt % 2 == 0) mountPos.mult(cnt, -1.0);
                line(beforePosX, beforePosY, beforePosX + (mountWidth / 2), mountPos.get(cnt));
                beforePosX += mountWidth;
                beforePosY = mountPos.get(cnt);
                cnt++;
            }
        }else{
            line(0, 0, first, 0);
            float beforePosX = first;
            float beforePosY = 0;
            int cnt = 0;
            for(float i = first; i < width - first; i+=mountWidth){
                if(cnt % 2 == 0) mountPos.mult(cnt, -1.0);
                line(beforePosX, beforePosY, beforePosX + (mountWidth / 2), mountPos.get(cnt));
                beforePosX += mountWidth;
                beforePosY = mountPos.get(cnt);
                cnt++;
            }
            line(beforePosX, beforePosY, beforePosX, 0);
            line(beforePosX, 0, width, 0);
        }
        if(width >= cuurentPoint) cuurentPoint+=5;
    }
}

void keyPressed() {
    if(key == 's'){
        save("frame/BrokenECGMonitor.png");
    }
}