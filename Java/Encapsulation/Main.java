package encapsulation;

public class Main {

    public static void main(String[] args) {

        Player player = new Player();
        player.name = "John";
        player.health = 20;
        player.weapon = "Cudgel";

        int damage = 10;
        player.loseHealth(damage);
        System.out.println("Lives: " + player.healthRemaining());

        damage = 11;
        player.health = 100;
        player.loseHealth(damage);
        System.out.println("Lives: " + player.healthRemaining());
        player.weapon = "Sword";
        System.out.println(player.weapon);

        EnchangedPlayer enchangedPlayer = new EnchangedPlayer("George", 200, "Bow");
        System.out.println("Lives: " + enchangedPlayer.getHealth());

        damage = 21;
        enchangedPlayer.loseHealth(damage);
        System.out.println("Lives: " + enchangedPlayer.getHealth());
    }
}
