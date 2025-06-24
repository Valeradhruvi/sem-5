import java.util.Scanner;

public class BinarySearch {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Enter the size of array: ");
        int n = sc.nextInt();

        int[] arr = new int[n];
        for(int i=0;i<arr.length;i++){
            System.out.println("Enter element at "+i+" index: ");
            arr[i] = sc.nextInt();
        }

        System.out.println("Enter Element to search: ");
        int element = sc.nextInt();

        int mid , first = 0 , last = arr.length-1;
        boolean isFound = false;
        while (last>=first) {
            mid = (first+last)/2;
            
            if(element<arr[mid]){
                last = mid-1;
            }
            else if(element == arr[mid]){
                System.out.println("Element got at "+mid);
                isFound = true;
                break;
            }
            else{
               first = mid+1;
            }
        }

        if(!isFound){
            System.out.println("Element doesn't exist");
        }
    }
}
