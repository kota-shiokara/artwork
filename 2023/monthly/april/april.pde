Branch branch;

void setup() {
    size(600, 800);
    background(0);
    colorMode(HSB, 360, 100, 100);
    branch = new Branch(0, 0, 0, height / 8, 8, 1.8);
}

void draw() {
    background(0, 0, 100);
    translate(width / 2, height);
    rotate(PI);

    for (int i = 0; i < height; i++) {
        strokeWeight(2);
        stroke(180, map(i, 0, height, 0, 100), 100);
        line(-width / 2, i, width / 2, i);
    }

    branch.update();
    branch.display();
}

int frame = 1;
void keyPressed() {
    if(key == 's') {
        save("frame/" + frame++ + ".png");
    }
}

class Branch {
    private float startX, startY;
    private float endX, endY;
    private float weight, percent = 0;
    private float increase, radian;
    private boolean perfectBranch = false;
    private float brightness = 28;

    private Branch leftBranch, rightBranch;

    Branch(float _startX, float _startY, float _endX, float _endY, float _weight, float _increase) {
        startX = _startX;
        startY = _startY;
        endX = _endX;
        endY = _endY;
        weight = _weight;
        increase = _increase;
        radian = getRadian(startX, startY, endX, endY);
        if (weight < 5) {
            brightness = 100;
        }
    }

    void update() {
        if (percent < 100) {
            percent += increase;
        }
        
        branchGrowthComplete();

        if (percent == 100 && perfectBranch) {
            childUpdate();
        }
    }

    void display() {
        float currentEndX = startX + ((endX - startX) * percent * 0.01);
        float currentEndY = startY + ((endY - startY) * percent * 0.01);
        strokeWeight(weight);
        stroke(345, 16, brightness);
        line(startX, startY, currentEndX, currentEndY);

        if (perfectBranch) {
            childDisplay();
        }
    }

    void branchGrowthComplete() {
        if (percent >= 100 && !perfectBranch) {
            percent = 100;
            perfectBranch = true;

            float newBranchLength = getDistance(startX, startY, endX, endY) * 0.9;
            if (newBranchLength >= 1) {
                float rand = random(PI / 5.5, PI / 6);
                float straighten = rand * 0.8;
                int border = 25;
                float straightenLeftBorder = PI / border, straightenRightBorder = PI * (border - 1) / border;
                float newWeight = 0.9, newIncrease = 0.9;

                float newLeftBranchRadian = radian - rand;
                if (newLeftBranchRadian < straightenLeftBorder) {
                    newLeftBranchRadian += straighten;
                }
                float newRightBranchRadian = radian + rand;
                if (newRightBranchRadian > straightenRightBorder) {
                    newRightBranchRadian -= straighten;
                }

                leftBranch = new Branch(
                    endX,
                    endY,
                    endX + (newBranchLength * cos(newLeftBranchRadian)),
                    endY + (newBranchLength * sin(newLeftBranchRadian)),
                    weight * newWeight,
                    increase * newIncrease
                );

                rightBranch = new Branch(
                    endX,
                    endY,
                    endX + newBranchLength * cos(newRightBranchRadian),
                    endY + newBranchLength * sin(newRightBranchRadian),
                    weight * newWeight,
                    increase * newIncrease
                );
            }
        }
    }

    boolean isLeftBranch() {
        return leftBranch != null;
    }

    boolean isRightBranch() {
        return rightBranch != null;
    }

    void childUpdate() {
        if (isLeftBranch()) {
            leftBranch.display();
        }
        if (isRightBranch()) {
            rightBranch.display();
        }       
    }

    void childDisplay() {
        if (isLeftBranch()) {
            leftBranch.update();
        }
        if (isRightBranch()) {
            rightBranch.update();
        } 
    }
} 

float getDistance(float x, float y, float x2, float y2) {
    return sqrt(pow(x2 - x) + pow(y2 - y));
}

float getRadian(float x, float y, float x2, float y2) {
    return atan2(y2 - y, x2 - x);
}

float pow(float x) {
    return x * x;
}