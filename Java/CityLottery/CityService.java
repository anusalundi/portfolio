package com.datorium.Datorium.API.CityLottery;

import java.util.Random;
import java.util.ArrayList;

public class CityService {

    private ICityRepository cityRepository;
    public CityService(ICityRepository cityRepository) {
        this.cityRepository = cityRepository;
    }

    /*
    0. Prepare a list of cities
    1. Count total amount of citizens -> 100
    2. Choose random number -> 56
    3. Loop going through all of the cities
    population - 75
    randomValue - 56
    we subtract 56-75 = 31
    because it's not below or equal to 0, go to next
    31-75 - because it's below 0, we choose this city
     */

    public City getRandomCity() throws Exception {
        var cities = new ArrayList<>(cityRepository.getCities());
        //1. Count total amount of citizens -> 100 - SERVICE
        int totalCitizenCount = getTotalCitizenCount(cities);
        //2. Choose random number -> 56 - SERVICE
        int randomValue = getRandomNumber(totalCitizenCount);
        // choose correct city
        return selectCityByRandomValue(cities, randomValue);
    }
    private int getTotalCitizenCount(ArrayList<City> cities) {
        int totalCitizenCount = 0;
        for (City city : cities) {
            totalCitizenCount += city.getPopulation();
        }
        return totalCitizenCount;
    }

    private int getRandomNumber(int totalCitizenCount) {
        Random random = new Random();
        return random.nextInt(totalCitizenCount);
    }

    private City selectCityByRandomValue(ArrayList<City> cities, int randomValue) throws Exception {
        for (City city : cities) {
            randomValue -= city.getPopulation();

            if (randomValue <= 0) {
                return city;
            }
        }
        throw new Exception("Something went wrong");
    }
}
