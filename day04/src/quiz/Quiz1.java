package quiz;

import java.util.Scanner;

public class Quiz1 {
	public static void main(String[] args) {
		// 두 정수를 입력받아서 더 큰수를 화면에 출력하세요
		
		Scanner sc = new Scanner(System.in);
		int n1, n2;
		
		System.out.print("n1 입력 : ");
		n1 = sc.nextInt();

		System.out.print("n2 입력 : ");
		n2 = sc.nextInt();
		
		if(n1 > n2) {	// 만약에, n1의 값이 n2의 값보다 더 크면
			System.out.println("더 큰 수 : " + n1);
		}
		else {		// 아니면, (n1의 값이 n2와 같거나, 더 작으면)
			System.out.println("더 큰 수 : " + n2);
		}
		sc.close();
	}
}
