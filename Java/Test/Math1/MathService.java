package com.datorium.Datorium.API;

public class MathService {

    public int sum(int number1, int number2) {
        int result = number1 + number2;
        if (result > 100) {
            return 0;
        }
        return result;
    }
}
