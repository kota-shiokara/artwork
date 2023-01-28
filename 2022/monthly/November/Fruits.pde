abstract class Fruits {
    float x, y;
    float fallSpeed;
    float baseSize;

    Fruits(float _x, float _y, float _fallSpeed, float _baseSize) {
        this.x = _x;
        this.y = _y;
        this.fallSpeed = _fallSpeed;
        this.baseSize = _baseSize;
    }

    abstract void update();
    abstract void display();
    abstract float fruitsSize();
}

enum FruitsBasket {
    PEAR,
    APPLE,
    KAKI,
    GRAPES;
}