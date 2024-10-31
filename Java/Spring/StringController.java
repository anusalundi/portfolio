package ee.naidis.springnaide;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
public class StringController {

    List<String> cars = new ArrayList<>(List.of("Volkswagen", "BMW", "Audi"));

    @GetMapping("hello") //localhost:8080
    public String helloWeb(){
        return "Hello web";
    }

    @GetMapping("hello/{name}")
    public String helloName(@PathVariable String name){
        return "Hello " + name;
    }

    @GetMapping("get-cars") //localhost:8080/get-cars
    public List<String> getCars(){
        return cars;
    }

    @GetMapping("add-car/{newCar}")
    public List<String> addCar(@PathVariable String newCar){
        cars.add(newCar);
        return cars;
    }

    @GetMapping("delete-car/{index}")
    public List<String> deleteCar(@PathVariable int index){
        cars.remove(index);
        return cars;
    }

    @GetMapping("cars-count")
    public int number(){
        return cars.size();
    }

    @GetMapping("letter-count")
    public int letterCount(){
        int sum = 0;
        for(int i = 0; i < cars.size(); i++){
            String car = cars.get(i);
            sum += car.length();
        }
        return sum;
        }
    }
