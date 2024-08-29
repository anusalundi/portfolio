import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        int[][] grid = new int[3][3];
        Scanner scanner = new Scanner(System.in);
        boolean gameWin = false;
        boolean isTie = false;
        int currentPlayer = 1;

        System.out.println("Welcome to Tic-Tac-Toe!");
        System.out.println("Enter row and column 0, 1 or 2");

        while (!gameWin && !isTie) {
            printGrid(grid);
            int row = -1;
            int col = -1;

            System.out.println("Player " + currentPlayer);
            System.out.print("Enter the row number (0, 1, or 2): ");
            row = scanner.nextInt();
            System.out.print("Enter the column number (0, 1, or 2): ");
            col = scanner.nextInt();

            if (row >= 0 && row < 3 && col >= 0 && col < 3) {
                if (grid[row][col] == 0) {
                    grid[row][col] = currentPlayer;
                } else {
                    System.out.println("Cell already taken. Choose another cell.");
                    continue;
                }
            } else {
                System.out.println("Invalid input. Please enter 0, 1 or 2.");
                continue;
            }

            gameWin = checkWin(grid, row, col, currentPlayer);
            if (gameWin) {
                printGrid(grid);
                System.out.println("Player " + currentPlayer + " won");
                System.out.println("GAME OVER");
            } else if (isBoardFull(grid)) {
                printGrid(grid);
                System.out.println("It's a tie!");
                System.out.println("GAME OVER");
                isTie = true;
            } else {
                if (currentPlayer == 1) {
                    currentPlayer = 2;
                } else {
                    currentPlayer = 1;
                }
            }
        }

        scanner.close();
    }

    public static void printGrid(int[][] grid) {
        for (int i = 0; i < grid.length; i++) {
            int[] row = grid[i];
            for (int j = 0; j < row.length; j++) {
                int cell = row[j];
                if (cell == 0) {
                    System.out.print("* ");
                } else if (cell == 1) {
                    System.out.print("X ");
                } else if (cell == 2) {
                    System.out.print("O ");
                }
            }
            System.out.println();
        }
    }

    public static boolean checkWin(int[][] grid, int row, int col, int player) {
        if (grid[row][0] == player && grid[row][1] == player && grid[row][2] == player) {
            return true;
        }
        if (grid[0][col] == player && grid[1][col] == player && grid[2][col] == player) {
            return true;
        }
        if (row == col && grid[0][0] == player && grid[1][1] == player && grid[2][2] == player) {
            return true;
        }
        if (row + col == 2 && grid[0][2] == player && grid[1][1] == player && grid[2][0] == player) {
            return true;
        }
        return false;
    }

    public static boolean isBoardFull(int[][] grid) {
        for (int i = 0; i < grid.length; i++) {
            int[] row = grid[i];
            for (int j = 0; j < row.length; j++) {
                int cell = row[j];
                if (cell == 0) {
                    return false;
                }
            }
        }
        return true;
    }
}
