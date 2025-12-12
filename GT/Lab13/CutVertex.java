package Lab13;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class CutVertex {

    public static List<List<Integer>> getAdjacent(int[][] mat,int max) {
        List<List<Integer>> ans = new ArrayList<>();

        for (int i = 0; i < max+1; i++) {
            ans.add(new ArrayList<>());

        }
        for (int i = 0; i < mat.length; i++) {
            ans.get(mat[i][0]).add(mat[i][1]);
            ans.get(mat[i][1]).add(mat[i][0]);
        }

        return ans;
    }

    public static void main(String[] args) {
        int[][] graph = {
            {1, 0},
            {0, 2},
            {2, 3},
            {2, 4}
        };

        int max = Integer.MIN_VALUE;

        for (int i = 0; i < graph.length; i++) {
            for (int j = 0; j < graph[i].length; j++) {
                if (graph[i][j] > max) {
                    max = graph[i][j];
                }
            }
        }

        List<List<Integer>> li = getAdjacent(graph,max);
        System.out.println(li);

        for (int i = 0; i < max+1; i++) {
            if(dfs(i, li, max)){
                System.out.println(i +" is cut vertex");
            }
        }
    }

    private static boolean dfs(int node, List<List<Integer>> adj, int max) {
        List<List<Integer>> li = new ArrayList<>(adj);
        li.remove(node);

        boolean visited[] = new boolean[max + 1];
        Arrays.fill(visited, false);
        visited[node] = true;

        for (int i = 0; i < li.size(); i++) {
            for (int j = 0; j < li.get(i).size(); j++) {
                visited[li.get(i).get(j)]=true;
            }
        }

        for(int i =0;i<visited.length;i++){
            if(visited[i]==false){
                return true;
            }
        }

        return false;
    }
}