package com.kh.spring.member.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.member.domain.Member;
import com.kh.spring.member.service.MemberService;
import com.kh.spring.member.store.MemberStore;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private SqlSession session;
	
	@Autowired
	private MemberStore mStore;
	
	@Override
	public int insertMember(Member member) {
		int result = mStore.insertMember(session, member);
		return result;
	}

	@Override
	public int updateMember(Member member) {
		int result = mStore.updateMember(session, member);
		return result;
	}

	@Override
	public int deleteMember(String memberId) {
		int result = mStore.deleteMember(session, memberId);
		return result;
	}

	@Override
	public Member checkMemberLogin(Member member) {
		Member result = mStore.checkMemberLogin(session, member);
		return result;
	}

	@Override
	public Member selectOneById(String memberId) {
		Member member = mStore.selectOneById(session, memberId);
		return member;
	}

	@Override
	public List<Member> selectMembers() {
		List<Member> mList = mStore.selectMembers(session);
		return mList;
	}

}
