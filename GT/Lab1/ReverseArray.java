import java.util.Scanner;

public class ReverseArray {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Enter the size of array: ");
        int n = sc.nextInt();

        int[] arr = new int[n];
        for(int i=0;i<arr.length;i++){
            System.out.println("Enter element at "+i+" index: ");
            arr[i] = sc.nextInt();
        }

        for(int i=arr.length-1;i>=0;i--){
            System.out.print(arr[i]);
        }
    }
}
