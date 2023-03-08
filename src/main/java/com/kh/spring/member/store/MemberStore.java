package com.kh.spring.member.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.spring.member.domain.Member;

public interface MemberStore {

	/**
	 * 멤버 등록 Store
	 * @param session
	 * @param member
	 * @return int
	 */
	public int insertMember(SqlSession session, Member member);
	
	/**
	 * 멤버 정보 수정 Store
	 * @param session
	 * @param member
	 * @return int
	 */
	public int updateMember(SqlSession session, Member member);
	
	/**
	 * 멤버 탈퇴 Store
	 * @param memberId
	 * @return int
	 */
	public int deleteMember(SqlSession session, String memberId);
	
	/**
	 * 멤버 로그인 Store
	 * @param session
	 * @param member
	 * @return Member
	 */
	public Member checkMemberLogin(SqlSession session, Member member);
	
	/**
	 * 아이디로 멤버조회 Store
	 * @param session
	 * @param memberId
	 * @return Member
	 */
	public Member selectOneById(SqlSession session, String memberId);

	/**
	 * 회원 목록 조회 Store
	 * @return List<Member>
	 */
	public List<Member> selectMembers(SqlSession session);
}
