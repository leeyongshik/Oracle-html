package uesr.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserUpdateService  implements UserService{

	@Override
	public void execute() {
		System.out.println();
		Scanner s = new Scanner(System.in);
		
		System.out.print("수정 할 아이디 입력 : ");
		String id = s.next();
		
		
		
		UserDAO userDAO = UserDAO.getInstance();
		UserDTO userDTO = userDAO.getUser(id);
		
		if(userDTO ==null) {
			System.out.println("찾고자 하는 아이디가 없습니다.");
			return;
		}
		
		System.out.println();
		System.out.println(userDTO.getName() + "\t" + userDTO.getId() + "\t" + userDTO.getPwd());

		
		System.out.println();
		System.out.print("수정 할 이름 입력 : ");
		String name = s.next();
		System.out.print("수정 할 비밀번호 입력 :");
		String pwd = s.next();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("id", id);
		map.put("pwd", pwd);
		
		int su = userDAO.update(map);
		
//		userDTO.setName(name);
//		userDTO.setId(id);
//		userDTO.setPwd(pwd);
//		
//		userDAO.updatewrite(userDTO);
		
		System.out.println(su + "개의 데이터를 수정하였습니다.");
		
	}

}
