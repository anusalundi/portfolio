package com.datorium.Datorium.API.Services;

import com.datorium.Datorium.API.DTOs.Cheese;
import com.datorium.Datorium.API.Repo.CheeseRepo;

import java.util.ArrayList;

public class CheeseService {
    private CheeseRepo cheeseRepo;

    public CheeseService() {
        cheeseRepo = new CheeseRepo();
    }

    public int add(Cheese cheese) {
        return cheeseRepo.add(cheese);
    }

    public ArrayList<Cheese> get() {
        return cheeseRepo.get();
    }

    public Cheese update(int cheeseIndex, Cheese updateCheeseDTO) {
        return cheeseRepo.update(cheeseIndex, updateCheeseDTO);
    }
}
