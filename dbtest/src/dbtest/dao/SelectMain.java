package dbtest.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SelectMain {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@UQ6UF3I29AUZDRMN_medium?TNS_ADMIN=/Users/leeyongshik/Desktop/JAVA/java_ee/Wallet_UQ6UF3I29AUZDRMN";
	private String user = "java";
	private String password = "Wjstks0cjfl!@";
	
	
	public SelectMain() { //드라이버
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
	
	public void selectArticle() {
		getConnecting();
		
		String sql = "select * from dbtest";
		
		try {
			pstmt = conn.prepareStatement(sql); // 생성 
			rs = pstmt.executeQuery(); // ResultSet으로 데이터 가져온다
			
			while(rs.next()) {
				System.out.print(rs.getString("name") + "\t");
				System.out.print(rs.getInt("age") + "\t");
				System.out.print(rs.getDouble("height") + "\t");
				System.out.print(rs.getString("logtime"));
				System.out.println();
			}//while
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	

	public static void main(String[] args) {
		SelectMain selectMain = new SelectMain();
		selectMain.selectArticle();

	}

}
