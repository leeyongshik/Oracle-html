package uesr.service;

import java.util.Scanner;
import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserInsertService implements UserService{

	@Override
	public void execute() {
		Scanner s = new Scanner(System.in);
		
		System.out.println();
		System.out.print("이름 입력 : ");
		String name = s.next();
		System.out.print("아이디 입력 : ");
		String id = s.next();
		System.out.print("비밀번호 입력 : ");
		String pwd = s.next();
		
		UserDTO userDTO = new UserDTO();
		userDTO.setName(name);
		userDTO.setId(id);
		userDTO.setPwd(pwd);
		
		
		//DB
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.write(userDTO);
		
		System.out.println();
		System.out.println("DB에 저장하였습니다.");
		System.out.println();
		
	}

}
