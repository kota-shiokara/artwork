/*動かさない方がいい値*/
ArrayList<lineBoll> unit = new ArrayList();
int addLine = 0;
float alpha = 20;

/*ユーザー任意の値*/
boolean alphaCheck = true; // lineを消すかどうか true=消す, false=20%の半透明
int lineNum = 5; // ボールとラインの数 自然数なら好きな数入力できるけど5だと綺麗に回ってるように見える
/* いい感じの数memo
5, 16, 26
*/

void setup() {
    size(500, 500);
    colorMode(HSB, 360, 100, 100, 100);
    if(alphaCheck) alpha = 0;
}

void draw() {
    translate(width/2, height/2);
    background(0);

    // ラインを30フレームごとに追加していく
    if(addLine < lineNum && frameCount % 30 == 0){
        addLine++;
        unit.add(new lineBoll(0, -height / 2 + 50, 0, height / 2 - 50, map(addLine, 0, lineNum, 0, 360 - 360 / lineNum), 25));
    }
    // メイン処理
    for(int i = 0; i < unit.size(); i++){
        rotate(PI / lineNum);
        unit.get(i).update();
        unit.get(i).display();
    }
}

class lineBoll{
    float x, y, dx, dy, hue;
    float bx, by, size;
    float t = 0;

    lineBoll(float x, float y, float dx, float dy, float hue, float size){
        this.x = x;
        this.y = y;
        this.dx = dx;
        this.dy = dy;
        this.hue = hue;
        this.size = size;
        bx = x;
        by = y;
    }

    // 更新処理
    void update(){
        t += 0.02;
        bx = map(sin(t), -1, 1, dx, x);
        by = map(sin(t), -1, 1, y, dy);
    }

    // 描画処理
    void display(){
        strokeWeight(3);
        stroke(hue, 0, 100, alpha);
        line(x, y, dx, dy);
        noStroke();
        fill(hue, 100, 100);
        ellipse(bx, by, size, size);
    }
}