package com.datorium.Datorium.API.CityLottery;

import java.util.Random;

public class CityService {

    private ICityRepository cityRepository;
    private int seed;
    public CityService(ICityRepository cityRepository, int seed){
        this.cityRepository = cityRepository;
        this.seed = seed;
    }

    public CityService(ICityRepository cityRepository){
        this.cityRepository = cityRepository;
    }
    
    public City getRandomCity() throws Exception {
        var cities = cityRepository.getCities();
        var totalCitizenCount = 0;
        for (City city: cities){
            totalCitizenCount += city.getPopulation();
        }
       
        Random random = (seed != 0)
                ? new Random(seed)
                : new Random();

        int randomValue = random.nextInt(totalCitizenCount);
        
        for(City city: cities){
            randomValue -= city.getPopulation();

            if(randomValue <= 0){
                return city;
            }
        }
        throw new Exception("Something wrong");
    }


}
