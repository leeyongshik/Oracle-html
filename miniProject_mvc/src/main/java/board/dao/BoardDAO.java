package board.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.bean.BoardDTO;

public class BoardDAO {
	private SqlSessionFactory sqlSessionFactory;
	private static BoardDAO boardDAO = new BoardDAO();
	
	public static BoardDAO getInstance() {
		return boardDAO;
	}
	
	public BoardDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public void write(BoardDTO boardDTO) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("boardSQL.write",boardDTO);

		sqlSession.commit();
		sqlSession.close();
		
		
		
	}
	
	public int getTotalA() {
		int totalA=0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<BoardDTO> list = sqlSession.selectList("boardSQL.getTotalA");
		totalA = list.size();
		return totalA;
	}
	
	public List<BoardDTO> boardList(Map<String, Integer> map) {
		List<BoardDTO> list = null;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		list = sqlSession.selectList("boardSQL.boardList", map);
		sqlSession.close();
		return list;
	}
	
	public void boardcount(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("boardSQL.boardcount",seq);
		sqlSession.commit();
		sqlSession.close();
		
	}
	
	public BoardDTO boardListOne(int seq) {
		BoardDTO boardDTO = null;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		boardDTO = sqlSession.selectOne("boardSQL.boardListOne",seq);
		sqlSession.close();
		
		return boardDTO;
	}
	
}
