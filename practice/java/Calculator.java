import java.awt.BorderLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Stack;

import javax.swing.JApplet;
import javax.swing.JButton;
import javax.swing.JPanel;
import javax.swing.JTextField;


public class Calculator extends JApplet{
	private JTextField textDisplay;
	private JButton button0, 	button1, 	button2, 		button3, 
					button4, 	button5,	button6, 		button7, 
					button8, 	button9, 	buttonPlus,	 	buttonMinus, 
					buttonMult, buttonDiv, 	buttonEnter,	buttonClear, 
					buttonLP,	buttonRP, 	buttonLB, 		buttonRB, 	
					buttonLCB, 	buttonRCB,	buttonSpace,	buttonBkSp;	
	
	public Calculator(){
		textDisplay = new JTextField();
		button0 = new JButton("0");	
		button1 = new JButton("1");
		button2 = new JButton("2");
		button3 = new JButton("3");
		button4 = new JButton("4");
		button5 = new JButton("5");
		button6 = new JButton("6");
		button7 = new JButton("7");
		button8 = new JButton("8");
		button9 = new JButton("9");
		buttonPlus = new JButton("+");
		buttonMinus = new JButton("-");
		buttonMult = new JButton("*");
		buttonDiv = new JButton("/");
		buttonEnter = new JButton("Enter");
		buttonClear = new JButton("Clear");
		buttonLP = new JButton("(");
		buttonRP = new JButton(")");
		buttonLB = new JButton("[");
		buttonRB = new JButton("]");
		buttonLCB = new JButton("{");
		buttonRCB = new JButton("}");
		buttonSpace = new JButton("Space");
		buttonBkSp = new JButton("BkSp");
		
		init();
	}
	
	public void init(){
		JPanel keyPad = new JPanel();
		keyPad.setLayout(new GridLayout(4, 6));
		
		keyPad.add(button9);
		keyPad.add(button8);
		keyPad.add(button7);
		keyPad.add(buttonPlus);
		keyPad.add(buttonLP);
		keyPad.add(buttonRP);
		keyPad.add(button6);
		keyPad.add(button5);
		keyPad.add(button4);
		keyPad.add(buttonMinus);
		keyPad.add(buttonLB);
		keyPad.add(buttonRB);
		keyPad.add(button3);
		keyPad.add(button2);
		keyPad.add(button1);
		keyPad.add(buttonMult);
		keyPad.add(buttonLCB);
		keyPad.add(buttonRCB);
		keyPad.add(button0);
		keyPad.add(buttonEnter);
		keyPad.add(buttonClear);
		keyPad.add(buttonDiv);
		keyPad.add(buttonSpace);
		keyPad.add(buttonBkSp);
		
		// Add the textfield on top, and the keypad below
		getContentPane().add(textDisplay, BorderLayout.NORTH);
		getContentPane().add(keyPad, BorderLayout.CENTER);
		
		//Declare and event listener
		ButtonListener btsListener = new ButtonListener();
		button0.addActionListener(btsListener);
		button1.addActionListener(btsListener);
		button2.addActionListener(btsListener);
		button3.addActionListener(btsListener);
		button4.addActionListener(btsListener);
		button5.addActionListener(btsListener);
		button6.addActionListener(btsListener);
		button7.addActionListener(btsListener);
		button8.addActionListener(btsListener);
		button9.addActionListener(btsListener);
		buttonPlus.addActionListener(btsListener);
		buttonMinus.addActionListener(btsListener);
		buttonMult.addActionListener(btsListener);
		buttonDiv.addActionListener(btsListener);
		buttonEnter.addActionListener(btsListener);
		buttonClear.addActionListener(btsListener);
		buttonLP.addActionListener(btsListener);
		buttonRP.addActionListener(btsListener);
		buttonLB.addActionListener(btsListener);
		buttonRB.addActionListener(btsListener);
		buttonLCB.addActionListener(btsListener);
		buttonRCB.addActionListener(btsListener);
		buttonSpace.addActionListener(btsListener);
		buttonBkSp.addActionListener(btsListener);	
	}
	
