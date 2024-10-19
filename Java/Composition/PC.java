package composition;

public class PC {

    private Case theCase;
    private Monitor monitor;
    private Motherboard motherboard;

    public PC(Case theCase, Monitor monitor, Motherboard motherboard) {
        this.theCase = theCase;
        this.monitor = monitor;
        this.motherboard = motherboard;
    }

    public void powerUp(){
        this.theCase.pressPowerButton();
        drawLogo();
        this.motherboard.loadProgram("Windows");
    }

    private void drawLogo() {
        System.out.println("Great graphic");
        this.monitor.drawPixelAt(960, 640, "blue");
    }

    public Case getTheCase() {
        return theCase;
    }

    public Monitor getMonitor() {
        return monitor;
    }

    public Motherboard getMotherboard() {
        return motherboard;
    }
}
