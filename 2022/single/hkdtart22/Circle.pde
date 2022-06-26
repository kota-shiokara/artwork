class Circle {
    PVector pos;
    float radius;
    color col;

    Circle() {
        pos = new PVector();
        col = generateColor();
    }

    void display() {
        fill(col);
        ellipse(pos.x, pos.y, radius * 2, radius * 2);
    }
}