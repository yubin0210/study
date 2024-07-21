package quiz;

import java.util.Scanner;

public class Quiz4 {
	public static void main(String[] args) {
		// 지하철 1구간당 [평균 소요 시간이 4분]이라고 가정한다
		// [이동한 구간수]를 입력받아서 이동하는데 걸리는 시간을 출력하세요
		// 단, 이동한 시간이 60분 이하이면 분으로만 출력하고
		// 이동한 시간이 60분을 초과하면 [시간]과 [분]으로 나누어서 출력하세요
		
		Scanner sc = new Scanner(System.in);	// 입력받기 위한 객체
		int perStation = 4;						// 구간당 4분
		int distance;							// 이동한 구간 수(입력받아야 함)
		int hour, minute;						// 조건에 따라 사용할 변수(계산해야 함)
		
		System.out.print("이동한 구간 수를 입력하세요 : ");	// 입력 안내 메시지
		distance = sc.nextInt();						// 입력받기
		
		minute = distance * perStation;	// 입력값으로 분 구하기
		
		if(minute <= 60) {										// 분이 60이하이면
			System.out.println("걸린 시간 : " + minute + "분");	// 그냥 출력
		}
		else {					// 아니면 (분이 60을 초과하면)
			hour = minute / 60;	// 시간은 전체 시간에서 60을 나눈 몫
			minute %= 60;		// 분은 전체 시간에서 60을 나눈 나머지
			System.out.printf("걸린 시간 : %d시간 %d분\n", hour, minute); // 각각 출력
		}
		
		sc.close();	// 마무리
	}
}









