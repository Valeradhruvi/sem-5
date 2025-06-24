import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.Stack;

public class DepthFirstSearch{
   public static void main(String[] args) {
        int[][] mat = {
            {0,1},
            {1,2},
            {8,0}
        };
        List<List<Integer>> result = getAdjacent(mat);
        List<Integer> sol = dfsSolution(result, 0);

        System.out.println("DFS: "+sol);
   }
   
   public static List<List<Integer>> getAdjacent(int[][] mat){
                List<List<Integer>> ans = new ArrayList<>();

        for(int i=0;i<=8;i++){
            ans.add(new ArrayList<>());

        }
        for(int i=0;i<mat.length;i++){
            ans.get(mat[i][0]).add(mat[i][1]);
            ans.get(mat[i][1]).add(mat[i][0]);
        }

        return ans;
    }

    public static List<Integer> dfsSolution(List<List<Integer>> adj , int start){
        List<Integer> dfs = new ArrayList<>();
        Set<Integer> visited = new HashSet<>();

        Stack<Integer> stack = new Stack<>();

        stack.push(start);
        visited.add(start);

        while (!stack.isEmpty()) {
            int node = stack.pop();
            dfs.add(node);
           for(int it : adj.get(node)){
                if(!visited.contains(it)){
                    visited.add(it);
                    stack.push(it);
                }
            }

        }

        return dfs;
    }
}