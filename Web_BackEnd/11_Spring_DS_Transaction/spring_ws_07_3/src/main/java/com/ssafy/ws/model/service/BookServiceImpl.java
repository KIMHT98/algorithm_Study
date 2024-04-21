package com.ssafy.ws.model.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	private static final Logger logger = LoggerFactory.getLogger(BookServiceImpl.class);
	/**
	 * has a 관계로 사용할 BookDao 타입의 dao를 선언한다.
	 */
	private BookDao bDao;
	/**
	 * 파일 업로드 경로를 설정하기 위해 ResourceLoader를 주입받는다.
	 */
	@Autowired
	ResourceLoader resLoader;

	/**
	 * setter를 통해 BookDao를 주입받는다.
	 * 
	 * @Autowired를 통해 BookDao 타입의 빈을 주입 받는다.
	 * @param bDao
	 */
	@Autowired
	public void setBookDao(BookDao bDao) {
		this.bDao = bDao;
	}

	public BookDao getBookDao() {
		return bDao;
	}

	@Override
	@Transactional
	public int insert(Book book) throws IllegalStateException, IOException {
		return bDao.insert(book);
	}


	@Override
	public Book select(String isbn) {
		return bDao.select(isbn);
	}

	@Override
	public List<Book> search(SearchCondition condition) {
		return bDao.search(condition);
	}

//	@Override
//	public int getBookListCnt(SearchCondition condition) throws Exception {
//		return bDao.getBookListCnt(condition);
//	}

	/**
	 * 리스트에 페이징을 적용하기 위한 메서드
	 * Map에 books를 키로 화면에 표시할 Book 목록을 저장하고
	 * 
	 * @param condition
	 * @return
	 */
	@Override
	public Map<String, Object> pagingSearch(SearchCondition condition) {
		Map<String, Object> resultMap = new HashMap();
		
		//페이징 처리를 위해 필요한 정보를 가져옴
		int currentPage = condition.getCurrentPage();
		int totalCount = bDao.getTotalSearchCount(condition);
		int countPerPage = condition.getCountPerPage();
		int offset = condition.getOffset();
		
		//현재 페이지에 해당하는 책 가져오기
		List<Book> books = bDao.search(condition);
		PageNavigation navigation = new PageNavigation(currentPage,totalCount);
		
		//맵에 정보 저장
		resultMap.put("books", books);
		resultMap.put("navigation", navigation);
		
		return resultMap;
	}

//	@Override
//	public int getTotalSearchCount(SearchCondition condition) {
//		return bDao.getTotalSearchCount(condition);
//	}

}
