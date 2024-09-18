package com.datorium.Datorium.API;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.util.Assert;

@SpringBootTest
class DatoriumApiApplicationTests {
    // Hey, I need a method, that gives me my fullname
    @Test
    void WHEN_NameIsOskarsAndSurnameIsKlaumanis_THEN_Result_Oskars_Klaumanis() {
        //Arrange -> prepare data and services
        var userService = new UserService();

        //Act -> Do some action, usually call a method
        var fullname = userService.getFullName("Oskars", "Klaumanis");

        //Assert -> Test weather or not the result is correct
        Assert.isTrue(fullname.equals("Oskars Klaumanis"), "Hey, the name should be with a space inbetween and should contain both name and surname");
    }

    @Test
    void WHEN_Number1Is85AndNumber2Is53_THEN_Result_0() {
        var mathService = new MathService();
        var numbersSum = mathService.sum(85, 53);
        Assert.isTrue(numbersSum == 0, "Hey, the sum should be 0 because 85 + 53 exceeds 100");
    }

    @Test
    void WHEN_Number1Is40AndNumber2Is50_THEN_Result_90() {
        var mathService = new MathService();
        var numbersSum = mathService.sum(40, 50);
        Assert.isTrue(numbersSum == 90, "The sum should be 90 because 40 + 50 does not exceed 100");
    }
}
