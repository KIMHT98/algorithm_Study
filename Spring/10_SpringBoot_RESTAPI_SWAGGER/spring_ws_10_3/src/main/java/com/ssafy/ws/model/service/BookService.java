package com.ssafy.ws.model.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.ssafy.ws.model.dto.Book;
import com.ssafy.ws.model.dto.SearchCondition;

public interface BookService {
	
	//책 검색
	List<Book> searchBook(SearchCondition con);
	//책 저장
	int writeBook(Book book);
	//책 수정
	void updateBook(Book book);
	//책 상세
	Book searchByIsbn(String isbn);
	//책 삭제
	int remove(String isbn);
}
