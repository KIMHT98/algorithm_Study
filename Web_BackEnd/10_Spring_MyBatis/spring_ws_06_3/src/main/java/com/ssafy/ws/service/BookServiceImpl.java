package com.ssafy.ws.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.ws.model.dao.BookDao;
import com.ssafy.ws.model.dto.Book;

@Service
public class BookServiceImpl implements BookService {
	
	private final BookDao bookdao;
	
	@Autowired
	public BookServiceImpl(BookDao bookdao) {
		this.bookdao = bookdao;
	}
	
	@Override
	public void writeBook(Book book) {
		bookdao.insert(book);
	}

	@Override
	public List<Book> getBookList() {
		return bookdao.selectAll();
	}

	@Override
	public Book readBook(String isbn) {
		return bookdao.select(isbn);
	}

	@Override
	public void modifyBook(Book book) {
		bookdao.update(book);
	}

	@Override
	public void removeBook(String isbn) {
		bookdao.delete(isbn);
	}
}
