package com.study.member;

import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.member.ReviewDTO;

@Service("com.study.member.MemberServiceImpl")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;

	@Override
	public int duplicatedId(String id) {
		return mapper.duplicatedId(id);
	}

	@Override
	public int duplicatedEmail(String email) {
		return mapper.duplicatedEmail(email);
	}

	@Override
	public int create(MemberDTO dto) {
		return mapper.create(dto);
	}

	@Override
	public int loginCheck(Map<String, String> map) {
		return mapper.loginCheck(map);
	}

	@Override
	public String getGrade(String id) {
		return mapper.getGrade(id);
	}

	@Override
	public MemberDTO read(String id) {
		return mapper.read(id);
	}

	@Override
	public int update(MemberDTO dto) {
		return mapper.update(dto);
	}

	@Override
	public int updateFile(Map map) {
		return mapper.updateFile(map);
	}

	@Override
	public int total(Map map) {
		return mapper.total(map);
	}

	@Override
	public List<MemberDTO> list(Map map) {
		return mapper.list(map);
	}

	@Override
	public MemberDTO mypage(String id) {
		return mapper.mypage(id);
	}

	@Override
	public int kakaoCreate(MemberDTO dto) {
		return mapper.kakaoCreate(dto);
	}

	@Override
	public int googleCreate(MemberDTO dto) {
		return mapper.googleCreate(dto);
	}

	@Override
	public List<BbsDTO> bbs(Map map) {
		return mapper.bbs(map);
	}

	@Override
	public int btotal(Map map) {
		return mapper.btotal(map);
	}

	@Override
	public int memberDelete(String id) {
		return mapper.memberDelete(id);
	}

	@Override
	public int rtotal(Map map) {
		return mapper.rtotal(map);
	}

	@Override
	public List<ReviewDTO> review(Map map) {
		return mapper.review(map);
	}

	@Override
	public int ttotal(Map map) {
		return mapper.ttotal(map);
	}

	@Override
	public List<TicketDTO> ticket(Map map) {
		return mapper.ticket(map);
	}

	@Override
	public int duplicatedNick(String nick) {
		return mapper.duplicatedNick(nick);
	}

	@Override
	public MemberDTO readByEmail(String email) {
		return mapper.readByEmail(email);
	}

	@Override
	public int updatePassword(Map map) {
		return mapper.updatePassword(map);
	}
}
