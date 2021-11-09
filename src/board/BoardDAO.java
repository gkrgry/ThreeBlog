package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.sql.DataSource;

public class BoardDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private DataSource dataFactory;
	private ResultSet rs;	
	String loginId = "root";
	String loginPw = "root";
	String driver = "com.mysql.cj.jdbc.Driver";
	String loginURL = "jdbc:mysql://localhost:3306/blogdb";
	
	public BoardDAO() {
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(loginURL, loginId, loginPw);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	//작성일자 
	public String getDate() {
		String sql = "Select now()";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
			} catch (Exception e) {
			e.printStackTrace();
		} 
		return ""; //데이터 베이스 오류
		
	}
	//게시글 번호 부여
	public int getNext() {
		//현재 게시글을 내림차순으로 조회하여 가장 마지막 글의 번호를 구한다
		String sql = "Select bId from board order by bId desc";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1)+1; //게시판 bId 가장 높은 번호에 +1 을 해준다
			}
			return 1; //첫번째 게시판 일 경우
			} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터 베이스 오류
		
	}
	//글쓰기 메소드
	public int write(String bTitle, String blogid, String bContent) {
		String sql = "insert into board(bId, bTitle, loginid, bDate, bContent, bAvailable) values(?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bTitle);
			pstmt.setString(3, blogid);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bContent);
			pstmt.setInt(6, 1); //글의 유효번호
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public ArrayList<BoardVO> getList(int pageNumber){
		String sql = "select * from board where bId < ? and bAvailable =1 order by bId desc limit 10";
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardVO boardVO = new BoardVO();
				boardVO.setbId(rs.getInt(1));
				boardVO.setbTitle(rs.getString(2));
				boardVO.setLoginid(rs.getString(3));
				boardVO.setbDate(rs.getString(4));
				boardVO.setbContent(rs.getString(5));
				boardVO.setbAvailable(rs.getInt(6));
				list.add(boardVO);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	public boolean nextPage(int pageNumber) {
		String sql = "select * from board where bId < ? and bAvailable = 1";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	//하나의 게시글 보는 메소드
	public BoardVO getVo(int bId) {
		String sql = "select * from where bId = ?";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setbId(rs.getInt(1));
				vo.setbTitle(rs.getString(2));
				vo.setLoginid(rs.getString(3));
				vo.setbDate(rs.getString(4));
				vo.setbContent(rs.getString(5));
				vo.setbAvailable(rs.getInt(6));
				return vo;
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
    
}
