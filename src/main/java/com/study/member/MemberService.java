package com.study.member;

import java.util.List;

import java.util.Map;

import com.study.member.ReviewDTO;

public interface MemberService {

	int duplicatedId(String id);

	int duplicatedEmail(String email);

	int create(MemberDTO dto);

	int loginCheck(Map<String, String> map);

	String getGrade(String string);

	MemberDTO read(String id);

	int update(MemberDTO dto);

	int updateFile(Map map);

	int total(Map map);

	List<MemberDTO> list(Map map);

	MemberDTO mypage(String id);

	int kakaoCreate(MemberDTO dto);

	int googleCreate(MemberDTO dto);

	List<BbsDTO> bbs(Map map);

	int btotal(Map map);

	int memberDelete(String id);

	int rtotal(Map map);

	List<ReviewDTO> review(Map map);

	int ttotal(Map map);

	List<TicketDTO> ticket(Map map);

	int duplicatedNick(String nick);

	MemberDTO readByEmail(String email);

	int updatePassword(Map map);
}
