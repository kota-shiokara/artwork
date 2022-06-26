import java.util.Calendar;

boolean isFloatNaN(float x) {
    return Float.isNaN(x);
}

boolean areFloatNaN(Table a, int index) {
    for(int i = 1; i < a.getColumnCount(); i++) {
        if(isFloatNaN(a.getFloat(index, i))) return true;
    }
    return false;
}

void townPrint(HashMap<String, Town> townInfo, boolean nanCheck) {
    for(Map.Entry me : townInfo.entrySet()) {
        println(me.getKey() + ": " + me.getValue());

        if(isFloatNaN(((Town)me.getValue()).households) && nanCheck) println("is NaN");
    }
}

color generateColor() {
    int colorMode = this.g.colorMode;
    if(colorMode == HSB) {
        // HSB(360, 100, 100)
        float h = random(0, 350);
        float s = random(0, 100);
        float b = random(0, 100);
  
        return color(h, s, b);
    } else {
        // RGB or other
        int r = (int)random(0, 255);
        int g = (int)random(0, 255);
        int b = (int)random(0, 255);
        return color(r, g, b);
    }
}

String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}