package com.datorium.Datorium.API;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.util.Assert;

import static org.junit.jupiter.api.Assertions.assertEquals;

@SpringBootTest
class DatoriumApiApplicationTests {
    // Hey, I need a method, that gives me my fullname
    @Test
    void WHEN_NameIsOskarsAndSurnameIsKlaumanis_THEN_Result_Oskars_Klaumanis() {
        //Arrange -> prepare data and services
        var userService = new UserService();

        //Act -> Do some action, usually call a method
        var fullname = userService.getFullName("Oskars", "Klaumanis");

        //Assert -> Test whether or not the result is correct
        Assert.isTrue(fullname.equals("Oskars Klaumanis"), "Hey, the name should be with a space inbetween and should contain both name and surname");
    }

    @Test
    public void testSumWithinLimit() {
        MathService mathService = new MathService();
        assertEquals(50, mathService.sum(20, 30));
    }

    @Test
    public void testSumExceedsLimit() {
        MathService mathService = new MathService();
        assertEquals(0, mathService.sum(60, 50));
    }
} 
