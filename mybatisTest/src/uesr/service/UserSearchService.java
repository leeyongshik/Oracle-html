package uesr.service;

import java.util.List;
import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserSearchService  implements UserService{

	@Override
	public void execute() {
		Scanner s = new Scanner(System.in);
		String name=null;
		String id=null;
		
		System.out.println();
		System.out.println("***************");
		System.out.println("   1. 이름으로 검색 ");
		System.out.println("   2. 아이디로 검색 ");
		System.out.println("***************");
		System.out.print("  번호 : " );
		int num = s.nextInt();
		System.out.println();
		
		
		if(num == 1) {
			System.out.print("검색 할 이름 입력 : ");
			name = s.next();
		}
		else if (num == 2) {
			System.out.print("검색 할 아이디 입력 : ");
			id = s.next();
		}
		
		UserDTO userDTO = new UserDTO();
		userDTO.setName(name);
		userDTO.setId(id);
		
		UserDAO userDAO = UserDAO.getInstance();
		List<UserDTO> list = userDAO.search(userDTO);
		
		for(UserDTO userDTO2 : list) {
			System.out.println(userDTO2.getName() + "\t" + userDTO2.getId() + "\t" + userDTO2.getPwd());
		}
		
		
	}

}
