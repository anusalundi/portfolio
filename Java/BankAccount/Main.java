import bank.Account;

public class Main {
    public static void main(String[] args) {

        Account account = new Account();

        System.out.println(account.getName());
        System.out.println(account.getPhoneNumber());

        account.setBalance(50);
        account.setAccountNumber("EE1123456789");
        account.setName("Juku");
        account.setPhoneNumber("123456");

        account.deposit(40);
        account.withdraw(100);
        account.withdraw(80);

        Account newAccount = new Account("EE23356982568", 50, "Juhan", "juhan@mail.ee", "6547895");
        System.out.println(newAccount.getName());
        System.out.println(newAccount.getEmail());
        newAccount.deposit(50);
        System.out.println(newAccount.getPhoneNumber());

        Account account1 = new Account("3245615", 42, "Account");
        System.out.println(account1.getEmail());
        System.out.println(account1.getPhoneNumber());
        System.out.println(account1.getName());
    }
}
