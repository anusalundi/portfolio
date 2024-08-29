package com.datorium.Datorium.API.Controllers;

import com.datorium.Datorium.API.DTOs.UpdateCheeseDTO;
import com.datorium.Datorium.API.DTOs.Cheese;
import com.datorium.Datorium.API.Services.CheeseService;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@RestController
@RequestMapping("/cheese")
public class CheeseController {
    private CheeseService cheeseService;

    public CheeseController() {
        cheeseService = new CheeseService();
    }

    // Add Cheese
    @PostMapping("/add")
    public int add(@RequestBody Cheese cheese) {
        return cheeseService.add(cheese);
    }

    // Get All Cheeses
    @GetMapping("/get")
    public ArrayList<Cheese> get() {
        return cheeseService.get();
    }

    // Update Cheese
    @PostMapping("/update")
    public Cheese update(@RequestBody UpdateCheeseDTO updateCheeseDTO) {
        return cheeseService.update(updateCheeseDTO.cheeseIndex, updateCheeseDTO.cheese);
    }
}
