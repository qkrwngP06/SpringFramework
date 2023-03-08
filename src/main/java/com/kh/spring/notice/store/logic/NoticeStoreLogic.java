package com.kh.spring.notice.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spring.notice.domain.Notice;
import com.kh.spring.notice.domain.PageInfo;
import com.kh.spring.notice.domain.Search;
import com.kh.spring.notice.store.NoticeStore;

@Repository
public class NoticeStoreLogic implements NoticeStore{

	@Override
	public int insertNotice(SqlSession session, Notice notice) {
		int result = session.insert("NoticeMapper.insertNotice", notice);
		return result;
	}

	@Override
	public int updateNotice(SqlSession session, Notice notice) {
		int result = session.update("NoticeMapper.updateNotice", notice);
		return result;
	}

	@Override
	public int deleteNotice(SqlSession session, int noticeNo) {
		int result = session.delete("NoticeMapper.deleteNotice", noticeNo);
		return result;
	}

	@Override
	public List<Notice> selectNoticeList(SqlSession session, PageInfo pi) {
		/**
		 * RowBounds는 쿼리문을 변경하지 않고도 페이징을 처리할 수 있게 클래스
		 * RowBounds의 동작은 offset값과 limit값을 이용해서 동작함
		 * offset값은 변하는 값이고 limit값은 고정값임
		 * limit값이 한페이지당 보여주고 싶은 게시물의 갯수임
		 * offset값은 건너뛰어야 할 값임.
		 * ex) limit 10, 1~10, 0 : offset <- currentPage
		 * 				11~20  10 : offset
		 * 				21~30  20 : offset
		 * currentPage값에 따라서 0, 10, 20으로 바뀌어야하는 offset을 구하는 식
		 * int offset = (currentPage - 1) * limit;
		 */
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Notice> nList = session.selectList("NoticeMapper.selectNoticeList", null, rowBounds);
		return nList;
	}

	@Override
	public Notice selectOneById(SqlSession session, int noticeNo) {
		Notice notice = session.selectOne("NoticeMapper.selectOneById", noticeNo);
		return notice;
	}

	@Override
	public List<Notice> selectListByKeyword(SqlSession session, PageInfo pi, Search search) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Notice> searchList = session.selectList("NoticeMapper.selectListByKeyword", search, rowBounds);
		return searchList;
	}

	@Override
	public int getListCount(SqlSession session) {
		int result = session.selectOne("NoticeMapper.getListCount");
		return result;
	}

	@Override
	public int getListCount(SqlSession session, Search search) {
		int result = session.selectOne("NoticeMapper.getSearchListCount", search);
		return result;
	}

}
