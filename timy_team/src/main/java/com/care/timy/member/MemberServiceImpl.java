package com.care.timy.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.care.timy.member.MemberDAO;
import com.care.timy.member.MemberVO;

@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public List listMembers() throws DataAccessException {
		List membersList = null;
		membersList = memberDAO.selectAllMemberList();
		return membersList;
	}

	@Override
	public int addMember(MemberVO member) throws DataAccessException {
		return memberDAO.insertMember(member);
	}

	@Override
	public int removeMember(String timySerialNo) throws DataAccessException {
		return memberDAO.deleteMember(timySerialNo);
	}
	
	@Override
	public MemberVO searchMember(String timySerialNo) throws DataAccessException {
		return memberDAO.searchMember(timySerialNo);
	}
	
	@Override
	public List warningMember() throws DataAccessException {
		List membersListEmerg = null;
		membersListEmerg = memberDAO.warning();
		return membersListEmerg;
	}

	@Override
	public int updateMember(MemberVO memberVO) throws DataAccessException {
		// TODO Auto-generated method stub
		int result = memberDAO.updateMember(memberVO);
		return result;
	}

	@Override
	public int updateEmergMember(MemberVO memberVO) throws DataAccessException {
		// TODO Auto-generated method stub
		int result = memberDAO.updateEmergMember(memberVO);
		return result;
	}
	// pose
	@Override
	public int updateMember2(MemberVO memberVO) throws DataAccessException {
		// TODO Auto-generated method stub
		int result = memberDAO.updateMember(memberVO);
		return result;
	}
}
