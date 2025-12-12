import java.util.Scanner;

public class BitStuffing {
    public static String bitStuff(String data) {
        StringBuilder stuffed = new StringBuilder();
        int count = 0;
        for (int i = 0; i < data.length(); i++) {
            char bit = data.charAt(i);
            stuffed.append(bit);
            if (bit == '1') {
                count++;
                if (count == 5) {
                    stuffed.append('0'); 
                    count = 0;
                }
            } else {
                count = 0;
            }
        }
        return stuffed.toString();
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter binary data: ");
        String data = sc.nextLine();

        String stuffedData = bitStuff(data);

        System.out.println("Original Data: " + data);
        System.out.println("Bit Stuffed Data: " + stuffedData);
    }
}