package com.ssafy.ws.test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.ssafy.ws.model.dao.MovieDao;
import com.ssafy.ws.model.dto.Movie;

public class MovieTest {
	public static void main(String[] args) {
		ApplicationContext context = new GenericXmlApplicationContext("applicationContext.xml");
		MovieDao movie = context.getBean(MovieDao.class);
		System.out.println(movie.searchByTitle("기생충"));
		movie.insert(new Movie(0,"다크나이트","스티븐스필버그","액션",250,null,null));
		List<Movie> movies = movie.selectAll();
		for(Movie m:movies) {
			System.out.println(m);
		}
	}
}
