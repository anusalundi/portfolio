package com.datorium.Datorium.API.CityLottery;

import java.util.ArrayList;

public class CityRepository implements ICityRepository {

    //mock db

    public ArrayList<City> getCities() {
        // 0. Prepare a list of cities - REPOSITORY
        ArrayList<City> cities = new ArrayList<>();
        var goog = new City("Goog", 75);
        var wocity = new City("Wocity", 25);
        var oskarscity = new City("Oskars city", 25);
        cities.add(goog);
        cities.add(wocity);
        cities.add(oskarscity);
        return cities;
    }
}
