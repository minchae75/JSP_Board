package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	//DB����
	public BoardDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/Board";
			String dbID = "root";
			String dbPassword = "2924";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
			System.out.println("Success"); //DB���� Ȯ��
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//���� ��¥ �� �ð� �ҷ�����
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ""; //�����ͺ��̽� ����
	}
	
	//������ �� �Խ��� ���̵� ������
	public int getNext() {
		String SQL = "SELECT board_id FROM board ORDER BY board_id DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����
	}
	
	//���� �� ������ ��� insert
	public int write(String title,String content,String writer,String password ) {
		String SQL = "INSERT INTO board VALUE(?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.setString(4, writer);
			pstmt.setString(5, password);
			pstmt.setString(6, getDate());

			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����
	}
	
	//�۸�� �ҷ�����
	public ArrayList<Board> getlist(int pageNum) {
		String SQL = "SELECT * FROM board WHERE board_id < ? ORDER BY board_id DESC LIMIT 20";
		ArrayList<Board> List = new  ArrayList<Board>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,getNext() - (pageNum - 1) *20);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				board.setBoard_id(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setContent(rs.getString(3));
				board.setWriter(rs.getString(4));
				board.setPassword(rs.getString(5));
				board.setRegdate(rs.getString(6));
				List.add(board);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("List Success"); //DB���� Ȯ��
		return List;
	}
	
	//���������� 20���� �����ָ� �� �̻��� �Ѿ�� ������������ �ѱ�
	public boolean nextPage(int pageNum) {
		String SQL = "SELECT * FROM board WHERE board_id < ? ORDER BY board_id DESC LIMIT 20";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,getNext() - (pageNum - 1) *20);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}	
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;	
	}
	
	//�۳����� �ҷ����� �Լ�
	public Board getBoard(int board_id) {
		String SQL = "SELECT * FROM board WHERE board_id = ? ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,board_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Board board = new Board();
				board.setBoard_id(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setContent(rs.getString(3));
				board.setWriter(rs.getString(4));
				board.setPassword(rs.getString(5));
				board.setRegdate(rs.getString(6));
				return board;
			}	
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;			
	}
	
	//�� ���� �Լ�
	public int update(int board_id,String title,String content, String password) {
		String SQL = "UPDATE board SET title = ?, content = ? WHERE board_id = ? AND password = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, board_id);
			pstmt.setString(4, password);
			
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����
	}
	
	//�� ���� �Լ�
	public int delete(int board_id,String password) {
		String SQL = "DELETE FROM board WHERE board_id = ? AND password = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, board_id);
			pstmt.setString(2, password);
			
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����	
	}
	
}
