package uesr.service;

import java.util.List;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserSelectService  implements UserService{

	@Override
	public void execute() {
		System.out.println();
		
		UserDAO userDAO = UserDAO.getInstance();
		List<UserDTO> list = userDAO.getList();
		
		//응답 
		
		for (int i=0; i<list.size();i++) {
			System.out.println(list.size());
			
		}
		System.out.println("구분자");
		for ( UserDTO userDTO : list) {
			System.out.println(userDTO.getName() + "\t" + userDTO.getId() + "\t" + userDTO.getPwd());
		}
		
	}

}
