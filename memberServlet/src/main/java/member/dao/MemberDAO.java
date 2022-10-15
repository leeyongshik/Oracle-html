package member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import member.bean.MemberDTO;

public class MemberDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@UQ6UF3I29AUZDRMN_medium?TNS_ADMIN=/Users/leeyongshik/Desktop/JAVA/java_ee/Wallet_UQ6UF3I29AUZDRMN";
	private String user = "java";
	private String password = "Wjstks0cjfl!@";
	
	private static MemberDAO memberDAO = new MemberDAO();
	
	
	public static MemberDAO getInstance() {
		return memberDAO;
	}
	
	
	public MemberDAO() {
		try {
			Class.forName(driver);//생성
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public void getConnecting() {
		try {
			conn = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	public int memberWrite(MemberDTO memberDTO) {
		int su =0;
		String sql = "insert into member values(?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";
		
		getConnecting();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,memberDTO.getName());
			pstmt.setString(2,memberDTO.getId());
			pstmt.setString(3,memberDTO.getPwd());
			pstmt.setString(4,memberDTO.getGender());
			pstmt.setString(5,memberDTO.getTel1());
			pstmt.setString(6,memberDTO.getTel2());
			pstmt.setString(7,memberDTO.getTel3());
			pstmt.setString(8,memberDTO.getEmail1());
			pstmt.setString(9,memberDTO.getEmail2());
			pstmt.setString(10,memberDTO.getZipcode());
			pstmt.setString(11,memberDTO.getAddr1());
			pstmt.setString(12,memberDTO.getAddr2());
			
			su = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return su;
	}


	public String memberLogin(String id, String pwd) {
		String name=null;
		String sql = "SELECT name FROM member where id=? and pwd=?";
		getConnecting();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			
			rs = pstmt.executeQuery();
			if(rs.next()) name=rs.getString("name");
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
				try {
					if(rs!=null) rs.close();
					if(pstmt!=null) pstmt.close();
					if(conn!=null) conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		
		return name;
	}
}
