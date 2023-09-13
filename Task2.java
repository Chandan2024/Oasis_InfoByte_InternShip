import java.util.*;

class Task2 {
    private static final Scanner z = new Scanner(System.in);
    private static final Random r = new Random();

    public static void L(int rnum, int attempt, int n, int count) {
        System.out.println("Attempt Allowed: " + attempt + "\nLimit: 1-10" + "\n--------------------");
        System.out.print("\nEnter a number:");
        n = z.nextInt();
        count++;
        while (n != rnum && count != attempt) {
            if (n > rnum)
                System.out.print("Lower Number:  ");
            else
                System.out.print("Higher Number: ");
            n = z.nextInt();
            count++;
        }
        if (n == rnum) {
            int score = ((attempt - count) * 2) + 2;
            System.out.println("\n-----------------------------------\n| Attempts Took: " + count + " | Score: "
                    + score + "/" + attempt * 2 + " |\n-----------------------------------");
        } else {
            int score = ((attempt - count) * 2) + 2;
            System.out.println("\n-----------------------------------\n| Attempts Took: " + count + " | Score: "
                    + score + "/" + attempt * 2 + " |\n-----------------------------------");
        }
    }

    public static void main(String args[]) {
        int rnum, attempt, n = 0, count = 0;
        System.out.println("\n-------------------------\nWelcome to Number Jigsaw\n-------------------------");
        System.out.println("Select Level\n1.Easy\n2.Medium\n3.Hard ");
        int lvl = z.nextInt();
        if (lvl > 3 || lvl == 0) {
            while (lvl > 3 || lvl == 0) {
                System.out.println("Please Select Valid Option");
                lvl = z.nextInt();
            }
        }
        System.out.println("--------------------\nLet's Begin !");

        if (lvl == 1) {
            rnum = r.nextInt(10) + 1;
            attempt = 10;
            System.out.println("Level: Easy");
            L(rnum, attempt, n, count);
        }
        if (lvl == 2) {
            rnum = r.nextInt(50) + 1;
            attempt = 10;
            System.out.println("Level: Medium");
            L(rnum, attempt, n, count);
        }
        if (lvl == 3) {
            rnum = r.nextInt(100) + 1;
            attempt = 10;
            System.out.println("Level: Hard");
            L(rnum, attempt, n, count);
        }
        z.close();
    }
}