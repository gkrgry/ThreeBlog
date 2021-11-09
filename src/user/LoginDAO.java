package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

public class LoginDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private DataSource dataFactory;
	private ResultSet rs;	
	String loginId = "root";
	String loginPw = "root";
	String driver = "com.mysql.cj.jdbc.Driver";
	String loginURL = "jdbc:mysql://localhost:3306/blogdb";
	
	public LoginDAO() {
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(loginURL, loginId, loginPw);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	public int login(String userId, String userPw) {
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(loginURL, loginId, loginPw);
			String sql = "select blogpw from bloglogin where blogid = ?";
			pstmt = con.prepareStatement(sql); //sql 쿼리문을 대기 시킨
			pstmt.setString(1, userId); // 첫번재 ? 에 userId 넣기
			rs = pstmt.executeQuery(); //쿼리를 rs에 저장
			if(rs.next()) {
				if(rs.getString(1).equals(userPw)) {
					return 1; //로그인 성공
				}else {
					return 0; //비밀번호 틀림
				}
			}
			return -1;//아이디 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;// 오류
		
	}
}
