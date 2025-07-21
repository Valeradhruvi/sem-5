package Lab4;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.Stack;

public class FriendCircleProblem {
    public static void main(String[] args) {
        int[][] matrix = {
            {1,1,0,0},
            {1,1,0,0},
            {0,0,1,1},
            {0,0,1,1}
        };

        List<List<Integer>> list = new ArrayList<>();
        for(int[] i : matrix){
            List<Integer> innerOne = new ArrayList<>();
            for(int ele : i){
                innerOne.add(ele);
            }

            list.add(innerOne);
        }

        Set<Integer> encountered = new HashSet<>();
        int counter = 0;
        for(int i=0;i<list.size();i++){
            // for(int j=0;j<list.get(i).size();j++){
                if(!encountered.contains(i)){
                    // encountered.add(j);
                    dfsSolution(list, i , encountered);
                    counter++;
                }
            // }
        }

       System.out.println(counter);
    }

    public static List<Integer> dfsSolution(List<List<Integer>> adj , int start , Set<Integer> visited){
        List<Integer> dfs = new ArrayList<>();
        // Set<Integer> visited = new HashSet<>();

        Stack<Integer> stack = new Stack<>();

        stack.push(start);
        visited.add(start);

        while (!stack.isEmpty()) {
            int node = stack.pop();
            dfs.add(node);
           for(int i=0;i<adj.size();i++){
                if(!visited.contains(i) && adj.get(start).get(i).equals(1)){
                    visited.add(i);
                    stack.push(i);
                }
            }
        }

        return dfs;
    }
}