package user.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

	public List<UserDTO> getList() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<UserDTO> list = sqlSession.selectList("userSQL.getList");
		
		sqlSession.close();
		return list;
	}

	public UserDTO getUser(String id) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		UserDTO userDTO = sqlSession.selectOne("userSQL.getUser", id);
		sqlSession.close();
		return userDTO;
	}

//	public int updatewrite(UserDTO userDTO) {
//		int id = 0;
//		SqlSession sqlSession = sqlSessionFactory.openSession();
//		
//		id=sqlSession.update("userSQL.updatewrite",userDTO);
//		
//		sqlSession.commit();
//		sqlSession.close();
//		
//	}

	public int update(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int su = sqlSession.update("userSQL.update",map);
		sqlSession.commit();
		sqlSession.close();
		return su;
	}

	public int delete(String id) {
		int su = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		su = sqlSession.delete("userSQL.delete",id);
		sqlSession.commit();
		sqlSession.close();
		return su;
	}

	public List<UserDTO> search(UserDTO userDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<UserDTO> list  = sqlSession.selectList("userSQL.search", userDTO);
		
		sqlSession.close();
		return list;
	}

	

	
}
