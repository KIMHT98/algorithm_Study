package com.ssafy.ws;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component(value="a")
public class Audience {
	private Movie movie;
//	@Autowired
	public Audience(Movie movie) {
		this.movie = movie;
	}
//	@Autowired
//	public void setMovie(Movie movie) {
//		this.movie = movie;
//	}
	
	public void watch() {
		System.out.println(this.movie.getInfo()+"영화를 관람합니다.");
	}
}
