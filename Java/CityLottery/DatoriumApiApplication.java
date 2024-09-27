package com.datorium.Datorium.API;

import com.datorium.Datorium.API.CityLottery.CityRepository;
import com.datorium.Datorium.API.CityLottery.CityService;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
@CrossOrigin
public class DatoriumApiApplication {

	public static void main(String[] args) throws Exception {
		var cityService = new CityService(new CityRepository());
		var randomCity = cityService.getRandomCity();
		System.out.println(randomCity.getName());

		//var userService = new UserService();
		//System.out.println(userService.getFullName("Oskars", "Klaumanis"));
		//SpringApplication.run(DatoriumApiApplication.class, args);
	}
}
