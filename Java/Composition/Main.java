package composition;

public class Main {

    public static void main(String[] args) {

        Dimensions dimensions = new Dimensions(20, 20, 5);
        Case theCase = new Case("220B", "Dell", "500", dimensions);
        Monitor monitor = new Monitor("XL2411P", "Benq", 24, new Resolution(1920, 1080));
        Motherboard motherboard = new Motherboard("B550", "Asus", 4, 6, "v1.23");

        PC thePC = new PC(theCase, monitor, motherboard);

        thePC.getTheCase().pressPowerButton();
        thePC.getMotherboard().loadProgram("IntelliJ");
        thePC.getMonitor().drawPixelAt(1500, 900, "red");

        System.out.println(thePC.getMonitor().getNativeResolution().getHeight());

        thePC.getMotherboard().loadProgram("IntelliJ");
        thePC.powerUp();

        PC newPC = new PC(new Case("asd", "LG", "500", new Dimensions(1, 2, 3)),
                new Monitor("still", "Samsung", 1, new Resolution(4, 5)),
                new Motherboard("newModel", "Acer", 6, 7, "8"));
    }

}
