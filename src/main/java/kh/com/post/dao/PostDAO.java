package kh.com.post.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import kh.com.post.dao.PostDAO;
import kh.com.post.dto.PostDTO;

public class PostDAO {
	private BasicDataSource bds = new BasicDataSource();
	private static PostDAO instance = null;
	
	private PostDAO() {
		// url, username, password, 접속자수
		
		bds.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		bds.setUrl("jdbc:oracle:thin:@localhost:1521:orcl");
		bds.setUsername("Test");
		bds.setPassword("1234");
		bds.setInitialSize(50);
	}
	
	public static PostDAO getInstance() {
		if(instance==null) {
			instance = new PostDAO();
		}
		return instance;
	}
	
	public Connection getConnection() throws Exception{
		return bds.getConnection();
	}
	
	public ArrayList<PostDTO> selectAll(){
		String sql = "select * from tbl_post order by 1 asc";
		
		try( Connection con = this.getConnection();
			 PreparedStatement pstmt = con.prepareStatement(sql);){
			
			ResultSet rs = pstmt.executeQuery();
			ArrayList<PostDTO> list = new ArrayList<>();
			
			while(rs.next()) {
				int seq = rs.getInt("seq");
				String nickname = rs.getString("nickname");
				String post = rs.getString("post");
				list.add(new PostDTO(seq,nickname, post));
			}
			return list;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// 기능 메서드를 작성 
	public int insert(PostDTO dto) {
		String sql = "insert into tbl_post values(seq_post.nextval,?, ?)";
		
		try( Connection con = this.getConnection();
			 PreparedStatement psmt = con.prepareStatement(sql);){
				
			psmt.setString(1, dto.getNickname());
			psmt.setString(2, dto.getPost());
			
			int rs = psmt.executeUpdate();
			if(rs != 0) return 1;			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int deleteBySeq(int seq) {
		String sql = "delete from tbl_post where seq = ?";
		try( Connection con = this.getConnection();
				 PreparedStatement psmt = con.prepareStatement(sql);){
					
				psmt.setInt(1,seq);
				
				int rs = psmt.executeUpdate();
				if(rs == 1) return 1;			
			}catch(Exception e) {
				e.printStackTrace();
			}
			return -1;
	}
	
	
	public int modify(PostDTO dto) {
		String sql = "update tbl_post set nickname=?,post=? where seq=?";
		try( Connection con = this.getConnection();
				 PreparedStatement psmt = con.prepareStatement(sql);){
					
				psmt.setString(1, dto.getNickname());
				psmt.setString(2, dto.getPost());
				psmt.setInt(3, dto.getSeq());
				
				int rs = psmt.executeUpdate();
				if(rs == 1) return 1;			
			}catch(Exception e) {
				e.printStackTrace();
			}
			return -1;
	}
}
