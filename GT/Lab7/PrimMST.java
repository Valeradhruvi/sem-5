// package Lab7;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.PriorityQueue;

public class PrimMST {
    public static void main(String[] args) {
        int [][] edgeArray = {
            {0, 1, 10},
            {0, 2, 6},
            {0, 3, 5},
            {1, 3, 15},
            {2, 3, 4}
        };

        int vertices = 4;
        List<List<Integer>> adj = getAdjacent(edgeArray);

        PriorityQueue<Pair> pqueue = new PriorityQueue<>(Comparator.comparingInt(p -> p.weight));

        
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

}

class Pair{
    int node , weight;
    Pair(int node , int weight){
        this.node = node;
        this.weight = weight;
    }
}
