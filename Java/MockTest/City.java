package com.datorium.Datorium.API.CityLottery;

public class City {
    private final String name;
    private final int population;

    public City(String name, int population) {
        this.name = name;
        this.population = population;
    }

    //Getters
    public String getName() {
        return name;
    }
    public int getPopulation() {
        return population;
    }
}
