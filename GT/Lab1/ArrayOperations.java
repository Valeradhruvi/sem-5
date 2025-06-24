import java.util.Scanner;

public class ArrayOperations{
    public static void main(String[] args) {
    
        Scanner sc = new Scanner(System.in);

        int [][] arr1 = new int[2][2];
        int [][] arr2 = new int[2][2];
         
        for(int i=0;i<arr1.length;i++){
            for(int j=0;j<arr1.length;j++){
                System.out.println("Enter element at "+i+" and "+j+" index: ");
                arr1[i][j] = sc.nextInt();
            }
        }

        System.out.println("Matrix 1: ");
         for(int i=0;i<arr1.length;i++){
            for(int j=0;j<arr1.length;j++){
                System.out.print(arr1[i][j]+" ");
            }
            System.out.println();
        }

        for(int i=0;i<arr2.length;i++){
            for(int j=0;j<arr2.length;j++){
                System.out.println("Enter element at "+i+" and "+j+" index: ");
                arr2[i][j] = sc.nextInt();
            }
        }

        System.out.println("----------------------------");
        System.out.println("Matrix 2: ");
         for(int i=0;i<arr2.length;i++){
            for(int j=0;j<arr2.length;j++){
                System.out.print(arr1[i][j]+" ");
            }
            System.out.println();
        }

        // System.out.println("Addition of two matrix: ");
        // for(int i=0;i<2;i++){
        //     for(int j=0;j<2;j++){
        //         System.out.print(arr1[i][j]+arr2[i][j]+" ");
        //     }
        //     System.out.println();
        // }

        // int[][] ans = new int[2][2];
        // System.out.println("Transpose of Matrix 1");
        // for(int i=0;i<2;i++){
        //     for(int j=0;j<2;j++){
        //         ans[i][j] = arr1[j][i];
        //     }
        // }

        // for(int i=0;i<ans.length;i++){
        //     for(int j=0;j<ans.length;j++){
        //         System.out.print(ans[i][j]+" ");
        //     }
        //     System.out.println();
        // }

        int[][] result = new int[2][2];
        for(int i=0;i<2; i++){
            for(int j=0;j<2; j++){
                for(int k=0; k<2; k++){
                    result[i][j] += arr1[i][k] * arr2[k][j];
                }
            }
            System.out.println();
        }


        System.out.println("Multiplication of two matrix: ");
        for(int i=0;i<result.length;i++){
            for(int j=0;j<result.length;j++){
                System.out.print(result[i][j]+" ");
            }
            System.out.println();
        }
    }
}