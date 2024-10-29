package interfaces;

public class MobilePhone implements Telephone{

    private int myNumber;
    private boolean isRinging;
    private boolean isOn = false;

    public MobilePhone(int myNumber) {
        this.myNumber = myNumber;
    }

    @Override
    public void powerOn() {
        isOn = true;
        System.out.println("Mobile phone is on");
    }

    @Override
    public void dial(int phoneNumber) {
        if (isOn) {
            System.out.println("Calling " + phoneNumber + " on");
        }
    }

    @Override
    public void answer() {
        if(isOn && isRinging) {
            System.out.println("Answering " + myNumber + " on");
            isRinging = false;
        }
    }

    @Override
    public boolean callPhone(int phoneNumber) {
        if(phoneNumber == myNumber && isOn) {
            isRinging = true;
            System.out.println("Nice voice is on");
        } else {
            isRinging = false;
            System.out.println("Mobilephone is off or wrong number");
        }
        return false;
    }

    @Override
    public boolean isRinging() {
        return isRinging;
    }
}
