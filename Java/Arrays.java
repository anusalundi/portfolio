package arrays;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {

        int[] myIntArray = new int[10];
        myIntArray[5] = 50;
        myIntArray[2] = 20;

        int[] newIntArray = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
        System.out.println(newIntArray[0]);
        System.out.println(newIntArray[4]);
        System.out.println(newIntArray[9]);
        System.out.println();

        int[] forIntArray = new int[25];
        for(int i=0; i<forIntArray.length; i++){
            forIntArray[i] = i*10;
        }
        printArray(forIntArray);
        System.out.println("Average: " + getAverage(forIntArray));

        int[] myIntegers = getIntegers(5);
        printArray(myIntegers);
        System.out.println("Average value: " + getAverage(myIntegers));
    }

    private static int[] getIntegers(int amount) {
        Scanner sc = new Scanner(System.in);
        int[] values = new int[amount];

        System.out.println("Enter " + amount + " integers:");
        for(int i=0; i< values.length; i++){
            values[i] = sc.nextInt();
            sc.nextLine();
        }
        return values;
    }

    private static double getAverage(int[] array) {
        double sum = 0;
        for(int i=0; i<array.length; i++){
            sum += array[i];
        }
        return sum/array.length;
    }

    private static void printArray(int[] array) {
        for(int i=0; i<array.length; i++){
            System.out.println("Element " + i + ", value: " + array[i]);
        }
    }
}
