package com.datorium.Datorium.API.Repo;

import com.datorium.Datorium.API.DTOs.Cheese;

import java.util.ArrayList;

public class CheeseRepo {

    private ArrayList<Cheese> cheeses = new ArrayList<>();

    public int add(Cheese cheese) {
        cheeses.add(cheese);
        return cheeses.size();
    }

    public ArrayList<Cheese> get() {
        return cheeses;
    }

    public Cheese update(int cheeseIndex, Cheese updateCheeseDTO) {
        var cheese = cheeses.get(cheeseIndex);
        cheese.name = updateCheeseDTO.name;
        cheese.price = updateCheeseDTO.price;
        return cheese;
    }
}
