package inheritance;

public class Main {

    public static void main(String[] args) {
        Animal animal = new Animal("Bear", 1, 1, 10, 20);
        animal.eat();
        animal.move(9);

        Dog dog = new Dog("Puudel", 10, 2, 2, 4, 4, 42, "Karvane");
        System.out.println();
        dog.eat();
        System.out.println();
        dog.move(7);
        System.out.println();
        dog.walk();
        System.out.println();
        dog.run();

        Fish fish = new Fish("Heeringas", 2, 1, 2, 2, 4);
        System.out.println();
        fish.swim(3);
        System.out.println();
        fish.eat();
    }
}
