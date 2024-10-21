package arrayList;

import java.util.ArrayList;

public class GroceryList {

    private ArrayList<String> groceryList = new ArrayList<>();

    public void addItem(String item) {
        groceryList.add(item);
    }

    public void printGroceryList() {
        System.out.println("You have: " + groceryList.size() + " grocery items");
        for (int i = 0; i < groceryList.size(); i++) {
            System.out.println((i+1) + ". " + groceryList.get(i));
        }
    }
    private void modifyItem(int position, String newItem){
        groceryList.set(position, newItem);
        System.out.println("Item nr " + position + " is changed");
    }
    public void modifyItem(String oldItem, String newItem){
        int position = findItem(oldItem);
        if(position >= 0) {
            modifyItem(position, newItem);
        }
    }
    private void removeItem(int position){
        groceryList.remove(position);
        System.out.println("Item nr " + position + " is deleted");
    }
    public void removeItem(String item){
        int position = findItem(item);
        if(position >= 0) {
            removeItem(position);
        }
    }
    private int findItem(String searchItem){
        return groceryList.indexOf(searchItem);
    }
    public boolean onFile(String item) {
        return findItem(item) >= 0;
    }
}
