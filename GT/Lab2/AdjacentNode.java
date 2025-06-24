import java.util.ArrayList;
import java.util.List;

public class AdjacentNode{
    public static void main(String[] args) {
        int[][] mat = {
            {0,1},
            {1,2},
            {8,0}
        };

        List<List<Integer>> ans = new ArrayList<>();

        for(int i=0;i<=8;i++){
            ans.add(new ArrayList<>());

        }
        for(int i=0;i<mat.length;i++){
            ans.get(mat[i][0]).add(mat[i][1]);
            ans.get(mat[i][1]).add(mat[i][0]);
        }

        int i=0;
        for(List<Integer> list : ans){
           if(list.isEmpty()){
            i++;
            continue;
           }
           System.out.print(i+" -> ");
           System.out.println(list);
           i++;
        }
    }
}