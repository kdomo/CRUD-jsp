package kh.com.post.dto;

public class PostDTO {
	private int seq;
	private String nickname;
	private String post;
	
	public PostDTO() {}

	public PostDTO(int seq, String nickname, String post) {
		super();
		this.seq = seq;
		this.nickname = nickname;
		this.post = post;
	}
	public PostDTO(String nickname, String post) {
		super();
		this.nickname = nickname;
		this.post = post;
	}
	
	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
}
