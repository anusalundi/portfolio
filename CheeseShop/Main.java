import java.util.Scanner;

public class Main {
    private static Scanner scanner = new Scanner(System.in);
    private static CheeseService cheeseService = new CheeseService();
    private static CheeseShop cheeseShop = new CheeseShop(cheeseService);
    private static Customer customer = new Customer(100); 

    public static void main(String[] args) {
        while (true) {
            System.out.println("Press 1 to add a cheese");
            System.out.println("Press 2 to print all available cheeses");
            System.out.println("Press 3 to add cheese to cart");
            System.out.println("Press 4 to remove cheese from cart");
            System.out.println("Press 5 to view cart");
            System.out.println("Press 6 to checkout and buy cheeses");
            System.out.println("Press 7 to view owned cheeses");
            System.out.println("Press 8 to view customer money");
            System.out.println("Press 9 to exit");

            int action = scanner.nextInt();

            switch (action) {
                case 1:
                    addCheese();
                    break;
                case 2:
                    printCheeses();
                    break;
                case 3:
                    addCheeseToCart();
                    break;
                case 4:
                    removeCheeseFromCart();
                    break;
                case 5:
                    viewCart();
                    break;
                case 6:
                    checkout();
                    break;
                case 7:
                    viewOwnedCheeses();
                    break;
                case 8:
                    viewCustomerMoney();
                    break;
                case 9:
                    System.out.println("Thank you and bye!");
                    return;
                default:
                    System.out.println("Invalid option. Try again.");
            }
        }
    }

    public static void addCheese() {
        System.out.println("Provide a cheese id:");
        int id = scanner.nextInt();
        System.out.println("Provide a cheese name:");
        String name = scanner.next();
        System.out.println("Provide a cheese cost:");
        int cost = scanner.nextInt();
        Cheese cheese = new Cheese(id, name, cost);
        cheeseService.addCheese(cheese);
    }

    public static void printCheeses() {
        System.out.println("Available cheeses in the store:");
        for (Cheese cheese : cheeseService.getCheeses()) {
            System.out.println(cheese.getId() + " " + cheese.getName() + " " + cheese.getCost());
        }
    }

    public static void addCheeseToCart() {
        System.out.println("Provide a cheese id to add to cart:");
        int id = scanner.nextInt();
        cheeseShop.addCheeseToCart(id);
    }

    public static void removeCheeseFromCart() {
        System.out.println("Provide a cheese id to remove from cart:");
        int id = scanner.nextInt();
        cheeseShop.removeCheeseFromCart(id);
    }

    public static void viewCart() {
        System.out.println("Cheeses in the cart:");
        for (Cheese cheese : cheeseShop.getCartItems()) {
            System.out.println(cheese.getId() + " " + cheese.getName() + " " + cheese.getCost());
        }
    }

    public static void checkout() {
        customer.buyCheese(cheeseShop);
    }

    public static void viewOwnedCheeses() {
        System.out.println("Customer's owned cheeses:");
        for (Cheese cheese : customer.getOwnedCheeses()) {
            System.out.println(cheese.getId() + " " + cheese.getName() + " " + cheese.getCost());
        }
    }

    public static void viewCustomerMoney() {
        System.out.println("Customer's money: " + customer.getMoney());
    }
}
