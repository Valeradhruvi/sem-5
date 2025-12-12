import java.util.*;

public class CostMatrix {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Enter number of VMs:");
        int noOfVm = sc.nextInt();
        System.out.println("Enter number of Tasks:");
        int noOfTask = sc.nextInt();

        int[][] costMatrix = new int[noOfVm][noOfTask];
        int[][] taskMatrix = new int[noOfTask][2];
        int[][] vmMatrix = new int[noOfVm][2];

        System.out.println("Enter the cost matrix:");
        for (int i = 0; i < noOfVm; i++) {
            for (int j = 0; j < noOfTask; j++) {
                System.out.print("Cost for VM " + (i + 1) + " and Task " + (j + 1) + ": ");
                costMatrix[i][j] = sc.nextInt();
            }
        }

        System.out.println("Enter the task matrix:");
        for (int i = 0; i < noOfTask; i++) {
            System.out.print("Enter Task " + (i + 1) + " details (cpu and memory): ");
            taskMatrix[i][0] = sc.nextInt(); // cpu
            taskMatrix[i][1] = sc.nextInt(); // memory
        }

        System.out.println("Enter the VM matrix:");
        for (int i = 0; i < noOfVm; i++) {
            System.out.print("Enter VM " + (i + 1) + " details (cpu and memory): ");
            vmMatrix[i][0] = sc.nextInt();
            vmMatrix[i][1] = sc.nextInt(); 
        }

        int[] taskAssignment = new int[noOfTask];
        Arrays.fill(taskAssignment, -1);

        for (int i = 0; i < noOfTask; i++) {
            int minCost = Integer.MAX_VALUE;
            int chosenVm = -1;

            for (int j = 0; j < noOfVm; j++) {
                if (taskMatrix[i][0] <= vmMatrix[j][0] && taskMatrix[i][1] <= vmMatrix[j][1]) {
                    if (costMatrix[j][i] < minCost) {
                        minCost = costMatrix[j][i];
                        chosenVm = j;
                    }
                }
            }

            if (chosenVm != -1) {
                taskAssignment[i] = chosenVm;

                vmMatrix[chosenVm][0] -= taskMatrix[i][0]; 
                vmMatrix[chosenVm][1] -= taskMatrix[i][1]; 
                System.out.println("Task " + (i + 1) + " assigned to VM " + (chosenVm + 1) + " with cost " + minCost);
            } 
            else {
                System.out.println("Task " + (i + 1) + " cannot be assigned to any VM!");
            }
        }

        System.out.println("\nTask-to-VM Assignment:");
        for (int i = 0; i < noOfTask; i++) {
            if (taskAssignment[i] != -1) {
                System.out.println("Task " + (i + 1) + " -> VM " + (taskAssignment[i] + 1));
            } 
            else {
                System.out.println("Task " + (i + 1) + " -> Not Assigned");
            }
        }
    }
}