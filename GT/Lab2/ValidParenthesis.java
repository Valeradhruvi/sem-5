import java.util.Stack;

public class ValidParenthesis {
    public boolean isValid(String s) {
        Stack<Character> validationStack = new Stack<>();
        char[] character = new char[s.length()];

        for (int i = 0; i < character.length; i++) {
            character[i] = s.charAt(i);
        }

        for (char str : character) {

            if (str == '(' || str == '[' || str == '{') {
                validationStack.push(str);
            } else if (str == ')' || str == ']' || str == '}') {
                if (validationStack.isEmpty()) {
                    return false;
                } else if ((validationStack.peek() == '(' && str == ')')
                        || (validationStack.peek() == '[' && str == ']')
                        || (validationStack.peek() == '{' && str == '}')) {
                    validationStack.pop();
                } else {
                    return false;
                }
            }

        }
         if(!validationStack.isEmpty()){
            return false;
        }
        return true;
    }
}