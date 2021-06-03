package ppeonfun.service.admin.board;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import ppeonfun.dto.Board;

@Service("admin.BoardService")
public class BoardServiceImpl implements BoardService{
	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);

	@Override
	public List<Board> getList() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}
