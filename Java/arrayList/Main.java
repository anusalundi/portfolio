package arrayList;

import java.util.Scanner;

public class Main {
    private static Scanner scanner = new Scanner(System.in);
    private static GroceryList groceryList = new GroceryList();

    public static void main(String[] args) {

    boolean quit = false;

    printInstructions();

    while (!quit) {
        System.out.print("Enter your choice: ");
        int choice = scanner.nextInt();
        scanner.nextLine();
        switch (choice) {
            case 0:
               printInstructions();
               break;
           case 1:
                groceryList.printGroceryList();
                break;
            case 2:
                addItem();
                break;
            case 3:
                modifyItem();
                break;
            case 4:
                removeItem();
                break;
            case 5:
                searchItem();
                break;
            case 6:
                quit = true;
                break;
        }
    }
    }

    private static void searchItem() {
        System.out.print("Enter item for search: ");
        String item = scanner.nextLine();
        if(!groceryList.onFile(item)){
            System.out.println(item + " not found");
        } else {
            System.out.println(item + " found");
        }
    }

    private static void removeItem() {
        System.out.println("Enter item for remove: ");
        String item = scanner.nextLine();
        groceryList.removeItem(item);
    }

    private static void modifyItem() {
        System.out.print("Enter item name for modify: ");
        String oldItem = scanner.nextLine();
        System.out.println("Enter new item name: ");
        String newItem = scanner.nextLine();
        groceryList.modifyItem(oldItem, newItem);
    }

    private static void addItem() {
        System.out.print("Enter item name: ");
        groceryList.addItem(scanner.nextLine());
    }

    private static void printInstructions() {
        System.out.println("""
                Press:
                   0 - Show options
                   1 - Display the products in the list
                   2 - Add product
                   3 - Change the product
                   4 - Delete the product
                   5 - Search for a product
                   6 - Exit
                """);
    }
}
