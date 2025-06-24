import java.util.ArrayList;
import java.util.List;

public class DfsRecursion {
    public static void main(String[] args) {
        int[][] mat = {
            {0,1},
            {1,2},
            {8,0}
        };
        List<List<Integer>> result = getAdjacent(mat);
        List<Integer> sol = dfs(result);

        System.out.println(sol);
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

    public static void dfsSolution(List<List<Integer>> adj , int s , List<Integer> dfs , boolean[] visited){
        visited[s] = true;
        dfs.add(s);

        for(int it : adj.get(s)){
                if(!(visited[it] == true)){
                    dfsSolution(adj, it, dfs, visited);
                }
            }
    }

    public static List<Integer> dfs(List<List<Integer>> adj){
        boolean[] visited = new boolean[adj.size()];
        List<Integer> dfs = new ArrayList<>();
        dfsSolution(adj, 0, dfs, visited);
        return dfs;
    }
}
