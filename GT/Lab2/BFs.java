import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;
import java.util.Set;

public class BFs {
    
    public static void main(String[] args) {
        int[][] mat = {
            {0,1},
            {1,2},
            {8,0}
        };
        List<List<Integer>> result = getAdjacent(mat);
        List<Integer> sol = bfsSolution(result, 4, 0);

        System.out.println("BFS: "+sol);
        
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

    public static List<Integer> bfsSolution(List<List<Integer>> adj , int verts, int start){
        List<Integer> bfs = new ArrayList<>();
        Set<Integer> visited = new HashSet<>();
        // boolean[] visited = new boolean[adj.size()];

        Queue<Integer> queue = new LinkedList<>();

        queue.add(start);
        visited.add(start);

        while (!queue.isEmpty()) {
            int node = queue.poll();
            bfs.add(node);
            for(int it : adj.get(node)){
                if(!visited.contains(it)){
                    visited.add(it);
                    queue.add(it);
                }
            }
        }
        return bfs;
    }
}
