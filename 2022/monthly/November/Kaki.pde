class Kaki extends Fruits {
    float branchThickness, branchHeight;
    float increaseRad, rad = 0;

    Kaki(float x, float y, float fallSpeed, float baseSize) {
        super(x, y, fallSpeed, baseSize);
        setting();
    }

    Kaki(float x, float y, float fallSpeed) {
        super(x, y, fallSpeed, 30);
        setting();
    }

    void setting() {
        this.branchThickness = baseSize * 0.8;
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

        fill(#fd7e00);
        rectMode(CENTER);
        rect(0, 0, baseSize * 2, baseSize, 10);

        fill(#734E30);
        beginShape();
        vertex(0, -baseSize / 2);
        vertex(-branchThickness * 0.8, -baseSize * 0.8);
        vertex(-branchThickness * 1.2, -baseSize * 0.5);
        vertex(-branchThickness, -baseSize * 0.3);
        vertex(branchThickness * 0.8, -baseSize * 0.8);
        vertex(branchThickness * 1.2, -baseSize * 0.5);
        vertex(branchThickness, -baseSize * 0.3);
        endShape();

        rotate(-this.rad);
        translate(-x, -y);
        displaySettingFresh();
    }

    @Override
    float fruitsSize() {
        return abs(baseSize);
    }
}