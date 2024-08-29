import java.util.ArrayList;

public class Customer {
    private int money;
    private ArrayList<Cheese> ownedCheeses = new ArrayList<>();

    public Customer(int money) {
        this.money = money;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }

    public ArrayList<Cheese> getOwnedCheeses() {
        return ownedCheeses;
    }

    public void buyCheese(CheeseShop cheeseShop) {
        int totalCost = cheeseShop.checkout();
        if (totalCost <= money) {
            money -= totalCost;
            ownedCheeses.addAll(cheeseShop.getCartItems());
            cheeseShop.getCartItems().clear();
            System.out.println("Purchase successful!");
        } else {
            System.out.println("Not enough money!");
        }
    }
}
