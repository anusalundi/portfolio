package linkedList;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.ListIterator;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        LinkedList<String> placesToVisit = new LinkedList<>();

        addInOrder(placesToVisit, "Berlin");
        addInOrder(placesToVisit,"London");
        addInOrder(placesToVisit,"New York");
        addInOrder(placesToVisit,"Paris");
        addInOrder(placesToVisit,"Amsterdam");
        addInOrder(placesToVisit,"Rome");

        printList(placesToVisit);

        placesToVisit.add("Tallinn");
        printList(placesToVisit);

        placesToVisit.remove(1);
        printList(placesToVisit);

        visit(placesToVisit);

    }

    private static void visit(LinkedList<String> cities) {
        Scanner scanner = new Scanner(System.in);
        boolean quit = false;
        ListIterator<String> listIterator = cities.listIterator();
        boolean goingForward = true;
        
        printMenu();
        if(cities.isEmpty()){
            System.out.println(" There are no cities");
            return;
        }
        System.out.println("We are currently in city: " + listIterator.next());
        while (!quit) {
            System.out.println("Enter the choice:");
            int action = scanner.nextInt();
            scanner.nextLine();

            switch (action) {
                case 0:
                    System.out.println("Trip is over");
                    quit = true;
                    break;
                case 1:
                    if(!goingForward) {
                        if(listIterator.hasNext()) {
                            listIterator.next();
                        }
                    }
                    goingForward = true;
                    if(listIterator.hasNext()) {
                        System.out.println("We are currently in city: " + listIterator.next());
                    } else {
                        System.out.println("We are at the end of the list");
                        goingForward = false;
                    }
                    break;
                case 2:
                    if(goingForward) {
                        if(listIterator.hasPrevious()){
                            listIterator.previous();
                        }
                    }
                    goingForward = false;
                    if(listIterator.hasPrevious()) {
                        System.out.println("We are currently in city: " + listIterator.previous());
                    } else {
                        System.out.println("We are at the beginning of the list");
                        goingForward = true;
                    }
                    break;
                case 3:
                    printMenu();
                    break;
            }
        }
    }

    private static void printMenu() {
        System.out.println("""
                Choises:
                0 - Quit
                1 - Go to the next city
                2 - Go to the previous city
                3 - Print menu
                """);
    }

    private static void printList(LinkedList<String> linkedList) {
        Iterator<String> i = linkedList.iterator();
        while (i.hasNext()) {
            System.out.println("Currently in city: " + i.next());
        }
        System.out.println("*******************");
    }

    private static boolean addInOrder(LinkedList<String> linkedList, String newCity) {
        ListIterator<String> listIterator = linkedList.listIterator();
        while (listIterator.hasNext()) {
            int comparison = listIterator.next().compareTo(newCity);
            if (comparison == 0) {
                System.out.println(newCity + " is already in list");
            } else if (comparison > 0) {
                listIterator.previous();
                listIterator.add(newCity);
                return true;
            } else if (comparison < 0) {
            }
        }
        listIterator.add(newCity);
        return true;
    }
}
