package com.bread.service.order;

import java.util.List;

import com.bread.app.common.FivePageNav;
import com.bread.app.vo.ItemVO;
import com.bread.app.vo.OrderVO;
import com.bread.app.vo.PageVO;

public interface OrderService {
	
	default List<ItemVO> item(PageVO vo){return null;}
	default List<OrderVO> order(PageVO vo){return null;}
	default int getTotalCount(PageVO vo) {return 0;}
	default FivePageNav setPageNav(FivePageNav pageNav, int pageNum, int pageBlock){return null;}
	default List<ItemVO> item2(PageVO vo){return null;}
	default List<OrderVO> order2(PageVO vo){return null;}
	default int getBakeryIdx(int member_idx) {return 0;}
	default int getTotalCount2(PageVO vo) {return 0;}
	default int cancel(String order_idx) {return 0;}
}
