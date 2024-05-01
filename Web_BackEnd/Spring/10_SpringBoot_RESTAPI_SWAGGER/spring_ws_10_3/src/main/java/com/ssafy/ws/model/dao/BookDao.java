package com.ssafy.ws.model.dao;

import java.util.List;

import com.ssafy.ws.model.dto.Book;
import com.ssafy.ws.model.dto.SearchCondition;

public interface BookDao {
	
	//검색 조건에 맞는 책 검색
	List<Book> select(SearchCondition con);
	//책 저장
	int insert(Book book);
	//책 수정
	void update(Book book);
	//책 상세조회
	Book selectOne(String isbn);
	//책 삭제
	int delete(String isbn);
}
