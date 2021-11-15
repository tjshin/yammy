package com.study.member;

import java.util.List;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



//Service 인터페이스 구현 클래스

@Service("com.study.member.MemberServiceImpl")  //ComponentScan에 의해서 지정한 이름(패키지포함)의 객체가 생성됨
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper mapper; //서비스는 Mapper를 사용하기 때문에 연결하기 위해(@Autowired로 미리 생성된 Mapper를 가져옴)

	@Override
	public int duplicatedId(String id) {
		// TODO Auto-generated method stub
		return mapper.duplicatedId(id);
	}

	@Override
	public int duplicatedEmail(String email) {
		// TODO Auto-generated method stub
		return mapper.duplicatedEmail(email);
	}

	@Override
	public int create(MemberDTO dto) {
		// TODO Auto-generated method stub
		return mapper.create(dto);
	}

	@Override
	public int loginCheck(Map<String, String> map) {
		// TODO Auto-generated method stub
		return mapper.loginCheck(map);
	}

	@Override
	public String getGrade(String id) {
		// TODO Auto-generated method stub
		return mapper.getGrade(id);
	}

	@Override
	public MemberDTO read(String id) {
		// TODO Auto-generated method stub
		return mapper.read(id);
	}

	@Override
	public int update(MemberDTO dto) {
		// TODO Auto-generated method stub
		return mapper.update(dto);
	}

	@Override
	public int updateFile(Map map) {
		// TODO Auto-generated method stub
		return mapper.updateFile(map);
	}

	@Override
	public int total(Map map) {
		// TODO Auto-generated method stub
		return mapper.total(map);
	}

	@Override
	public List<MemberDTO> list(Map map) {
		// TODO Auto-generated method stub
		return mapper.list(map);
	}

	@Override
	public MemberDTO mypage(String id) {
		// TODO Auto-generated method stub
		return mapper.mypage(id);
	}


	@Override
	public int kakaoCreate(MemberDTO dto) {
		// TODO Auto-generated method stub
		return mapper.kakaoCreate(dto);
	}

	@Override
	public int googleCreate(MemberDTO dto) {
		// TODO Auto-generated method stub
		return mapper.googleCreate(dto);
	}

	@Override
	public List<BbsDTO> bbs(Map map) {
		// TODO Auto-generated method stub
		return mapper.bbs(map);
	}

	@Override
	public int btotal(Map map) {
		// TODO Auto-generated method stub
		return mapper.btotal(map);
	}
}
