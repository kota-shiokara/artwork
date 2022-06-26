class CircleManager {
    ArrayList<Circle> circles;

    int MAX_TRIALS = 50;
    float MIN_INIT_SIZE = 0.30;
    float MAX_INIT_SIZE = 0.90;

    CircleManager(ArrayList<Circle> _circles) {
        this.circles = _circles;
    }

    float getMaxRadius(PVector center) {
        float maxRadius = abs(center.y - height / 2 * random(0.8, 1.0)); 

        for (Circle c : circles) {
            maxRadius = min(PVector.sub(c.pos, center).mag() - c.radius, maxRadius);
        }

        return maxRadius;
    }

    void generateInitCircles(int totalCircles) {
        for (int i = 0; i < totalCircles; i++) {
            PVector pos = new PVector();
            float maxRadius;
            do {
                pos.x = round(random(width));
                pos.y = round(random(height));
                maxRadius = min(getMaxRadius(pos), round(min(height, width) * 0.5));
            } while (maxRadius < 0);

            Circle c = new Circle();
            c.pos = pos.copy();
            c.radius = round(random(maxRadius * MIN_INIT_SIZE, maxRadius * MAX_INIT_SIZE));

            circles.add(c);
        }
    }

    void generateInitTownCircles(HashMap<String, Town> townInfo) {
        // float basePopulation = sumPopulation(townInfo);
        float basePopulation = iikanziPopulation(townInfo);

        for(Map.Entry town : townInfo.entrySet()) {
            Town t = (Town)town.getValue();
            PVector pos = new PVector();
            float maxRadius;
            do {
                pos.x = round(random(width));
                pos.y = round(random(height));
                maxRadius = min(getMaxRadius(pos), round(min(height, width)));
            } while (maxRadius < 0);

            Circle c = new Circle();
            c.pos = pos.copy();
            float initSize = t.population / basePopulation;
            if(initSize < MIN_INIT_SIZE) {
                c.radius = round(random(maxRadius * MIN_INIT_SIZE, maxRadius * MAX_INIT_SIZE));
            } else if(MAX_INIT_SIZE < initSize) {
                c.radius = round(random(maxRadius * MIN_INIT_SIZE, maxRadius * MAX_INIT_SIZE));
            } else {
                float max = MAX_INIT_SIZE - initSize;
                float min = initSize - MIN_INIT_SIZE;
                if(max < min) {
                    c.radius = round(random(maxRadius * MIN_INIT_SIZE, maxRadius * initSize));
                } else {
                    c.radius = round(random(maxRadius * initSize, maxRadius * MAX_INIT_SIZE));
                }
            }
            c.radius = round(random(maxRadius * MIN_INIT_SIZE, maxRadius * MAX_INIT_SIZE));

            int r = (int)map(t.femalePopulation / t.population, 0, 1, 0, 255);
            int b = (int)map(t.malePopulation / t.population, 0, 1, 0, 255);
            c.col = color(r, 0, b);

            circles.add(c);
        }
    }

    Circle generateFillingCircle() {
        PVector pos = new PVector();
        int totalTrials = 0;
        float radius;

        do {
            pos.x = round(random(width));
            pos.y = round(random(height));
            radius = getMaxRadius(pos);
            ++totalTrials;
        } while (radius < 0 && totalTrials < MAX_TRIALS);
        if (radius < 0) {
            return null;
        }

        Circle c = new Circle();
        c.pos = pos.copy();
        c.radius = radius;
        circles.add(c);
        return c;
    }

    void display() {
        for(Circle c: circles) {
            c.display();
        }
    }

    float sumPopulation(HashMap<String, Town> townInfo) {
        float sumPopulation = 0;
        for(Town t: townInfo.values()) {
            sumPopulation += t.population;
        }
        return sumPopulation;
    }

    float iikanziPopulation(HashMap<String, Town> townInfo) {
        float maxPopulation = 0;
        float minPopulation = Float.MAX_VALUE;
        for(Town t: townInfo.values()) {
            minPopulation = min(minPopulation, t.population);
            maxPopulation = max(maxPopulation, t.population);
        }
        return maxPopulation + minPopulation;
    }
}