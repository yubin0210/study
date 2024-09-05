package porkFeet;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.driver.OracleDriver;
import youtube.DTO;

public class PorkFeetDAO {
	
	private String url = "jdbc:oracle:thin:@192.168.1.100:1521:xe";
	private String user = "c##itbank";
	private String password = "it";
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Connection getConnection() {
		try {
			Class.forName(OracleDriver.class.getName());
			conn = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	private void close() {		
		try {
			if(rs != null)		rs.close();
			if(pstmt != null)	pstmt.close();
			if(conn != null)	conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<PorkFeetDTO> selectList(){
		ArrayList<PorkFeetDTO> list = new ArrayList<>();
		String sql = "select * from porkFeet";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PorkFeetDTO dto = new PorkFeetDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setCategory(rs.getString("category"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getInt("price"));
				dto.setImgName(rs.getString("imgName"));
				dto.setMemo(rs.getString("memo"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {close();}
		System.out.println(list.size());
		return list;
	}
	
	public PorkFeetDTO selectOne(int idx) {	
		String sql = "select * from porkFeet where idx = ?";
		PorkFeetDTO dto = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new PorkFeetDTO();
				dto.setCategory(rs.getString("category"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getInt("price"));
				dto.setMemo(rs.getString("memo"));
				dto.setImgName(rs.getString("imgName"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public List<PorkFeetDTO> search(String name){
		ArrayList<PorkFeetDTO> list = new ArrayList<>();
		String sql = "select * from porkFeet where name like '%' || ? || '%'";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto.setCategory(sql);
				dto.getName();
				dto.getPrice();
				dto.getMemo();
				dto.getImgName();
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int insert(PorkFeetDTO dto){
		int row = 0;
		String sql = "insert into porkFeet (category, name, price, memo, imgName) values (?, ?, ?, ?, ?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCategory());
			pstmt.setString(2, dto.getName());
			pstmt.setInt(3, dto.getPrice());
			pstmt.setString(4, dto.getMemo());
			pstmt.setString(5, dto.getImgName());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return row;
	}
	
}
