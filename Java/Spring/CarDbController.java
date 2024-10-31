package ee.naidis.springnaide;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class CarDbController {

    @Autowired
    CarRepository carRepository;

    @GetMapping("getcars2") //localhost:8080/getcars
    public List<Car> getCars(){
        return carRepository.findAll();
    }

    @GetMapping("addcar2/{make}/{model}/{year}")
    public List<Car> getCar(@PathVariable String make, @PathVariable String model, @PathVariable int year){
        carRepository.save(new Car(make, model, year));
        return carRepository.findAll();
    }

    @GetMapping("deletecar2/{id}")
    public List<Car> deleteCar(@PathVariable Long id){
        carRepository.deleteById(id);
        return carRepository.findAll();
    }
}
