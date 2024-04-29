package com.ssafy.ws.model.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.ssafy.ws.model.dao.BookDao;
import com.ssafy.ws.model.dto.Book;
import com.ssafy.ws.model.dto.SearchCondition;
import com.ssafy.ws.util.PageNavigation;

/**
 * 빈으로 등록될 수 있도록 @Service를 선언한다.
 *
 */
@Service
public class BookServiceImpl implements BookService {

	private final BookDao bDao;
	@Autowired
	public BookServiceImpl(BookDao bDao) {
		this.bDao = bDao;
	}
	@Override
	public List<Book> searchBook(SearchCondition con) {
		// TODO Auto-generated method stub
		return bDao.select(con);
	}

	@Override
	public int writeBook(Book book) {
		// TODO Auto-generated method stub
		return bDao.insert(book);
	}

	@Override
	public void updateBook(Book book) {
		bDao.update(book);
	}

	@Override
	public Book searchByIsbn(String isbn) {
		// TODO Auto-generated method stub
		return bDao.selectOne(isbn);
	}

	@Override
	public int remove(String isbn) {
		// TODO Auto-generated method stub
		return bDao.delete(isbn);
	}

}
