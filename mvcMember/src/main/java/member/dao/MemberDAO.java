package member.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import member.bean.MemberDTO;

public class MemberDAO {
	private SqlSessionFactory sqlSessionFactory;
	
	private static MemberDAO memberDAO = new MemberDAO();
	
	
	public static MemberDAO getInstance() {
		return memberDAO;
	}
	
	
	public MemberDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


	public int memberWrite(MemberDTO memberDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int su = sqlSession.insert("memberSQL.memberWrite",memberDTO);
		sqlSession.commit();
		sqlSession.close();
		
		return su;
	}


	public MemberDTO memberLogin(Map<String, String> map) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.memberLogin", map);
		sqlSession.close();
		
		return memberDTO;
		
	}
	
	public boolean isExistId(String id) {
		
		boolean exist=false;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		exist = sqlSession.selectOne("memberSQL.isExistId", id);
		sqlSession.close();
		return exist;
	}
}