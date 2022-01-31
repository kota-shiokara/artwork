/*
 * CenterCircle
 * AltEdu2022 コーディングチャレンジ 2/1
 * テーマ : "画面の中央に円を描くところからコードを書いてください。"
 * @author kota-shiokara
 * 
*/

// CenterCircleのそーしゃるでぃすたんす
float circlePoint = PI / 12;
// 半径
int centerRadius = 200;
// 描画のための角度
float centerRotate = 0;
// 自由玉の角度
float freeRotate = 0;
// 自由玉のテンポ(単位はframe)
float freeTempo = 30;
// 自由玉大きさ
float freeSize = 20;
// 自由玉色
color freeColor = color(255, 255, 255);

// 波紋
ArrayList<Ripple> ripples = new ArrayList<Ripple>();
// 波紋を出すまでのカウント
int counter = 2;

void setup() {
    size(600, 600);
    background(0);
}

void draw() {
    translate(width / 2, height / 2);
    background(0);

    // 波紋s
    noStroke();
    for(int i = 0; i < ripples.size(); i++) {
        ripples.get(i).update();
        ripples.get(i).display();
        if(ripples.get(i).flag) {
            ripples.remove(i);
        }
    }

    // 自由玉の移動及び波紋追加
    if(frameCount % freeTempo == 0) {
        freeRotate = (freeRotate + circlePoint) % TWO_PI;
        if(counter > 0) {
            counter -= 1;
        } else if(counter == 0) {
            counter = int(random(1, 4));
            float r = random(100, 255);
            float g = random(100, 255);
            float b = random(100, 255);
            float alpha = random(50, 70);
            ripples.add(new Ripple(centerRadius, 0, freeRotate, freeSize, random(1, 5), color(r, g, b), alpha));
            freeColor = color(r, g, b);
        }
    }
    
    // 自由玉
    rotate(freeRotate);
    stroke(freeColor);
    fill(freeColor);
    ellipse(centerRadius, 0, freeSize, freeSize);

    // CenterCircle
    fill(255);
    noStroke();
    for(; centerRotate <= TWO_PI; centerRotate += circlePoint) {
        ellipse(centerRadius, 0, 10, 10);
        rotate(circlePoint);
    }
    rotate(-centerRotate);
    centerRotate = 0;
}

int frame = 0;
void keyPressed() {
    if(key == 's') {
        save("frame/" + frame +".png");
        frame += 1;
    }
}