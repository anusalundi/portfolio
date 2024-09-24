import org.junit.jupiter.api.Test;
import org.springframework.util.Assert;

public class GameTest {

    @Test
    void testGuessTooBig() {
        // Arrange
        var game = new Game();
        game.setRandomNumber(5);

        // Act
        var response = game.takeAGuess(20);

        // Assert
        Assert.isTrue(response == 3, "The guess is too big, expected response is 3");
    }

    @Test
    void testGuessTooSmall() {
        // Arrange
        var game = new Game();
        game.setRandomNumber(10);

        // Act
        var response = game.takeAGuess(3);

        // Assert
        Assert.isTrue(response == 2, "The guess is too small, expected response is 2");
    }

    @Test
    void testGuessCorrect() {
        // Arrange
        var game = new Game();
        game.setRandomNumber(7);

        // Act
        var response = game.takeAGuess(7);

        // Assert
        Assert.isTrue(response == 1, "The guess is correct, expected response is 1");
    }
}
