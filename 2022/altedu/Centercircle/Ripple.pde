class Ripple{
    float x, y;
    float radius, size;
    float increase;
    color c;
    float alpha;
    boolean flag = false;

    Ripple(float _x, float _y, float _radius, float _size, float _increase, color _c, float _alpha){
        this.x = _x;
        this.y = _y;
        this.radius = _radius;
        this.size = _size;
        this.increase = _increase;
        this.c = _c;
        this.alpha = _alpha;
    }

    void update() {
        this.size += this.increase;
        if(frameCount % 2 == 0) {
            this.alpha -= 0.2;
        }
        if(this.alpha < 0) {
            this.flag = true;
        }
    }

    void update(float newIncrease) {
        this.increase = newIncrease;
        this.size += newIncrease;
    }

    void display() {
        noStroke();
        fill(this.c, this.alpha);
        rotate(this.radius);
        ellipse(this.x, this.y, this.size, this.size);
        rotate(-this.radius);
    }
}