package interfaces;

public class DeskPhone implements Telephone{

    private int myNumber;
    private boolean isRinging;

    public DeskPhone(int myNumber) {
        this.myNumber = myNumber;
    }

    @Override
    public void powerOn() {
        System.out.println("Desk phone has no power button");
    }

    @Override
    public void dial(int phoneNumber) {
        System.out.println("Phone number is: " + phoneNumber);
    }

    @Override
    public void answer() {
        if (isRinging) {
            System.out.println("Phone is ringing");
            isRinging = false;
        }
    }

    @Override
    public boolean callPhone(int phoneNumber) {
        if (phoneNumber == myNumber) {
            isRinging = true;
            System.out.println("Trrrrrr");
        } else {
            isRinging = false;
        }
        return false;
    }

    @Override
    public boolean isRinging() {
        return isRinging;
    }
}
