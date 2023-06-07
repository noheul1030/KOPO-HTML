package kopo11.service;

import kopo11.dao.*;
import kopo11.dto.Pagination;

public interface Home_Page_Service {
	Home_PageDao getHome_PageDao();
	void setHome_PageDao(Home_PageDao home_PageDao);
	
	Pagination getPagination(int page, int countPerPage);
}
