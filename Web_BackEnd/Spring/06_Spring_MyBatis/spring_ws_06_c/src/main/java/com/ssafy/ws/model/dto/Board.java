package com.ssafy.ws.model.dto;

import java.util.Date;

public class Board {
	private int id; // 게시글 아이디
	private String title; // 게시글 제목
	private String content; // 게시글 내용
	private Date created; // 게시글 등록일

	public Board() {
	}

	public Board(int id, String title, String content, Date created) {
		this.id = id;
		this.title = title;
		this.content = content;
		this.created = created;
	}

	// Getters and Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}
	
	@Override
	public String toString() {
		return "Board [id=" + id + ", title=" + title + ", content=" + content + ", created=" + created + "]";
	}
}
