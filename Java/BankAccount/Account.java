package bank;

public class Account {
    private String accountNumber;
    private double balance;
    private String Name;
    private String email;
    private String phoneNumber;

    public Account(String accountNumber, double balance, String name, String email, String phoneNumber) {
        this.accountNumber = accountNumber;
        this.balance = balance;
        Name = name;
        this.email = email;
        this.phoneNumber = phoneNumber;
        System.out.println("Correct constructor");
    }
    public Account() {
        this("000000000", 0, "default name", "default email", "default phoneNumber");
        System.out.println("Empty constructor");
    }

    public Account(String accountNumber, double balance, String name) {
        this(accountNumber, balance, name, "email missing", "phoneNumber missing");
        System.out.println("Partly empty constructor");
    }

    public void deposit (double amount) {
        this.balance += amount;
        System.out.println("Deposited " + amount + " and new account balance is " + balance);
    }

    public void withdraw (double amount) {
        if(balance >= amount) {
            this.balance -= amount;
          
