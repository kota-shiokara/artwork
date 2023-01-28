ArrayList<Fruits> fruitsBasket = new ArrayList<Fruits>();

void setup() {
    size(600, 600);
    background(0);

    for(int i = 0; i < initFruitsBasketSize; i++) {
        addFruitsBasket();
    }
}

void draw() {
    displayFresh();

    for(int i = 0; i < fruitsBasket.size(); i++) {
        fruitsBasket.get(i).update();

        float fruitsY = fruitsBasket.get(i).y;
        float fruitsSize = fruitsBasket.get(i).fruitsSize();
        if(fruitsY - fruitsSize > width) {
            fruitsBasket.remove(i);
            addFruitsBasket();
            i-=1;
        }
    }

    for(int i = 0; i < fruitsBasket.size(); i++) {
        fruitsBasket.get(i).display();
    }
}

int initFruitsBasketSize = 70;
int fruitsType = 4;
void addFruitsBasket() {
    int rand = floor(random(0, fruitsType));
    float newFruitsX = random(0, width);
    float newFruitsY = random(-20, 0);
    float newFruitsFallSpeed = random(1, 3);
    float newFruitsBaseSize = random(20, 50);

    switch (rand) {
        case 0:
            fruitsBasket.add(new Pear(newFruitsX, newFruitsY, newFruitsFallSpeed, newFruitsBaseSize));
            break;
        case 1:
            fruitsBasket.add(new Apple(newFruitsX, newFruitsY, newFruitsFallSpeed, newFruitsBaseSize));
            break;
        case 2:
            fruitsBasket.add(new Kaki(newFruitsX, newFruitsY, newFruitsFallSpeed, newFruitsBaseSize));
            break;
        case 3:
            fruitsBasket.add(new Grapes(newFruitsX, newFruitsY, newFruitsFallSpeed, newFruitsBaseSize));
            break;
        default:
            fruitsBasket.add(new Pear(newFruitsX, newFruitsY, newFruitsFallSpeed, newFruitsBaseSize));
            break;
    }
}

int frame = 1;
void keyPressed() {
    if(key == 's') {
        save("frame/" + frame++ + ".png");
    }
}

public void displayFresh() {
    background(255);
    displaySettingFresh();
}

public void displaySettingFresh() {
    noFill();
    noStroke();
    rectMode(CORNER);
}

float EIGHTH_PI = QUARTER_PI / 2;
float SIXTEENTH_PI = EIGHTH_PI / 2;
float THIRTY_SECOND_PI = SIXTEENTH_PI / 2;
float SIXTY_FOURTH_PI = THIRTY_SECOND_PI / 2;