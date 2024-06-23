import java.util.ArrayList;

public class CheeseShop {
    private ArrayList<Cheese> cart = new ArrayList<>();
    private CheeseService cheeseService;

    public CheeseShop(CheeseService cheeseService) {
        this.cheeseService = cheeseService;
    }

    public void addCheeseToCart(int id) {
        Cheese cheese = cheeseService.getCheeseById(id);
        if (cheese != null) {
            cart.add(cheese);
        } else {
            System.out.println("Cheese not available.");
        }
    }

    public void removeCheeseFromCart(int id) {
        cart.removeIf(cheese -> cheese.getId() == id);
    }

    public ArrayList<Cheese> getCartItems() {
        return cart;
    }

    public int checkout() {
        int sum = 0;
        for (Cheese cheese : cart) {
            sum += cheese.getCost();
        }
        return sum;
    }
}
