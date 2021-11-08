package Board;

import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



public class BoardDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	//기본 생성자
	public BoardDAO() {
		try {
			String driver = "com.mysql.cj.jdbc.Driver";
			String dbURL="jdbc:mysql://localhost:3306/gallery";
			String dbID ="root";
			String dbPassword="1234";
			Class.forName(driver);
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}	
	}
	
	//작성일자
	public String getDate() {
		String sql="select now()";
		try {
			PreparedStatement pstmt= conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				System.out.println("작성일자");
				return rs.getString(1);
			}
		}catch (Exception e){
			e.printStackTrace();
		}
		return "";//데이터베이스 오류
	}
	
	//게시글 번호 부여
	public int getNext() {
		//현재 게시글을 내림차순으로 조회하여 가장 마지막 글의 번호를 구한다.
		String sql="select boardID from board order by boardID desc";
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				System.out.println("번호부여");
				return rs.getInt(1)+1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}
	
	public int write(String boardTitle,String userID, String boardContent) {
		String sql="insert into board values(?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, boardTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4,getDate());
			pstmt.setString(5, boardContent);
			pstmt.setInt(6, 1);//글의 유호번호
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	//게시글 리스트
	public ArrayList<BoardVO> getList(int pageNumber){
		String sql = "select * from board where boardID < ? and boardAvailable=1 order by boardID desc limit 10";
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext()-(pageNumber-1)*10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardVO boardVO = new BoardVO();
				boardVO.setBoardID(rs.getInt(1));
				boardVO.setBoardTitle(rs.getString(2));
				boardVO.setUserID(rs.getString(3));
				boardVO.setBoardDate(rs.getString(4));
				boardVO.setBoardContent(rs.getString(5));
				boardVO.setBoardAvailable(rs.getInt(6));
				list.add(boardVO);
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	//페이지 처리
	public boolean nextPage(int pageNumber) {
		String sql = "select * from board where boardID < ? and boardAvailable = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,getNext()-(pageNumber-1)*10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
			
		return false;
	}
}
