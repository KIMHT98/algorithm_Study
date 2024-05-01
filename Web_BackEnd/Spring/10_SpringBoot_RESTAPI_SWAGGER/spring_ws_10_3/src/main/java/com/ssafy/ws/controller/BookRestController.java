package com.ssafy.ws.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.ws.model.dto.Book;
import com.ssafy.ws.model.dto.SearchCondition;
import com.ssafy.ws.model.service.BookService;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;

@Tag(name="book-rest-controller", description="Book Rest Controller")
@RestController
@RequestMapping("/bookapi")
@CrossOrigin("*")
public class BookRestController {
	
	private final BookService bService;
	@Autowired
	public BookRestController(BookService bService) {
		this.bService = bService;
	}
	private ResponseEntity<?> exceptionHandling(Exception e) {
		e.printStackTrace();
		return new ResponseEntity<String>("Sorry: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping("/book")
	@Operation(summary="query string에 해당하는 검색 조건에 해당하는 도서 목록을 반환한다.", description="도서 검색")
	public ResponseEntity<?> searchBook(@ModelAttribute SearchCondition con){
		try {
			List<Book> books = bService.searchBook(con);
			if(books == null) {
				return new ResponseEntity<>(HttpStatus.NO_CONTENT);
			}else {
				return new ResponseEntity<>(books, HttpStatus.OK);
			}
		}catch(Exception e) {
			return exceptionHandling(e);
		}
	}
	@PostMapping("/book")
	@Operation(summary="Book객체를 저장한다.", description="도서 등록")
	public ResponseEntity<?> writeBook(@RequestBody Book book){
		try {
			int result = bService.writeBook(book);
			return new ResponseEntity<>(result, HttpStatus.OK);
		}catch(Exception e) {
			return exceptionHandling(e);
		}
	}
	@PutMapping("/book/{isbn}")
	@Operation(summary="Book객체를 수정한다.", description="도서 수정")
	public ResponseEntity<Void> updateBook(@PathVariable("isbn")String isbn, @RequestBody Book book){
		book.setIsbn(isbn);
		bService.updateBook(book);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	@GetMapping("/book/{isbn}")
	@Operation(summary="{isbn}에 해당하는 도서 정보를 반환", description="도서 상세 조회")
	public ResponseEntity<?> searchByInsb(@PathVariable("isbn") String isbn){
		try {
			Book book = bService.searchByIsbn(isbn);
			if(book==null) {
				return new ResponseEntity<>(HttpStatus.NO_CONTENT);
			}else {
				return new ResponseEntity<>(book, HttpStatus.OK);
			}
		}catch(Exception e) {
			return exceptionHandling(e);
		}
	}
	@DeleteMapping("/book/{isbn}")
	@Operation(summary="Book 객체를 삭제", description="도서 삭제")
	public ResponseEntity<?> removeBook(@PathVariable("isbn") String isbn){
		try {
			int result = bService.remove(isbn);
			return new ResponseEntity<>(result, HttpStatus.OK);
		}catch(Exception e) {
			return exceptionHandling(e);
		}
	}
	
}
