package polymorphism;

class Movie {
    private String name;

    public Movie(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public String plot(){
        return "No content";
    }
}

class Jaws extends Movie {
    public Jaws() {
        super("Jaws");
    }

    @Override
    public String plot() {
        return "Shark eats people";
    }
}

class IndependenceDay extends Movie {
    public IndependenceDay() {
        super("Independence Day");
    }

    @Override
    public String plot() {
        return "Aliens attack Earth";
    }
}

class MazeRunner extends Movie {
    public MazeRunner() {
        super("Maze Runner");
    }

    @Override
    public String plot() {
        return "Teenagers escape from the maze";
    }
}

class Titanic extends Movie {
    public Titanic() {
        super("Titanic");
    }

    @Override
    public String plot() {
        return "The ship shinks";
    }
}

class Forgettable extends Movie {
    public Forgettable() {
        super("Forgettable");
    }
}

public class Main {

    public static void main(String[] args) {

        for(int i = 1; i<11; i++){
            Movie movie = randomMovie();
            System.out.println("Movie #" + i + ": " + movie.getName());
            System.out.println("Content: " + movie.plot());
            System.out.println("*****");
        }


    }

    public  static Movie randomMovie() {
        int randomNumber = (int) (Math.random() * 5 + 1);
        System.out.println("Random number is " + randomNumber);

        switch (randomNumber) {

        case 1:
            return new Jaws();
        case 2:
            return new IndependenceDay();
        case 3:
            return new MazeRunner();
        case 4:
            return new Titanic();
        case 5:
            return new Forgettable();
        default:
            return null;
        }
    }

}
