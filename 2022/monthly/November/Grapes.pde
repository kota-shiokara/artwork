class Grapes extends Fruits {
    float branchThickness, branchHeight;
    float grapeSize;
    float increaseRad, rad = 0;

    Grapes(float x, float y, float fallSpeed, float baseSize) {
        super(x, y, fallSpeed, baseSize);
        setting();
    }

    Grapes(float x, float y, float fallSpeed) {
        super(x, y, fallSpeed, 30);
        setting();
    }

    void setting() {
        this.branchThickness = baseSize / 8;
        this.branchHeight = -baseSize * 0.7;
        this.grapeSize = baseSize / 2;
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
        vertex(0, -grapeSize);
        vertex(-branchThickness, -grapeSize + branchHeight);
        vertex(branchThickness, -grapeSize + branchHeight);
        endShape();

        fill(#522f60);
        ellipse(0, -grapeSize, grapeSize, grapeSize);
        ellipse(-grapeSize, -grapeSize, grapeSize, grapeSize);
        ellipse(grapeSize, -grapeSize, grapeSize, grapeSize);
        ellipse(grapeSize / 2, 0, grapeSize, grapeSize);
        ellipse(-grapeSize / 2, 0, grapeSize, grapeSize);
        ellipse(0, grapeSize, grapeSize, grapeSize);

        rotate(-this.rad);
        translate(-x, -y);
        displaySettingFresh();
    }

    @Override
    float fruitsSize() {
        return baseSize;
    }
}