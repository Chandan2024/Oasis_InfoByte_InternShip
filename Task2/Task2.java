import java.util.*;

class Task2 {
    private static final Scanner z = new Scanner(System.in);
    private static final Random r = new Random();

    public static int getUserInput() {
        while (true) {
            try {
                return z.nextInt();
            } catch (InputMismatchException e) {
                System.out.println("Please enter only number.");
                z.next(); 
            }
        }
    }

    public static void L(int rnum, int attempt,int end) {
        int count = 0;
        String state="a";
        System.out.println("Attempt Allowed: " + attempt + "\nLimit: 1-"+end + "\n--------------------\n");

        while (count < attempt) {
            System.out.print("Enter "+state+" number:");
            int n = getUserInput();
            count++;

            if (n == rnum) {
                int score = ((attempt - count) * 2) + 2;
                System.out.println("\n-----------------------------------\n| Attempts Took: " + count + " | Score: "
                        + score + "/" + attempt * 2 + " |\n-----------------------------------");
                return;
            } else if (n > rnum) {
               state="Lower";
            } else {
                state="Higher";
            }
        }

        System.out.println("Bhag BSDK");
    }

    public static void main(String args[]) {
        int rnum, attempt,end;
        System.out.println("\n-------------------------\nWelcome to Number Jigsaw\n-------------------------");
        System.out.println("Select Level\n1.Easy\n2.Medium\n3.Hard ");
        int lvl = z.nextInt();

        while (lvl < 1 || lvl > 3) {
            System.out.println("Please Select a Valid Option: ");
            lvl = z.nextInt();
        }

        System.out.println("--------------------\nLet's Begin !");

        switch (lvl) {
            case 1:
                rnum = r.nextInt(10) + 1;
                attempt = 10;
                System.out.println("Level: Easy");
                L(rnum, attempt,10);
                break;
            case 2:
                rnum = r.nextInt(50) + 1;
                attempt = 10;
                System.out.println("Level: Easy");
                L(rnum, attempt,50);
                break;
            case 3:
                rnum = r.nextInt(100) + 1;
                attempt = 10;
                System.out.println("Level: Easy");
                L(rnum, attempt,100);
                break;
        }

        z.close();
    }
}
