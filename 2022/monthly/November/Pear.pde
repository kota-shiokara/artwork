class Pear extends Fruits {
    float branchThickness, branchHeight;
    float increaseRad, rad = 0;

    Pear(float x, float y, float fallSpeed, float _baseSize) {
        super(x, y, fallSpeed, _baseSize);
        setting();
    }

    Pear(float x, float y, float fallSpeed) {
        super(x, y, fallSpeed, 30);
        setting();
    }

    void setting() {
        this.branchThickness = baseSize / 6;
        this.branchHeight = -baseSize * 1.3;
        this.increaseRad = random(-SIXTY_FOURTH_PI, SIXTY_FOURTH_PI);
    }

    @Override
    void update() {
        this.y += this.fallSpeed;
        this.rad += this.increaseRad;
    }

    @Override
    void display() {
        translate(x, y);
        rotate(this.rad);

        fill(#734E30);
        beginShape();
        vertex(0, 0);
        vertex(-branchThickness, branchHeight);
        vertex(branchThickness, branchHeight);
        endShape();

        fill(#D5EAD8);
        ellipse(0, baseSize / 3, baseSize * 1.5, baseSize * 1.5);
        ellipse(0, -baseSize / 3, baseSize, baseSize);

        rotate(-this.rad);
        translate(-x, -y);
        displaySettingFresh();
    }

    @Override
    float fruitsSize() {
        return abs(branchHeight);
    }
}