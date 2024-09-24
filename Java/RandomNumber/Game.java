public class Game {
    private int randomNumber;

    // Set random number manually
    public void setRandomNumber(int randomNumber) {
        this.randomNumber = randomNumber;
    }

    // Method to guess the number
    public int takeAGuess(int guess) {
        if (guess > randomNumber) {
            return 3; // Too big
        } else if (guess < randomNumber) {
            return 2; // Too small
        } else {
            return 1; // Correct guess
        }
    }
}
