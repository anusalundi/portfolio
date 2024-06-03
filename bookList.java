import java.util.ArrayList;
import java.util.Scanner;

public class Main {
    private static ArrayList<Book> bookList = new ArrayList<>();

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String userChoice = "";

        while (!userChoice.equalsIgnoreCase("no")) {
            System.out.println("Do you want to add a book? (yes/no)");
            userChoice = scanner.nextLine();

            if (userChoice.equalsIgnoreCase("yes")) {
                addBook(scanner);
            }
        }

        displayBooks();
        scanner.close();
    }

    private static void addBook(Scanner scanner) {
        System.out.println("Enter the title: ");
        String title = scanner.nextLine();
        System.out.println("Enter the author: ");
        String author = scanner.nextLine();

        Book newBook = new Book(title, author);
        bookList.add(newBook);

        System.out.println("Added: " + title + " by " + author);
    }

    private static void displayBooks() {
        if (bookList.isEmpty()) {
            System.out.println("Books list is empty.");
        } else {
            System.out.println("Books list:");
            for (Book book : bookList) {
                System.out.println("Title: " + book.getTitle() + ", Author: " + book.getAuthor());
            }
        }
    }
}
