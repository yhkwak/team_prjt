package com.bread.service.likes;

import org.springframework.stereotype.Service;

import com.bread.app.dao.LikesDAO;
import com.bread.app.vo.LikesVO;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service("blAdd")
public class LikesAddService implements LikesService {
	
	private LikesDAO dao;
	
	@Override
	public int addBL(LikesVO lvo) {
		int result = 0;
			result = dao.addBL(lvo);
		return result;
	}
}
