package com.ssafy.ws.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ssafy.ws.model.dto.Movie;
import com.ssafy.ws.model.dto.User;
import com.ssafy.ws.model.service.MovieService;
import com.ssafy.ws.model.service.UserService;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;

@Tag(name="movie-rest-controller", description = "Movie Rest Controller")
@RestController
@RequestMapping("/movieapi")
@CrossOrigin("*")
public class MovieRestController {
	@Autowired
	MovieService ms;

	@Autowired
	UserService us;

	// GetMapping
	// search(READ)
	@GetMapping("/movie/{title}")
	@Operation(summary="{title}에 해당하는 영화 정보를 반환한다.", description="영화 정보 조회")
	public ResponseEntity<?> select(@PathVariable("title") String title) {
		List<Movie> m = ms.search(title);
		if (m == null)
			return null;
		else
			return new ResponseEntity<>(m, HttpStatus.OK);
	}

	@GetMapping("/movie")
	@Operation(summary="등록된 모든 영화 정보를 반환한다.", description="전체 영화 조회")
	public ResponseEntity<?> selectAll() {
		List<Movie> m = ms.selectAll();
		if (m == null)
			return null;
		else
			return new ResponseEntity<>(m, HttpStatus.OK);
	}

	// PostMapping
	// insert(CREATE)
	@PostMapping("/movie")
	@Operation(summary="movie 객체를 저장한다.", description="영화 삽입")
	public ResponseEntity<?> insert(@RequestBody Movie movie, @RequestPart(value="file",required = false) MultipartFile file) {
		try {
			int result = ms.insert(movie, file);
			return new ResponseEntity<>(result,HttpStatus.OK);
		} catch (IllegalStateException | IOException e) {
			return exceptionHandling(e);
		}
	}

	// DeleteMapping
	// delete(DELETE)
	@DeleteMapping("/movie/{id}")
	@Operation(summary="movie객체를 삭제한다.", description="영화 삭제")
	public ResponseEntity<?> delete(@PathVariable("id") int id) {
		int result = ms.delete(id);
		return new ResponseEntity<>(result,HttpStatus.OK);
	}

	private ResponseEntity<String> exceptionHandling(Exception e) {
		e.printStackTrace();
		return new ResponseEntity<String>("sorry: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// GetMapping
	// select(READ)
	@GetMapping("/user/{id}")
	@Operation(summary="{id}에 해당하는 user를 반환", description="id로 user 조회")
	public ResponseEntity<?> selectUser(@PathVariable("id") String id) {
		User user = us.select(id);
		return new ResponseEntity<>(user, HttpStatus.OK);
	}
}
