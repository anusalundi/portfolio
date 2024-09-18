package com.datorium.Datorium.API;

public class MathService {
    public int sum(int a, int b) {
        int result = a + b;
        if (result > 100) {
            return 0;
        }
        return result;
    }
} 
