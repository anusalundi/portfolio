package inheritance;

public class Dog extends Animal {

    private int eyes;
    private int legs;
    private int tail;
    private int teeth;
    private String coat;

    public Dog(String name, int size, int weight, int eyes, int legs, int tail, int teeth, String coat) {
        super(name, 1, 1, size, weight);
        this.eyes = eyes;
        this.legs = legs;
        this.tail = tail;
        this.teeth = teeth;
        this.coat = coat;
    }

    public void run(){
        System.out.println(getName() + "Dog.run()");
        move(10);
    }

    public void walk(){
        System.out.println(getName() + "Dog.walk()");
        move(5);
    }

    @Override
    public void eat() {
        System.out.println(getName() + "Dog.eat()");
        chew();
        super.eat();
    }

    private void chew() {
        System.out.println(getName() + "Dog.chew()");
    }

    @Override
    public void move(int speed) {
        System.out.println(getName() + "Dog.move() kiirusega: " + speed);
        moveLegs(speed);
        super.move(speed);
    }

    private void moveLegs(int speed) {
        System.out.println("Dog.moveLegs() kiirusega: " + speed);
    }
}
