import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class HallsCondition {
    public static void main(String[] args) {
        int numX = 3, numY = 3;
        int[][] edges = {
            {0, 0}, {0, 1}, {1, 1}, {1, 2}, {2, 2}
        };
        boolean ans = hallsCondition(numX, numY, edges);
        System.out.println(ans); // should print true for this example
    }

    public static List<List<Integer>> getAdjacent(int[][] mat, int x, int y) {
        List<List<Integer>> ans = new ArrayList<>();
        for (int i = 0; i < x + y; i++) ans.add(new ArrayList<>());

        for (int[] edge : mat) {
            int u = edge[0];      // in X
            int v = edge[1] + x;  // shift Y
            ans.get(u).add(v);    // X -> Y
            ans.get(v).add(u);    // Y -> X (for undirected)
        }
        return ans;
    }

    public static void generateSubsets(List<Integer> elements, int index, List<Integer> current, List<List<Integer>> result) {
        if (index == elements.size()) {
            result.add(new ArrayList<>(current));
            return;
        }
        generateSubsets(elements, index + 1, current, result);
        current.add(elements.get(index));
        generateSubsets(elements, index + 1, current, result);
        current.remove(current.size() - 1);
    }

    public static boolean hallsCondition(int x, int y, int[][] edges) {
        List<List<Integer>> adj = getAdjacent(edges, x, y);

        List<Integer> allX = new ArrayList<>();
        for (int i = 0; i < x; i++) allX.add(i);

        List<List<Integer>> subsets = new ArrayList<>();
        generateSubsets(allX, 0, new ArrayList<>(), subsets);

        for (List<Integer> subsetX : subsets) {
            if (subsetX.isEmpty()) continue;

            Set<Integer> neighborhood = new HashSet<>();
            for (int u : subsetX) {
                for (int v : adj.get(u)) {
                    if (v >= x) {
                        neighborhood.add(v - x); // convert back to Y index
                    }
                }
            }

            if (neighborhood.size() < subsetX.size()) {
                return false; // Hall's condition violated
            }
        }
        return true;
    }
}
