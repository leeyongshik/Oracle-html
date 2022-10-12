package dbtest.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class UpdateMain {
	private Connection conn;
	private PreparedStatement pstmt;
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@UQ6UF3I29AUZDRMN_medium?TNS_ADMIN=/Users/leeyongshik/Desktop/JAVA/java_ee/Wallet_UQ6UF3I29AUZDRMN";
	private String user = "java";
	private String password = "Wjstks0cjfl!@";
	
	public UpdateMain() {
		try {
			Class.forName(driver);//생성
			System.out.println("드라이버 성공");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	//접속
	public void getConnecting() {
		try {
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("커넥팅 성공");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//------------------------------------
	
	
	public void updatetArticle() {
		this.getConnecting(); // 호출
		Scanner scan = new Scanner(System.in);
		
		//데이터
		System.out.print("수정 할 이름 : ");
		String name = scan.next();
		
		
		//DB
		try {
			pstmt = conn.prepareStatement("UPDATE dbtest set age = age+1, height = height+1 where name like ?"); // 생성
			pstmt.setString(1, "%"+name+"%");
			
			int su = pstmt.executeUpdate();
			System.out.println(su +"개의 행이 업데이트 되었습니다.");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	
	public static void main(String[] args) {
		UpdateMain updateMain =new UpdateMain();
		updateMain.updatetArticle();

	}

}
