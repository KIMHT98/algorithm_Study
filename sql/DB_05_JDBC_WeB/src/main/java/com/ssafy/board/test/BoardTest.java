package com.ssafy.board.test;

import com.ssafy.board.model.dao.BoardDao;
import com.ssafy.board.model.dao.BoardDaoImpl;
import com.ssafy.board.model.dto.Board;

public class BoardTest {
	public static void main(String[] args) {
		BoardDao dao = BoardDaoImpl.getInstance();
		

		
//		System.out.println(dao.selectOne(3));
		
		//등록
//		Board board = new Board("이제는 알아야한다 시리즈1", "양띵균", "이제는 Java 거의 다 알고 있어야 한다....");
//		dao.insertBoard(board);
		
		//삭제
//		dao.deleteBoard(5);
		
		//수정을 하기위한 기본 데이터가 확보된 상태!
//		Board board = dao.selectOne(4);
//		
//		board.setTitle("이제는 알아야한다 시리즈2");
//		board.setContent("BackEnd도 거의 마스터 한듯?");
//		
//		dao.updateBoard(board);
//		

		//게시글 조회수올리기
		Board board  = dao.selectOne(4);
		
		dao.updateViewCnt(board.getId());
		
		//전부가져와
		for(Board b : dao.selectAll()) {
			System.out.println(b);
		}
	}
}
