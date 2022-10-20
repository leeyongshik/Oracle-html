package user.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import user.bean.UserDTO;

public class UserDAO {
	private SqlSessionFactory sqlSessionFactory;
	private static UserDAO userDAO = new UserDAO();
	
	
	public static UserDAO getInstance() {
		return userDAO;
	}
	
	public UserDAO() {
		// 환경설정 파일(mybatis-config.xml) 을 읽어온다.
		
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void write(UserDTO userDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("userSQL.write",userDTO);
		sqlSession.commit();
		sqlSession.close();
		
		
	}
}
