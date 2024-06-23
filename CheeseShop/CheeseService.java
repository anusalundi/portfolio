import java.util.ArrayList;

public class CheeseService {
    private ArrayList<Cheese> cheeses = new ArrayList<>();

    public ArrayList<Cheese> getCheeses() {
        return cheeses;
    }

    public void addCheese(Cheese cheese) {
        cheeses.add(cheese);
    }

    public void removeCheese(int id) {
        cheeses.removeIf(cheese -> cheese.getId() == id);
    }

    public Cheese getCheeseById(int id) {
        for (Cheese cheese : cheeses) {
            if (cheese.getId() == id) {
                return cheese;
            }
        }
        return null;
    }
}
