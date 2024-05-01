package com.ssafy.ws.dto;

public class User {

	private String id; // 사용자 아이디
	private String pw; // 사용자 비밀번호
	private String name; // 사용자 이름
	private String email; // 사용자 이메일
	private String phone; // 사용자 전화번호
	private String profileImg = "default.png"; // 사용자 프로필 이미지명
	
	public User() {
	}
	
	public User(String id, String pw, String name, String email, String phone) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.profileImg = profileImg;
	}
	
	public User(String id, String pw, String name, String email, String phone, String profileImg) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.profileImg = profileImg;
	}
	
	// Getters and Setters
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public String getPw() {
		return pw;
	}
	
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getProfileImg() {
		return profileImg;
	}
	
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	
}
