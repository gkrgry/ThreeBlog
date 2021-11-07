package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

public class JoinDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private DataSource dataFactory;
	private ResultSet rs;	
	String loginId = "root";
	String loginPw = "root";
	String driver = "com.mysql.cj.jdbc.Driver";
	String loginURL = "jdbc:mysql://localhost:3306/blogdb";
	
	public JoinDAO() {
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(loginURL, loginId, loginPw);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	public int join(LoginVO loginVO) {
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(loginURL, loginId, loginPw);
			String sql = "INSERT INTO bloglogin (blogid, blogpw, blogname, blogemail, blogsex) "
					+ "VALUES (?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql); //sql 쿼리문을 대기 시킨
			pstmt.setString(1, loginVO.getBlogid());
			pstmt.setString(2, loginVO.getBlogpw());
			pstmt.setString(3, loginVO.getBlogname());
			pstmt.setString(4, loginVO.getBlogemail());
			pstmt.setString(5, loginVO.getBlogsex());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;// 오류
		
	}
}

