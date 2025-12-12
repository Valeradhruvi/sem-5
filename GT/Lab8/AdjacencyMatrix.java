import java.util.ArrayList;
import java.util.List;

public class AdjacencyMatrix {
    public static void main(String[] args) {
        int[][] mat = {
            {0,1},
            {1,2},
            {3,0}
        };

        int [][] result = new int[4][4];
        List<List<Integer>> ans = new ArrayList<>();

        for(int i=0;i<=8;i++){
            ans.add(new ArrayList<>());

        }

        for(int i=0;i<mat.length;i++){
            result[mat[i][0]][mat[i][1]] = 1;
            result[mat[i][1]][mat[i][0]] = 1;

            // ans.get(mat[i][0]).add(mat[i][1]);
            // ans.get(mat[i][1]).add(mat[i][0]);
        }

        int i=0;
        
        System.out.println("Adjacency Matrix: ");
        for(int j=0;j<result.length;j++){
            for(int k=0;k<result.length;k++){
                System.out.print(result[j][k]+" ");
            }
            System.out.println();
        }

        // for(List<Integer> list : ans){
        //    if(list.isEmpty()){
        //     i++;
        //     continue;
        //    }
        //    System.out.print(i+" -> ");
        //    System.out.println(list);
        //    i++;
        // }
    }
}