	private class ButtonListener implements ActionListener {
		public void actionPerformed(ActionEvent e){
			JButton btn = (JButton) e.getSource();
			String s;
			s = textDisplay.getText();
			if(btn == button0){
				s += "0";
				textDisplay.setText(s);
			}
			else if(btn == button1){
				s += "1";
				textDisplay.setText(s);
			}
			else if(btn == button2){
				s += "2";
				textDisplay.setText(s);
			}
			else if(btn == button3){
				s += "3";
				textDisplay.setText(s);
			}
			else if(btn == button4){
				s += "4";
				textDisplay.setText(s);
			}
			else if(btn == button5){
				s += "5";
				textDisplay.setText(s);
			}
			else if(btn == button6){
				s += "6";
				textDisplay.setText(s);
			}
			else if(btn == button7){
				s += "7";
				textDisplay.setText(s);
			}
			else if(btn == button8){
				s += "8";
				textDisplay.setText(s);
			}
			else if(btn == button9){
				s += "9";
				textDisplay.setText(s);
			}
			else if(btn == buttonPlus){
				s += "+";
				textDisplay.setText(s);
			}
			else if(btn == buttonMinus){
				s += "-";
				textDisplay.setText(s);
			}
			else if(btn == buttonMult){
				s += "*";
				textDisplay.setText(s);
			}
			else if(btn == buttonDiv){
				s += "/";
				textDisplay.setText(s);
			}
			else if(btn == buttonEnter){
				s += (" = " + process(s));
				textDisplay.setText(s);
			}
			else if(btn == buttonClear){
				s = "";
				textDisplay.setText(s);
			}
			else if(btn == buttonLP){
				s += "(";
				textDisplay.setText(s);
			}
			else if(btn == buttonRP){
				s += ")";
				textDisplay.setText(s);
			}
			else if(btn == buttonLB){
				s += "[";
				textDisplay.setText(s);
			}
			else if(btn == buttonRB){
				s += "]";
				textDisplay.setText(s);
			}
			else if(btn == buttonLCB){
				s += "{";
				textDisplay.setText(s);
			}
			else if(btn == buttonRCB){
				s += "}";
				textDisplay.setText(s);
			}
			else if(btn == buttonSpace){
				s += " ";
				textDisplay.setText(s);
			}
			else if(btn == buttonBkSp){
				int x = s.length();
				s = s.substring(0, x-1);
				textDisplay.setText(s);
			}
		}
	}

