package uesr.service;

import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserDeleteService  implements UserService{

	@Override
	public void execute() {
		Scanner s = new Scanner(System.in);
		
		System.out.print("삭제 할 아이디 입력 : ");
		String id = s.next();
		
		UserDAO userDAO = UserDAO.getInstance();
		int su = userDAO.delete(id);
		
		if(su==0) {
			System.out.println("찾는 아이디가 존재하지 않습니다.");
			return;
		}
		else System.out.println("삭제하였습니다.");
	}

}
