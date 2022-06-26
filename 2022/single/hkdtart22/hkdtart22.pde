import java.util.Map;


HashMap<String, Town> townInfo = new HashMap<String, Town>();
String csvPath = "./data/27kc4.csv";

color backgroundColor;

CircleManager cManager;
int TOTAL_INIT_CIRCLES = 2000;

void setup() {
    size(1200, 600);
    // fullScreen();
    noStroke();

    hashMapSetup(true);
    townPrint(townInfo, false);

    cManager = new CircleManager(new ArrayList<Circle>());
    // cManager.generateInitCircles(TOTAL_INIT_CIRCLES);
    cManager.generateInitTownCircles(townInfo);

    backgroundColor = color(255, 255, 255);
    background(backgroundColor);
}

void draw() {
    cManager.display();
    save("frame/" + timestamp() + ".png");
    exit();
}

void hashMapSetup(boolean nanTrash) {
    Table a = loadTable(csvPath);
    for(int i = 0; i < a.getRowCount(); i++) {
        if(!areFloatNaN(a, i) || !nanTrash) townInfo.put(a.getString(i, 0), new Town(a.getFloat(i, 1), a.getFloat(i, 2), a.getFloat(i, 3), a.getFloat(i, 4), a.getFloat(i, 5), a.getFloat(i, 6)));
    }
}