package interfaces;

public class Main {

    public static void main(String[] args) {
       Telephone joePhone;
       joePhone = new DeskPhone(555666);
       joePhone.powerOn();
       joePhone.callPhone(111222);
       joePhone.answer();
       joePhone.dial(123456);

        System.out.println();

        joePhone = new MobilePhone(666999);
        joePhone.powerOn();
        joePhone.callPhone(111223);
        joePhone.answer();
        joePhone.dial(123457);
    }
}
