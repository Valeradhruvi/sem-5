import java.util.ArrayList;
import java.util.List;

public class LaplacianMatrix {
    public static void main(String[] args) {
        int[][] mat = {
            {0,1},
            {1,2},
            {3,0}
        };

        int [][] adjacent = new int[4][4];
        int [][] degree = new int[4][4];

        // int [][] laplacian = new int[4][4];

        List<List<Integer>> ans = new ArrayList<>();

        for(int i=0;i<=4;i++){
            ans.add(new ArrayList<>());

        }

        System.out.println(mat.length);
        for(int i=0;i<mat.length;i++){
            adjacent[mat[i][0]][mat[i][1]] = 1;
            adjacent[mat[i][1]][mat[i][0]] = 1;


            ans.get(mat[i][0]).add(mat[i][1]);
            ans.get(mat[i][1]).add(mat[i][0]);
        
        }
        

        for(int i=0;i<4;i++){            
            // System.out.println(ans.get(mat[i][0]).size());
            // System.out.println(ans.get(mat[i][1]).size());
            // System.out.println("-------------");
            for(int j=0;j<4;j++){
                if(i==j){
                    degree[i][j] = ans.get(i).size();
                }
                else{
                    degree[i][j] = 0;
                }
            }
        }


        // System.out.println("Degree Matrix: ");
        // for(int j=0;j<degree.length;j++){
        //     for(int k=0;k<degree.length;k++){
        //         System.out.print(degree[j][k]+" ");
        //     }
        //     System.out.println();
        // }


        System.out.println("Laplacian Matrix: ");
        for(int j=0;j<degree.length;j++){
            for(int k=0;k<degree.length;k++){
                System.out.print(degree[j][k] - adjacent[j][k] +" ");
            }
            System.out.println();
        }

        
    }
}
