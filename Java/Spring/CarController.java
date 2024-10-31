package ee.naidis.springnaide;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
public class CarController {

    List<Car> cars = new ArrayList<>(
            List.of(
                    new Car("Ford", "Mondeo", 2019),
                    new Car("Audi", "A4", 2007),
                    new Car("BMW", "X5", 2015)
            )
    );
    @GetMapping("getcars") //localhost:8080/getcars
    public List<Car> getCars(){
        return cars;
    }

    @GetMapping("addcar/{make}/{model}/{year}")
    public List<Car> getCar(@PathVariable String make, @PathVariable String model, @PathVariable int year){
        cars.add(new Car(make, model, year));
        return cars;
    }

    @GetMapping("deletecar/{index}")
    public List<Car> deleteCar(@PathVariable int index){
        cars.remove(index);
        return cars;
    }
}
