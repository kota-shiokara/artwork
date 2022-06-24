class Town {
    public float households, fluctuationHouseholds;
    public float population, fluctuationPopulation;
    public float malePopulation, femalePopulation;

    Town(float _households, float _fluctuationHouseholds, float _population, float _fluctuationpopulation, float _malePopulation, float _femalePopulation) {
        this.households = _households;
        this.fluctuationHouseholds = _fluctuationHouseholds;
        this.population = _population;
        this.fluctuationPopulation = _fluctuationpopulation;
        this.malePopulation = _malePopulation;
        this.femalePopulation = _femalePopulation;
    }

    boolean equals(Object obj) {
        if(obj instanceof Town) {
            return true;
        } else {
            return false;
        }
    }

    String toString() {
        return households + ", " + fluctuationHouseholds + ", " + population + ", " + fluctuationPopulation + ", " + malePopulation + ", " + femalePopulation;
    }
}