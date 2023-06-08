package kopo11.service;

import kopo11.dao.*;
import kopo11.dto.*;
import kopo11.dto.Pagination;

public class Market_ServiceImpl implements Market_Service{
	
	private MarketDao home_PageDao;

	@Override
	public MarketDao getHome_PageDao() {
		return home_PageDao;
	}

	@Override
	public void setHome_PageDao(MarketDao home_PageDao) {
		this.home_PageDao = home_PageDao;
	}

	@Override
	public Pagination getPagination(int from, int cnt) {
		
		// 1. 총 데이터 수
		int totalcount = home_PageDao.count();

		// 2. 현재 카운트 조정
		int countCheck = (cnt > totalcount || cnt < 1) ? totalcount : cnt;

		// 3. 최소 페이지 수
		int minPage = 1;

		// 4. 최대 페이지 수
		int maxPage = (totalcount % countCheck == 0) ? (totalcount / countCheck) : (totalcount / countCheck) + 1;

		// 5. C 현재 페이지 조정
		int pageCheck;
		/* 현재페이지가 0보다 작으면 */
		if (from <= minPage)
			pageCheck = minPage;
		/* 현재 페이지가 최대페이지 보다 크면 */
		else if (from > maxPage)
			pageCheck = maxPage;
		/* 1 ~ 최대페이지 */
		else
			pageCheck = from;

		// 6. S 현재 페이지의 처음
		int startPage = (((int) ((pageCheck - 1) / 10)) * 10) + 1;

		// 7. E 현재 페이지의 마지막
		int endPage = (startPage + 9 >= maxPage) ? maxPage : startPage + 9;

		// 8. <, <<
		int P = (startPage <= minPage) ? -1 : startPage - 10;
		int PP = (P == -1) ? -1 : minPage;

		// 9. >, >>
		int N = (endPage + 1 <= maxPage) ? endPage + 1 : -1;
		int NN = (N == -1) ? -1 : ((int) (maxPage / 10)) * 10 + 1;
		
		Pagination pagination = new Pagination();
		pagination.setC(pageCheck);
		pagination.setS(startPage);
		pagination.setE(endPage);
		pagination.setN(N);
		pagination.setNn(NN);
		pagination.setP(P);
		pagination.setPp(PP);
		
		return pagination;
	}

}
