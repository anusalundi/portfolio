package encapsulation;

public class EnchangedPlayer {

    private String name;
    private int hitPoints = 50;
    private String weapon;

    public EnchangedPlayer(String name, int health, String weapon) {
        this.name = name;
        if(health>0 && health<=100){
            this.hitPoints = health;
        }
        this.hitPoints = health;
        this.weapon = weapon;
    }

    public void loseHealth(int damage) {
        this.hitPoints -= damage;
        if(this.hitPoints <= 0) {
            System.out.println("You lost");
        }
    }

    public int getHealth() {
        return hitPoints;
    }
}
