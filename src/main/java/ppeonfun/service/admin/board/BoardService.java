package ppeonfun.service.admin.board;

import java.util.List;

import ppeonfun.dto.Board;

public interface BoardService {

	/**
	 * 게시판 리스트를 전부 보여준다
	 * 
	 * @return
	 */
	public List<Board> getList();

}
