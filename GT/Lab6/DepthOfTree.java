public class DepthOfTree {
    public static void main(String[] args) {
        Node root = new Node(1);
        root.left = new Node(2);
        root.right = new Node(2);


        root.left.left = new Node(3);
        root.left.right = new Node(4);
        root.right.left = new Node(4);
        root.right.right = new Node(3);

        // root.left = new Node(9);
        // root.right = new Node(20);

        // root.right.left = new Node(15);
        // root.right.right = new Node(7);

        int result = Node.depth(root);
        System.out.println("--------------");
        System.out.println("Depth of Tree: "+result);
    }    
}

class Node{
    int value;
    Node left;
    Node right;

    Node(int value){
        this.left = null;
        this.right = null;
        this.value = value;
    }

    public static int depth(Node root){
        if(root != null){
            if(root.left == null && root.right == null){
            System.out.println("Leaf Node: "+root.value);
            }
        }

        if(root == null){
            return 0;
        }

        int left = depth(root.left) + 1;
        int right = depth(root.right) + 1;


        return Math.max(left, right);

        String str;
        Character.toLowerCase('A');
    }
}