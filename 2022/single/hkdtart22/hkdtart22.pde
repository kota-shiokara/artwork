import java.util.Map;


HashMap<String, Town> townInfo = new HashMap<String, Town>();
String csvPath = "./data/27kc4.csv";

void setup() {
    hashMapSetup();

    townPrint(townInfo);
}

void draw() {
    exit();
}

void hashMapSetup() {
    Table a = loadTable(csvPath);
    for(int i = 0; i < a.getRowCount(); i++) {
        townInfo.put(a.getString(i, 0), new Town(a.getFloat(i, 1), a.getFloat(i, 2), a.getFloat(i, 3), a.getFloat(i, 4), a.getFloat(i, 5), a.getFloat(i, 6)));
    }
}