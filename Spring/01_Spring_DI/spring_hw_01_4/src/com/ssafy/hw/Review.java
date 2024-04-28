package com.ssafy.hw;

public class Review {
	private String title, content, username;
	
	public Review() {}

	public Review(String title, String content, String username) {
		super();
		this.title = title;
		this.content = content;
		this.username = username;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Override
	public String toString() {
		return "Review [title=" + title + ", content=" + content + ", username=" + username + "]";
	}
	
	
}
