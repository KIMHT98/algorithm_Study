package com.ssafy.ws.service;

import java.util.List;

import com.ssafy.ws.model.dto.Book;

public interface BookService {
	void writeBook(Book book);
	List<Book> getBookList();
	Book readBook(String isbn);
	void modifyBook(Book book);
	void removeBook(String isbn);
}
