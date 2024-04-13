package com.ssafy.board.service;

import java.util.List;

import com.ssafy.board.model.dto.Board;

public interface BoardService {
	//전체글
	List<Board> getList();
	//게시글 하나
	Board getBoard(int id);
	//게시글 작성
	void writeBoard(Board board);
	//게시글 수정
	void modifyBoard(Board board);
	//게시글 삭제
	void removeBoard(int id);
}
