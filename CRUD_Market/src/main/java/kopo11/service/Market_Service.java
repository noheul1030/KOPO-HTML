package kopo11.service;

import kopo11.dao.*;
import kopo11.dto.Pagination;

public interface Market_Service {
	MarketDao getHome_PageDao();
	void setHome_PageDao(MarketDao home_PageDao);
	
	Pagination getPagination(int page, int countPerPage);
}
