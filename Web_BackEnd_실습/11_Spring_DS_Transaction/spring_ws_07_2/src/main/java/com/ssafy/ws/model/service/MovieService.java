package com.ssafy.ws.model.service;

import java.util.List;

import com.ssafy.ws.model.dto.Movie;
import com.ssafy.ws.model.dto.SearchCondition;
public interface MovieService {

	int insert(Movie movie);

	Movie searchById(int id);

	List<Movie> selectAll();

	List<Movie> searchByTitle(String title);
	public List<Movie> searchByCondition(SearchCondition con);
}
