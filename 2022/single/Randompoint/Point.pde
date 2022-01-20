class Point {
    float x, y;
    color c;
    private float step = 1;
    private int alpha = 100;

    Point(float _x, float _y, color _c) {
        this.x = _x;
        this.y = _y;
        this.c = _c;
    }

    void display() {
        stroke(this.c, alpha);
        point(this.x, this.y);
    }

    void update() {
        int choice = int(random(4));
        if(choice == 0){
            this.x += step;
        } else if(choice == 1){
            this.x -= step;
        } else if(choice == 2){
            this.y += step;
        } else {
            this.y -= step;
        }

        if(this.x < 0) {
            this.x = width - step;
        } else if(this.x > width) {
            this.x = step;
        }

        if(this.y < 0) {
            this.y = height - step;
        } else if(this.y > height) {
            this.y = step;
        }
    }
}