	static String process(String exp){
		Stack<Integer> operands = new Stack<Integer>();
		Stack<Character> operators = new Stack<Character>();
		Stack<Character> brackets = new Stack<Character>();
		
		String expression = exp;
		Boolean valid = true;
		//System.out.println("Exp: " + expression);
		for(int x = 0; x < expression.length(); x++){
			char c = expression.charAt(x);
			//System.out.println("Deciding placement for: " + c + "   " +"BRACKETS: " + brackets.size());
			if(c == ' '){
				//whitespace do nothing
			}
			else if(isLeftBracket(c)){
				if(c == '['){
					brackets.push(c);
				}
				else if(c == '(' ){
					brackets.push(c);
				}
				else if(c == '{' ){
					brackets.push(c);
				}
			}
			else if(Character.isDigit(c)) {
				String str = ""+c;
				
				boolean b = true;
				while(b == true){	//if char is a number, we must loop through and examine the upcoming character to see if they are also numbers.
					try{
						char test = expression.charAt(x+1);	//look ahead at next character
						if(Character.isDigit(test)){			//if its a digit, parse it to the first char in string format
							str += test;
							x++;
						}
						else{
							b = false;
						}
					}catch(Exception e){
						b = false;
					}
				}

				int i = Integer.parseInt(str);
				operands.push(i);
			}
			else if(isOperator(c)){	//if char is an operator, push it onto operators stack
				//System.out.println("Pushing " + c);
				operators.push(c);
			}
			else if(c == ')'){	//right bracket indicates that computation must be done
				if(!brackets.isEmpty() && !operators.isEmpty()){	//make sure we aren't going to be popping an empty stack
					char op = brackets.pop();
					if(op == '('){
						int num2 = operands.pop();
						int num1 = operands.pop();
						char opr = operators.pop();
						if(opr == '+'){		//if operand is "+" perform addition of the two popped elements and push the result onto the stack
						//	System.out.println("add: " + num1 + " " + num2);
							operands.push(num1 + num2);
						}
						else if(opr == '-'){	//if operand is "-" perform subtraction of the two popped elements and push the result onto the stack
						//	System.out.println("sub: " + num1 + " " + num2);
							operands.push(num1 - num2);
						}
						else if(opr == '/'){	//if operand is "/" perform division of the two popped elements and push the result onto the stack
						//	System.out.println("div: " + num1 + " " + num2);
							operands.push(num1 / num2);
						}
						else if(opr == '*'){ //if operand is "*" perform multiplication of the two popped elements and push the result onto the stack
						//	System.out.println("mult: " + num1 + " " + num2);
							operands.push(num1 * num2);
						}
						else if(opr == '^'){//if operand is "^" perform exponentiation of the two popped elements and push the result onto the stack
							for(int i = 1; i < num2; i++){	//multiply the first integer by itself for the value of num2
								num1 *= num1;
							}
							operands.push(num1);
						}
					}
					else{
						valid = false;
						break;
					}
				}else{
					if(operators.isEmpty()){
						valid = false;
						break;
					}
				}
			}
			else if(c == '}') {//right bracket indicates that computation must be done
				if(!brackets.isEmpty() && !operators.isEmpty()){	//make sure we aren't going to be popping an empty stack
					char op = brackets.pop();
					if(op == '{'){
						int num2 = operands.pop();
						int num1 = operands.pop();
						char opr = operators.pop();
						if(opr == '+')	{	//if operand is "+" perform addition of the two popped elements and push the result onto the stack
						//	System.out.println("add: " + num1 + " " + num2);
							operands.push(num1 + num2);
						}
						else if(opr == '-')	{//if operand is "-" perform subtraction of the two popped elements and push the result onto the stack
						///	System.out.println("sub: " + num1 + " " + num2);
							operands.push(num1 - num2);
						}
						else if(opr == '/'){	//if operand is "/" perform division of the two popped elements and push the result onto the stack
						//	System.out.println("div: " + num1 + " " + num2);
							operands.push(num1 / num2);
						}
						else if(opr == '*')	{//if operand is "*" perform multiplication of the two popped elements and push the result onto the stack
						//	System.out.println("mult: " + num1 + " " + num2);
							operands.push(num1 * num2);
						}
						else if(opr == '^'){	//if operand is "^" perform exponentiation of the two popped elements and push the result onto the stack
							for(int i = 1; i < num2; i++){	//multiply the first integer by itself for the value of num2
								num1 *= num1;
							}
							operands.push(num1);
						}
					}
					else{
						valid = false;
						break;
					}
				}else{
					if(operators.isEmpty())	{
						valid = false;
						break;
					}
				}
			}
			else if(c == ']')	{//right bracket indicates that computation must be done
				//System.out.println("Operands: " + operands.size() + "   Operators: " + operators.size() + "   Brackets: " + brackets.size());
				if(!brackets.isEmpty() && !operators.isEmpty())	{//make sure we aren't going to be popping an empty stack
					char op = brackets.pop();
					if(op == '['){
						int num2 = operands.pop();
						int num1 = operands.pop();
						char opr = operators.pop();
						if(opr == '+')	{	//if operand is "+" perform addition of the two popped elements and push the result onto the stack
						//	System.out.println("add: " + num1 + " " + num2);
							operands.push(num1 + num2);
						}
						else if(opr == '-'){	//if operand is "-" perform subtraction of the two popped elements and push the result onto the stack
						//	System.out.println("sub: " + num1 + " " + num2);
							operands.push(num1 - num2);
						}
						else if(opr == '/'){	//if operand is "/" perform division of the two popped elements and push the result onto the stack
						//	System.out.println("div: " + num1 + " " + num2);
							operands.push(num1 / num2);
						}
						else if(opr == '*')	{//if operand is "*" perform multiplication of the two popped elements and push the result onto the stack
						//	System.out.println("mult: " + num1 + " " + num2);
							operands.push(num1 * num2);
						}
						else if(opr == '^')	{//if operand is "^" perform exponentiation of the two popped elements and push the result onto the stack
							for(int i = 1; i < num2; i++)	{//multiply the first integer by itself for the value of num2
								num1 *= num1;
							}
							operands.push(num1);
						}
					}
					else{
						valid = false;
						break;
					}
				}else{
					if(operators.isEmpty()){
						valid = false;
						break;
					}
				}
			}	
		}
		if(valid == true){
			if(operands.size() == 1){
				String fin = operands.pop().toString();
				return fin;
				//System.out.println(fin);
				//System.out.println("Operands: " + operands.size() + "   Operators: " + operators.size() + "   Brackets: " + brackets.size());
			}else{
				return("Syntax Error");
				//System.out.println("Syntax Error");
				//System.out.println("Operands: " + operands.size() + "   Operators: " + operators.size() + "   Brackets: " + brackets.size());
			}
		}else{
			return("Syntax Error");
			//System.out.println("Syntax Error");
		}
	}
	
	static boolean isLeftBracket(char c){
		char ch = c;
		if(ch == '(' || ch == '{' || ch == '[')
			return true;
		else
			return false;
		
	}
	
	static boolean isOperator(char c){
		char ch = c;
		if(ch == '+' || ch == '-' || ch == '*' || ch == '/' || ch == '^')
			return true;
		else
			return false;
	}
}