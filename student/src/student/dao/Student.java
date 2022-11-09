package student.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class Student {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@UQ6UF3I29AUZDRMN_medium?TNS_ADMIN=/Users/leeyongshik/Desktop/JAVA/java_ee/Wallet_UQ6UF3I29AUZDRMN";
	private String user = "java";
	private String password = "Wjstks0cjfl!@";
	
	
	
	public Student() {
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
	
	public void menu() {
		Scanner s = new Scanner(System.in);
		
		while(true) {
			System.out.println();
			System.out.println("**************");
			System.out.println("    관리");
			System.out.println("**************");
			System.out.println("  1. 입력 ");
			System.out.println("  2. 검색 ");
			System.out.println("  3. 삭제 ");
			System.out.println("  4. 종료 ");
			System.out.println("**************");
			System.out.print(" 번호선택 : ");
			int a = s.nextInt();
			
			if(a == 4) {
				System.out.println("프로그램을 종료 합니다.");
				break;
			}//if 
			if(a == 1) insertArticle();
			else if(a == 2) selectArticle();
			else if(a == 3) deleteArticle();
			else System.out.println("1~4까지 입력해주세요.");
		}//while
	}
		
		public void insertArticle() {
			getConnecting();
			Scanner s = new Scanner(System.in);
			
			while(true) {
				System.out.println();
				System.out.println("**************");
				System.out.println("  1. 학생 ");
				System.out.println("  2. 교수 ");
				System.out.println("  3. 관리자 ");
				System.out.println("  4. 이전메뉴 ");
				System.out.println("**************");
				System.out.print(" 번호선택 : ");
				int a = s.nextInt();
				
				if(a==4) break;
				if(a==1) {
					
					System.out.println();
					System.out.print("이름 입력 : ");
					String name = s.next();
					System.out.print("학번 입력 : ");
					String num = s.next();
					
					try {
						pstmt = conn.prepareStatement("insert into student values(?, ?, ?)");
						pstmt.setString(1, name);
						pstmt.setString(2, num);
						pstmt.setInt(3, a);
						
						int su = pstmt.executeUpdate();
						System.out.println();
						System.out.println("삽입 되었습니다.");
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
				}//if
				else if(a == 2) {
					System.out.println();
					System.out.print("이름 입력 : ");
					String name = s.next();
					System.out.print("과목 입력 : ");
					String subject = s.next();
					
					try {
						pstmt = conn.prepareStatement("insert into student values(?, ?,?)");
						pstmt.setString(1, name);
						pstmt.setString(2, subject);
						pstmt.setInt(3, a);
						
						int su = pstmt.executeUpdate();
						System.out.println();
						System.out.println(su + "개의 행이 삽입 되었습니다.");
					} catch (SQLException e) {
						e.printStackTrace();
					}finally {
						try {
							if(pstmt!=null) pstmt.close();
							if(pstmt!=null) conn.close();
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}//else if
				else if(a == 3) {
					System.out.println();
					System.out.print("이름 입력 : ");
					String name = s.next();
					System.out.print("부서 입력 : ");
					String department = s.next();
					
					try {
						pstmt = conn.prepareStatement("insert into student values(?, ?,?)");
						pstmt.setString(1, name);
						pstmt.setString(2, department);
						pstmt.setInt(3, a);
						
						int su = pstmt.executeUpdate();
						System.out.println();
						System.out.println("삽입 되었습니다.");
					} catch (SQLException e) {
						e.printStackTrace();
					}finally {
						try {
							if(pstmt!=null) pstmt.close();
							if(pstmt!=null) conn.close();
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}//else if
			}//while
			
		
		}
		
		public void selectArticle() {
			getConnecting();
			Scanner s = new Scanner(System.in);
			
			while(true) {
				System.out.println();
				System.out.println("**************");
				System.out.println("  1. 이름 검색 ");
				System.out.println("  2. 전체 검색 ");
				System.out.println("  3. 이전메뉴 ");
				System.out.println("**************");
				System.out.print(" 번호선택 : ");
				int a = s.nextInt();
				
				if(a == 3) break;;
				if(a==1) {
					System.out.println();
					System.out.print("검색할 이름 입력 : ");
					String name = s.next();
					
					try {
						pstmt = conn.prepareStatement("select * from student where name like ?");
						pstmt.setString(1, "%"+name+"%");
						rs = pstmt.executeQuery();
						
						while(rs.next()) {
							System.out.println();
							if(rs.getInt("code")==1) System.out.print("이름 = " + rs.getString("name") + "\t" + "학번 = " +rs.getString("value"));
							else if(rs.getInt("code")==2) System.out.print("이름 = " + rs.getString("name") + "\t" + "과목 = " +rs.getString("value"));
							else if(rs.getInt("code")==3) System.out.print("이름 = " + rs.getString("name") + "\t" + "부서 = " +rs.getString("value"));
						
						}
						
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
				}
				else if(a==2) {
					
					try {
						pstmt = conn.prepareStatement("select * from student");
						rs = pstmt.executeQuery();
						
						while(rs.next()) {
							System.out.println();
							System.out.print(rs.getString("name") + "\t" +rs.getString("value") + "\t" +rs.getInt("code"));
						}
						System.out.println();
						
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
				}
			}//while
			
		}
		public void deleteArticle() {
			getConnecting();
			Scanner s = new Scanner(System.in);
			
			System.out.print("삭제를 원하는 이름 입력 : ");
			String name = s.next();
			
			try {
				pstmt = conn.prepareStatement("delete from student" + " where name = ?");
				pstmt.setString(1, name);
				int su = pstmt.executeUpdate();
				
				if(su>0) System.out.println("삭제 되었습니다.");
				else System.out.println("검색 한 이름이 없습니다.");
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
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
		Student student = new Student();
		student.menu();

	
	}
}
/*
[문제]
Project : student 
Package : student.dao 
Class : Student.java

# 테이블 작성
create table student(
name varchar2(15) not null, -- 이름
value varchar2(15), -- 학번 or 과목 or 부서
code number -- 1이면 학생, 2이면 교수, 3이면 관리자 );

menu() 
****************
	  관리 
****************
	1. 입력 
	2. 검색 
	3. 삭제 
	4. 종료
*****************	
   번호선택 : 4
프로그램 종료합니다


1번인 경우 insertArticle() 
****************
	1. 학생
	2. 교수
	3. 관리자 
	4. 이전메뉴
**************** 
	번호선택 :
1번 학생인 경우 
이름입력 : 
학번입력 :

2번 교수인 경우 
이름입력 : 
과목입력 :

3번 관리자인 경우 
이름입력 : 
부서입력 :

2번인 경우 selectArticle() 
****************
1. 이름 검색 (1개 글자가 포함된 이름은 모두 검색) 2. 전체 검색
3. 이전메뉴
**************** 
	번호선택 : 1

1번 경우
검색할 이름 입력 : 이 
이름=희동이 학번=2015 
이름=이교수 과목=JAVA

3번인 경우
deleteArticle()
삭제를 원하는 이름 입력 : (정확하게 3개의 글자가 모두 입력된 상태)
*/


/*
교수님 작성 코드
package student.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class Student {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "c##java";
	private String password = "bit";

	public Student() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} 
	}
	
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void menu() {
		Scanner scan = new Scanner(System.in);
		int num;	
		while(true) {
			System.out.println();
			System.out.println("**************");
			System.out.println("   관리");
			System.out.println("**************");
			System.out.println("   1. 입력");
			System.out.println("   2. 검색");
			System.out.println("   3. 삭제");
			System.out.println("   4. 종료");
			System.out.println("**************");
			System.out.print("번호 입력 : ");
			num = scan.nextInt();
			if(num==4) break;
			
			if(num == 1) insertArticle();
			else if(num == 2) selectArticle();
			else if(num == 3) deleteArticle();
		}//while
		
	}//menu()

	public void deleteArticle() {
		Scanner scan = new Scanner(System.in);
		
		System.out.println();
		System.out.print("삭제할 이름 입력 : ");
		String name = scan.next();
		
		//DB - delete
		getConnection();
		
		String sql = "delete student where name = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			
			int su = pstmt.executeUpdate();
			
			System.out.println(su+"개의 행 이(가) 삭제되었습니다.");
			
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
		
	}//deleteArticle()

	public void selectArticle() {
		Scanner scan = new Scanner(System.in);
		int num;
		
		while(true) {
			System.out.println();
			System.out.println("**************");
			System.out.println("   1. 이름 검색");
			System.out.println("   2. 전체 검색");
			System.out.println("   3. 이전메뉴");
			System.out.println("**************");
			System.out.print("번호 입력 : ");
			num = scan.nextInt();
			
			if(num==3) break;
			
			System.out.println();
			String name = null;
			if(num == 1) {
				System.out.print("검색할 이름 입력 : ");
				name = scan.next();
			}
			
			//DB - select
			getConnection();
			
			String sql = null;
			if(num == 1)
				sql = "select * from student where name like ?";
			else
				sql = "select * from student";
			
			try {
				pstmt = conn.prepareStatement(sql);
				if(num == 1) pstmt.setString(1, "%"+name+"%");
				
				rs = pstmt.executeQuery();//ResultSet 리턴
				
				while(rs.next()) {
					System.out.print("이름 = " + rs.getString("name") + "\t");
					if(rs.getInt("code") == 1)
						System.out.println("학번 = " + rs.getString("value"));
					
					else if(rs.getInt("code") == 2)
						System.out.println("과목 = " + rs.getString("value"));
					
					else if(rs.getInt("code") == 3)
						System.out.println("부서 = " + rs.getString("value"));
				}//while
				
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
		}//while
		
	}//selectArticle()

	public void insertArticle() {
		Scanner scan = new Scanner(System.in);
		int num;
		
		while(true) {
			System.out.println();
			System.out.println("**************");
			System.out.println("   1. 학생");
			System.out.println("   2. 교수");
			System.out.println("   3. 관리자");
			System.out.println("   4. 이전메뉴");
			System.out.println("**************");
			System.out.print("번호 입력 : ");
			num = scan.nextInt();
			
			if(num==4) break;
			
			System.out.println();
			System.out.print("이름 입력 : ");
			String name = scan.next();
			String value = null;
			
			if(num == 1) {//학생
				System.out.print("학번 입력 : ");
				value = scan.next();
				 
			}else if(num == 2) {//교수
				System.out.print("과목 입력 : ");
				value = scan.next();
				 
			}else if(num == 3) {//관리자
				System.out.print("부서 입력 : ");
				value = scan.next();
				 
			}
			
			//DB - insert
			getConnection();
			
			String sql = "insert into student values(?, ?, ?)";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, value);
				pstmt.setInt(3, num);
				
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
						
		}//while
		
	}//insertArticle
	
	public static void main(String[] args) {
		Student student = new Student();
		student.menu();
		System.out.println("프로그램 종료합니다.");

	}//main

}//class Student
*/