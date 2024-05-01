package com.ssafy.ws;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component
public class Reader {
	private Book book;
	
	@Autowired
	public Reader(@Qualifier("Comic")Book book) {
		this.book=book;
	}
	
	public void read() {
		System.out.println(this.book.getInfo()+"을(를) 열심히 읽습니다.");
	}
	
}
