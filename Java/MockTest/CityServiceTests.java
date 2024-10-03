package com.datorium.Datorium.API;

import com.datorium.Datorium.API.CityLottery.City;
import com.datorium.Datorium.API.CityLottery.CityRepository;
import com.datorium.Datorium.API.CityLottery.CityService;
import com.datorium.Datorium.API.CityLottery.ICityRepository;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.util.Assert;

import java.util.ArrayList;

import static org.mockito.Mockito.when;

public class CityServiceTests {

  //1
  @Test
  public void Given_Goog83_Wocity17_When_Randomizer82_Then_ChooseGoog() throws Exception {
      //Arrange
      var cityRepository = Mockito.mock(ICityRepository.class);
      var cityService = new CityService(cityRepository, 123);
      var cities = new ArrayList<City>();
     
      cities.add(new City("Goog", 83));
      cities.add(new City("Wocity", 17));

      when(cityRepository.getCities()).thenReturn(cities);

      // Act
      var randomCity = cityService.getRandomCity();

      //Assert
      Assert.isTrue(randomCity.getName().equals("Goog"), "Goog is supposed to be chosen!");
  }

  //2
  @Test
  public void Given_OneCityWith100Citizens_When_GetRandomCity_Then_ChooseThisCity() throws Exception {
      // Arrange
      var cityRepository = Mockito.mock(ICityRepository.class);
      var cityService = new CityService(cityRepository, 123);

      var cities = new ArrayList<City>();
      cities.add(new City("OneCity", 100));

      when(cityRepository.getCities()).thenReturn(cities);

      // Act
      var randomCity = cityService.getRandomCity();

      // Assert
      Assert.isTrue(randomCity.getName().equals("OneCity"), "OneCity is supposed to be chosen!");
  }

  //3
  @Test
    public void Given_NoSeedProvided_When_GetRandomCity_Then_ChooseAnyCity() throws Exception {
        // Arrange
        var cityRepository = Mockito.mock(ICityRepository.class);
        var cityService = new CityService(cityRepository); 

        var cities = new ArrayList<City>();
        cities.add(new City("Goog", 60));
        cities.add(new City("Wocity", 40));

        when(cityRepository.getCities()).thenReturn(cities);

        // Act
        var randomCity = cityService.getRandomCity();

        // Assert
        Assert.notNull(randomCity, "A city should be chosen!");
    }

  //4
  @Test
    public void Given_NegativeCitizenCount_When_GetRandomCity_Then_ThrowException() {
        // Arrange
        var cityRepository = Mockito.mock(ICityRepository.class);
        var cityService = new CityService(cityRepository, 123);

        var cities = new ArrayList<City>();
        cities.add(new City("BadCity", -50));

        when(cityRepository.getCities()).thenReturn(cities);

        // Act & Assert
        Exception exception = assertThrows(Exception.class, () -> {
            cityService.getRandomCity();
        });

        String expectedMessage = "Something wrong";
        String actualMessage = exception.getMessage();

        Assert.isTrue(actualMessage.contains(expectedMessage), "Exception message should indicate the issue.");
    }

  //5
  @Test
    public void Given_NoCitiesProvided_When_GetRandomCity_Then_ThrowException() {
        // Arrange
        var cityRepository = Mockito.mock(ICityRepository.class);
        var cityService = new CityService(cityRepository, 123);

        var cities = new ArrayList<City>(); 

        when(cityRepository.getCities()).thenReturn(cities);

        // Act & Assert
        Exception exception = assertThrows(Exception.class, () -> {
            cityService.getRandomCity();
        });

        String expectedMessage = "Something wrong";
        String actualMessage = exception.getMessage();

        Assert.isTrue(actualMessage.contains(expectedMessage), "Exception message should be thrown when no cities are provided.");
    }
}
