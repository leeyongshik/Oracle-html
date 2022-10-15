package guestbook.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import guestbook.bean.GuestbookDTO;

public class GuestbookDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@UQ6UF3I29AUZDRMN_medium?TNS_ADMIN=/Users/leeyongshik/Desktop/JAVA/java_ee/Wallet_UQ6UF3I29AUZDRMN";
	private String user = "java";
	private String password = "Wjstks0cjfl!@";
	
	private static GuestbookDAO guestbookDAO = new GuestbookDAO();
	
	
	public static GuestbookDAO getInstance() {
		return guestbookDAO;
	}
	
	
	public GuestbookDAO() {
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
	public int guestbookWrite(GuestbookDTO guestbookDTO) {
		int su=0;
		String sql="INSERT INTO guestbook VALUES (seq_guestbook.nextval,?,?,?,?,?,sysdate)";
		
		getConnecting();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, guestbookDTO.getName());
			pstmt.setString(2, guestbookDTO.getEmail());
			pstmt.setString(3, guestbookDTO.getHomepage());
			pstmt.setString(4, guestbookDTO.getSubject());
			pstmt.setString(5, guestbookDTO.getContent());
			
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

}
