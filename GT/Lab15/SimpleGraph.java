import java.util.*;

public class SimpleGraph {
    public static void main(String[] args) {
        Map<String, List<String>> graph = new HashMap<>();
        addEdge(graph, "A", "B");
        addEdge(graph, "A", "C");
        addEdge(graph, "B", "C");
        addEdge(graph, "C", "D");
        addEdge(graph, "D", "E");

        System.out.println("Degrees:");
        for (String v : graph.keySet()) {
            int deg = graph.get(v).size();
            System.out.println(v + " -> " + deg);
        }

        System.out.println("\nDegree Distribution:");
        Map<Integer, Integer> dist = new TreeMap<>();
        for (String v : graph.keySet()) {
            int deg = graph.get(v).size();
            dist.put(deg, dist.getOrDefault(deg, 0) + 1);
        }
        for (int d : dist.keySet()) {
            System.out.println("Degree " + d + ": " + dist.get(d));
        }

        System.out.println("\n(Simple Centrality ~ Degree):");
        for (String v : graph.keySet()) {
            int deg = graph.get(v).size();
            System.out.println(v + " : " + "*".repeat(deg));
        }
    }

    static void addEdge(Map<String, List<String>> g, String u, String v) {
        g.putIfAbsent(u, new ArrayList<>());
        g.putIfAbsent(v, new ArrayList<>());
        g.get(u).add(v);
        g.get(v).add(u);
    }
}
