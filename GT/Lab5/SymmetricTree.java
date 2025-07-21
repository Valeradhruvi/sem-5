// package Lab5;

import java.util.LinkedList;
import java.util.Queue;

public class SymmetricTree {
    public static void main(String[] args) {
        Tree root = new Tree(1);

        root.left = new Tree(2);
        root.right = new Tree(2);


        root.left.left = new Tree(3);
        root.left.right = new Tree(4);
        root.right.left = new Tree(4);
        root.right.right = new Tree(3);

        // Tree.preOrder(root);
        
        boolean ans = Tree.checkSymmetry(root);
        System.out.println(ans);
    }
}

class Tree{
    Tree left;
    Tree right;
    int value;

    Tree(){
        this.left = null;
        this.right = null;
    }
    Tree(int value){
        this.left = null;
        this.right = null;
        this.value = value;
    }

    public static void preOrder(Tree root){
        if(root == null){
            return;
        }

        System.out.print(root.value+" ");
        preOrder(root.left);
        preOrder(root.right);
    }


    public static boolean checkSymmetry(Tree root){
        if(root == null){
            return true;
        }
        

        Queue<Tree> queue = new LinkedList<>();
        queue.add(root.left);
        queue.add(root.right);

        while (!queue.isEmpty()) {
            Tree t1 = queue.poll();
            Tree t2 = queue.poll();

            if(t1 == null && t2 == null){
                continue;
            }
            if(t1 == null || t2 == null){
                return false;
            }

            if(t1.value != t2.value){
                return false;
            }

            queue.add(t1.left);
            queue.add(t2.right);

            queue.add(t1.right);
            queue.add(t2.left);

            
        }

        return true;
    }
}