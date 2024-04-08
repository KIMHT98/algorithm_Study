package com.ssafy.ws.model.dao;

import java.util.List;

import com.ssafy.ws.model.dto.Board;

public interface BoardDao {
	// 전체 게시글 조회
	public List<Board> selectAll();

	// ID에 해당하는 게시글 하나 가져오기
	public Board selectOne(int id);

	// 게시글 등록
	public void insertBoard(Board board);

	// 게시글 삭제
	public void deleteBoard(int id);

	// 게시글 수정
	public void updateBoard(Board board);
}
