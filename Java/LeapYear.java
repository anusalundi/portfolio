public class Main {
    public static void main(String[] args) {
        int month = 2;
        int daysInMonth;
        int year = 2024;

        switch (month) {
            case 4: case 6: case 9: case 11:
                daysInMonth = 30;
                break;
            case 1: case 3: case 5: case 7: case 8: case 10: case 12:
                daysInMonth = 31;
                break;
            case 2:
                daysInMonth = 28;
                if(isLeapYear(year)){
                    daysInMonth = 29;
                }
                break;
            default:
                daysInMonth = -1;
                System.out.println("Invalid month");
        }
        System.out.println("There are " + daysInMonth + " days in month");
    }
    public static boolean isLeapYear(int year) {
        return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
    }
}
