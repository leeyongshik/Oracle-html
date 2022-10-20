package user.main;

import java.util.Scanner;

import uesr.service.UserDeleteService;
import uesr.service.UserInsertService;
import uesr.service.UserSearchService;
import uesr.service.UserSelectService;
import uesr.service.UserService;
import uesr.service.UserUpdateService;

public class UserMain {

	public static void main(String[] args) {
		UserMain userMain = new UserMain();
		userMain.menu();
		System.out.println("프로그램을 종료합니다.");

	}
	
	public void menu() {
		Scanner s = new Scanner(System.in);
		int num;
		UserService userService =null;
		
		
		while(true) {
			System.out.println();
			System.out.println("***************");
			System.out.println("   1. 입력 ");
			System.out.println("   2. 출력 ");
			System.out.println("   3. 수정 ");
			System.out.println("   4. 삭제 ");
			System.out.println("   5. 검색 ");
			System.out.println("   6. 종료 ");
			System.out.println("***************");
			System.out.print("  번호 : " );
			num = s.nextInt();
			
			if(num==6) break;
			
			if(num==1) userService = new UserInsertService();
			else if(num==2) userService = new UserSelectService();
			else if(num==3) userService = new UserUpdateService();
			else if(num==4) userService = new UserDeleteService();
			else if(num==5) userService = new UserSearchService();
			userService.execute();
			
		}//while
	}//mune()

}
