boolean isFloatNaN(float x) {
    return Float.isNaN(x);
}

void townPrint(HashMap<String, Town> townInfo) {
    for(Map.Entry me : townInfo.entrySet()) {
        println(me.getKey() + ": " + me.getValue());

        Town tmp = (Town)me.getValue();
        if(isFloatNaN(tmp.households)) println("is NaN");
        else println("is Not NaN");
    }
}