class Apple extends Fruits {
    float branchThickness, branchHeight;
    float increaseRad, rad = 0;

    Apple(float x, float y, float fallSpeed, float baseSize) {
        super(x, y, fallSpeed, baseSize);
        setting();
    }

    Apple(float x, float y, float fallSpeed) {
        super(x, y, fallSpeed, 30);
        setting();
    }

    void setting() {
        this.branchThickness = baseSize / 8;
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

        fill(#00FF00);
        ellipse(-branchHeight / 2, branchHeight * 0.75, branchHeight * 0.7, branchHeight / 5);

        fill(#ff0000);
        ellipse(0, 0, baseSize * 1.5, baseSize * 1.5);

        rotate(-this.rad);
        translate(-x, -y);
        displaySettingFresh();
    }

    @Override
    float fruitsSize() {
        return baseSize;
    }
}