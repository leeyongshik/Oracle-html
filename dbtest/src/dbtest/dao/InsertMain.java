package dbtest.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class InsertMain {
	private Connection conn;
	private PreparedStatement pstmt;
	private String url = "jdbc:oracle:thin:@UQ6UF3I29AUZDRMN_medium?TNS_ADMIN=/Users/leeyongshik/Desktop/JAVA/java_ee/Wallet_UQ6UF3I29AUZDRMN";
	private String username ="java";
	private String password = "Wjstks0cjfl!@";
	
	public InsertMain() {
		//driver loading
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("driver loading success");

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	
	

	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url, username, password);
			System.out.println("Connection success");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	public void insertArticle() {
		
		
		//접속
		this.getConnection();
		
		//데이터
		Scanner scan = new Scanner(System.in);
		System.out.print("이름 입력 : ");
		String name = scan.next();
		System.out.print("나이 입력 : ");
		int age = scan.nextInt();
		System.out.print("키 입력 : ");
		double height = scan.nextDouble();
		
		try {
			pstmt = conn.prepareStatement("insert into values(?, ?, ?, sysdate)"); //생성
			pstmt.setString(1, name);
			pstmt.setInt(2, age);
			pstmt.setDouble(3, height);
			
			int su = pstmt.executeUpdate();//실행 - 개수 리턴
			
			System.out.println(su+"개의 행 이(가) 삽입되었습니다.");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	
	
	public static void main(String[] args) {
		InsertMain insertMain = new InsertMain();
		insertMain.insertArticle();

	}

}
