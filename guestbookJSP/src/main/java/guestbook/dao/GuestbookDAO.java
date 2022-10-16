package guestbook.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
		
		if(guestbookDTO.getHomepage().equals("http://"))guestbookDTO.setHomepage(null);
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
	public ArrayList guestbookList() {
		GuestbookDTO guestbookDTO = null;
		String sql = "SELECT seq, name, email, homepage, subject, content, to_char(logtime,'YYYY-MM-DD') FROM guestbook order by seq DESC";
		ArrayList<GuestbookDTO> list = new ArrayList<GuestbookDTO>();
		
		
		
		getConnecting();
		
			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					guestbookDTO = new GuestbookDTO();
					guestbookDTO.setKey(rs.getInt("seq"));
					if(rs.getString("name")!=null) guestbookDTO.setName(rs.getString("name"));
					else guestbookDTO.setName("");
					if(rs.getString("email")!=null) guestbookDTO.setEmail(rs.getString("email"));
					else guestbookDTO.setEmail("");
					if(rs.getString("homepage")!=null) guestbookDTO.setHomepage(rs.getString("homepage"));
					else guestbookDTO.setHomepage("");
					guestbookDTO.setSubject(rs.getString("subject"));
					guestbookDTO.setContent(rs.getString("content"));
					guestbookDTO.setLogtime(rs.getString("to_char(logtime,'YYYY-MM-DD')"));
					list.add(guestbookDTO);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			finally {
				try {
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			
			return list;
		
	}


	public void setConn(Connection conn) {
		this.conn = conn;
	}


	public void setPstmt(PreparedStatement pstmt) {
		this.pstmt = pstmt;
	}


	public void setRs(ResultSet rs) {
		this.rs = rs;
	}


	public Connection getConn() {
		return conn;
	}


	public PreparedStatement getPstmt() {
		return pstmt;
	}


	public ResultSet getRs() {
		return rs;
	}

}
