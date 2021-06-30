package com.care.timy.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.care.timy.member.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List selectAllMemberList() throws DataAccessException {
		List<MemberVO> membersList = null;
		membersList = sqlSession.selectList("mapper.member.selectAllMemberList");
		return membersList;
	}

	@Override
	public int insertMember(MemberVO memberVO) throws DataAccessException {
		int result = sqlSession.insert("mapper.member.insertMember", memberVO);
		return result;
	}

	@Override
	public int deleteMember(String timySerialNo) throws DataAccessException {
		int result = sqlSession.delete("mapper.member.deleteMember", timySerialNo);
		return result;
	}

	@Override
	public MemberVO searchMember(String timySerialNo) throws DataAccessException {
		// TODO Auto-generated method stub
		MemberVO vo = (MemberVO) sqlSession.selectOne("mapper.member.selectMemberById", timySerialNo);
		return vo;
	}
	
	@Override
	public List warning() throws DataAccessException {
		List<MemberVO> membersListEmerg = null;
		membersListEmerg = sqlSession.selectList("mapper.member.selectMemberByWarning");
		return membersListEmerg;
	}
	

	@Override
	public int updateMember(MemberVO memberVO) throws DataAccessException {
		// TODO Auto-generated method stub
		int result = sqlSession.insert("mapper.member.updateMember", memberVO);
		return result;
	}

	@Override
	public int updateEmergMember(MemberVO memberVO) throws DataAccessException {
		// TODO Auto-generated method stub
		int result = sqlSession.insert("mapper.member.updateEmergMember", memberVO);
		return result;
	}
	
	
	// pose 
	@Override
	public int updateMember2(MemberVO memberVO) throws DataAccessException {
		// TODO Auto-generated method stub
		int result = sqlSession.insert("mapper.member.updateMember", memberVO);
		return result;
	}
}
