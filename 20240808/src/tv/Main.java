package tv;

import java.util.Scanner;

public class Main {
	// 만들어진 TV클래스의 객체를 생성하고
	// 사용자의 입력을 받아서, 입력에 따라 TV의 기능을 호출하는 클래스
	// (사용자) <-> (Main) <-> (TV)
	
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		TV tv = new TV();
		int menu;
		
		LOOP : while(true) {
			System.out.println("채널 ▲ (7)\t 볼륨 ▲ (9)");
			System.out.println("         전원 (5) 음소거  (6)");
			System.out.println("채널 ▼ (1)\t 볼륨 ▼ (3)");
			System.out.print("선택 >>> ");
			menu = sc.nextInt();
			switch(menu) {
			// 입력된 메뉴에 따라서 tv객체의 메서드를 호출하는 형태로 진행
			case 5:
				tv.turn();
				break;
			case 6:
				tv.mute();
				break;
			case 7:
				tv.channelUp();
				break;
			case 1:
				tv.channelDown();
				break;
			case 3:
				tv.volumeDown();
				break;
			case 9:
				tv.volumeUp();
				break;
			case 0:
				break LOOP;
			}
		}
		sc.close();
		System.out.println("프로그램 종료");
	}
}
