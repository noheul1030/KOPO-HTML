package kr.ac.kopo05.service;

import java.sql.SQLException;

import kr.ac.kopo05.dao.StudentItemDao;
import kr.ac.kopo05.dao.StudentItemDaoImpl;
import kr.ac.kopo05.dto.Pagination;

public class StudentItemServiceImpl implements StudentItemService {

	private StudentItemDao studentItemDao;

	//	public StudentItemDao getStudentItemDao() {
	//		return studentItemDao;
	//	}
	//
	//	public void setStudentItemDao(StudentItemDao studentItemDao) {
	//		this.studentItemDao = studentItemDao;
	//	}

	@Override
	public Pagination getPagination(int page, int countPerPage) throws ClassNotFoundException, SQLException {
		//		studentItemDao.selectAll(0, 0);
		Pagination pagination = new Pagination();
		StudentItemDaoImpl studentItemDaoImpl = new StudentItemDaoImpl();
		int totalCount = studentItemDaoImpl.count();
		// 총 데이터의 갯수를 받아옴
		
		int endPage = 0;
		// 최종페이지 (75개를 5개면 15페이지)

		if(totalCount % countPerPage == 0) {
			endPage = totalCount / countPerPage;
		} else {
			endPage = (totalCount / countPerPage) + 1;
		}
		// 나누어 떨어지면 75 / 5 -- 15페이지
		// 나누어 떨어지지 않으면 76 / 5 --- 16페이지 이기 때문에 + 1

		if(page < 1) {
			pagination.setC(1);
		} else if (endPage < page) {
			pagination.setC(endPage);
		} else { 
			pagination.setC(page);
		}
		// 현재페이지 : 1보다 작으면 1페이지로 바꿔서 저장
		//           최종 페이지 보다 크면 최종페이지로 바꿔서 저장
		//           범위 안에 있으면 출력하고싶은 page그대로

		if(page < 11) {
			pagination.setPp(-1);
		} else {
			pagination.setPp(1); 
		}
		// pp는 제일 처음으로 돌아가는거 이기 때문에 첫페이지일때는 -1
		// 첫페이지를 제외한 나머지 일때는 1로 저장

		if(page < 11) {
			pagination.setP(-1);
		} else if(endPage < page){
			pagination.setP((((endPage - 1)  / 10) - 1) * 10 + 1); 
		} else {
			pagination.setP((((page - 1)  / 10) - 1) * 10 + 1); 
		}
		// 한페이지 앞으로 이동하는것
		// 첫페이지에서는 앞으로 갈곳이 없으므로 -1
		// 아닐때는 15 -> 1로 이동해야 되기때문에
		// 11 ~ 20 을 page - 1을 통해서 10 ~ 19로 만든후 10으로 나눠서 몫을 통일하게해줌
		// 그후에 앞으로 이동해야 되기 때문에 -1 을 하고 10을 곱하면 10의 배수로 나오기 때문에
		// + 1을 해줘서 11로 출력하게함
		
		if(page < 1) {
			pagination.setS(1);
		} else if(endPage < page) {
			pagination.setS(((endPage - 1) / 10 * 10)  + 1);
		} else {
			pagination.setS(((page - 1) / 10) * 10 + 1);
		}
		// start페이지 구하는것 11~20 페이지이면 11을 구하는 것 
		// 1보다 작은 것들은 1페이지로 출력
		// endPage를 넘어가면 마지막페이지의 시작페이지 출력
		// 그 사이 값들은 page - 1을 통해 11~20을 10~19로 같은 그룹으로 만들고
		// 10으로 나눈 몫에 10을 곱한후 1을 더해서 11, 21과 같은 값으로 저장
		
		if(page < 11) {
			pagination.setE(10);
		} else if(((page -1) / 10) >= endPage / 10) {
			pagination.setE(endPage);
		} else {
			pagination.setE(((page - 1) / 10) * 10 + 10);
		}
		// end페이지 구하는것 11~20 페이지이면 20을 구하는 것 
		// 1보다 작은 것들은 10페이지로 출력
		// endPage를 넘어가면 마지막페이지의 endPage 출력
		// 그 사이 값들은 page - 1을 통해 11~20을 10~19로 같은 그룹으로 만들고
		// 10으로 나눈 몫에 10을 곱한후 10을 더해서 10, 20과 같은 값으로 저장
		
		if(page < 11) {
			pagination.setN(11);
		} else if (page < (endPage / 10 * 10)) {
			pagination.setN((((page - 1)  / 10) + 1) * 10 + 1); 
		} else if ((endPage / 10 * 10) < page){
			pagination.setN(-1);
		}
		// 한페이지 뒤로 이동하는것
		// 마지막페이지에서는 뒤로 갈곳이 없으므로 -1
		// 아닐때는 5 -> 11로 이동해야 되기때문에
		// 11 ~ 20 을 page - 1을 통해서 10 ~ 19로 만든후 10으로 나눠서 몫을 통일하게해줌
		// 그후에 뒤로 이동해야 되기 때문에 +1 을 하고 10을 곱하면 10의배수로 나오기 때문에
		// + 1을 해줘서 11로 출력하게함

		if((endPage / 10 * 10) < page) {
			pagination.setNn(-1);
		} else {
			pagination.setNn(((endPage - 1) / 10 * 10) + 1);
		}
		// nn는 제일 마지막으로 돌아가는거 이기 때문에 마지막페이지일때는 -1
		// 마지막페이지를 제외한 나머지 일때는 최종페이지의 1번으로 저장
		
		return pagination;
	}

	@Override
	public StudentItemDao getStudentItemDao() {
		return studentItemDao;
	}

	@Override
	public void setStudentItemDao(StudentItemDao studentItemDao) {
		// TODO Auto-generated method stub

	}
}
