package function;

public class Quiz1 {
	// 여기에 함수를 정의하세요
	static String getSign(int num) {
		String str;
		if(num > 0) 		str = "양수";
		else if(num < 0)	str = "음수";
		else 				str = "0";
		return str;
	}
	
	static int getReverseNum(int num) {	// 나눗셈을 활용한 자릿수 구분
		int result = 0;			// 	num		result	|	num		result	|	num 	result	| 	num		result
		while(num != 0) {		// 	1234	0		|	123		4		|	12		43		|	1		432
			result *= 10;		//  1234	0		|	123		40		|	12		430		|	1		4320	
			result += num % 10;	// 	1234	4		|	123		43		|	12		432		|	1		4321
			num /= 10;			//  123		4		|	12		43		|	1		432		|	0		4321
		}
		return result;
	}
	
	static int pow(int n1, int n2) {	// (2, 10)
		int answer = 1;
		for(int i = 0; i < n2; i++) {	// 10번 반복하여
			answer *= n1;				// 2를 곱한다
		}
		return answer;
	}
	
	static int remainder(int n1, int n2) {
		int answer = 0;
		answer = n1 % n2;
		return answer;
	}
	
	static String getReverseStr(String str) {
		String answer = "";
		for(int i = str.length() - 1; i != -1; i--) {
			answer += str.charAt(i);
		}
		return answer;
	}
	
	public static void main(String[] args) {
		// 1) 정수를 하나 전달받아서, 양수, 음수, 0을 문자열로 반환하는 함수 getSign
		String q1 = getSign(0);
		System.out.println("q1 : " + q1 + "\n");
		
		// 2) 정수를 하나 전달받아서 정수의 배치를 거꾸로 뒤집어 반환하는 함수 getReverseNum
		int q2 = getReverseNum(1234);	// 4321
		System.out.println("q2 : " + q2);
		int t2 = getReverseNum(13579);
		System.out.println("t2 : " + t2 + "\n");
		
		// 3) 두 정수를 전달받아서 n1의 n2제곱수를 반환하는 함수 pow
		int q3 = pow(2, 10);	// 1024
		System.out.println("q3 : " + q3);
		
		// 4) 두 정수를 전달받아서 n1을 n2로 나누었을때의 나머지를 반환하는 함수 remainder
		int q4 = remainder(100, 6);
		System.out.println("q4 : " + q4);
		
		// 5) 문자열을 하나 전달받아서, 문자열을 거꾸로 배치한 값을 반환하는 함수 getReverseStr
		String q5 = getReverseStr("Hello");
		System.out.println("q5 : " + q5);
		
		// 함수 호출 코드에 마우스를 올려보세요
		// 함수 호출 코드에 마우스를 올린 상태로 컨트롤 클릭하면 함수의 정의로 이동합니다
		int test = Integer.parseInt("1234");
		
		
		
		
		
		
		
	}
}
