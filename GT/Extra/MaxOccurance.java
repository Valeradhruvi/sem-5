import java.util.LinkedList;
import java.util.List;
import java.util.Queue;
import java.util.Scanner;
import java.util.Stack;

public class MaxOccurance {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Enter a sentence: ");
        String str = sc.nextLine();
        
        String[] strArray = str.split(" ");
        // for(String i : strArray){
        //     System.out.println(i);
        // }

        Queue<String> stack = new LinkedList<>();
        String element = "";

        for(String i : strArray){
            int[] count = new int[i.length()];
            for(int j=0;j<i.length();j++){
                for(int k=j+1;k<i.length();k++){
                    if(i.charAt(j) == i.charAt(k)){
                        count[j]++;
                        stack.add(i);
                        // element = i;
                        break;
                    }
                }
            }
            // for(int l : count){
            //     System.out.print(l);
            // }
            // System.err.println();
        }

        element = stack.poll();
        System.out.println(element);
    }    
}
