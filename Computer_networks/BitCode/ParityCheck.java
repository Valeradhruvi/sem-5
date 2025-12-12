import java.util.Scanner;

public class ParityCheck {
    public static int calculateParity(int[] data, boolean evenParity) {
        int count = 0;
        for (int bit : data) {
            if (bit == 1) {
                count++;
            }
        }

        if (evenParity) {
            return (count % 2 == 0) ? 0 : 1;
        }
        else {
            return (count % 2 == 0) ? 1 : 0;
        }
    }

    public static boolean checkParity(int[] dataWithParity, boolean evenParity) {
        int count = 0;
        for (int bit : dataWithParity) {
            if (bit == 1) {
                count++;
            }
        }

        if (evenParity) {
            return (count % 2 == 0); 
        } else {
            return (count % 2 != 0); 
        }
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter number of bits: ");
        int n = sc.nextInt();
        int[] data = new int[n];

        System.out.print("Enter " + n + " bits (0 or 1): ");
        for (int i = 0; i < n; i++) {
            data[i] = sc.nextInt();
        }

        System.out.print("Use Even Parity? (true/false): ");
        boolean evenParity = sc.nextBoolean();

        int parityBit = calculateParity(data, evenParity);

        StringBuilder codeword = new StringBuilder();
        for (int bit : data) {
            codeword.append(bit);
        }
        codeword.append(parityBit);

        System.out.println("Final ans(Data + Parity Bit): " + codeword);

        sc.close();
    }
}
