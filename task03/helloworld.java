import java.util.Scanner;

public class helloworld {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        for (int i = 2; i < n; i++) {
            boolean prime = true;
            for (int b = 2; b < i; b++) {
                if (i % b == 0) {
                    prime = false;
                    break;
                }
            }
            if (prime) {
                System.out.println(i);
            }
        }
    }
}
