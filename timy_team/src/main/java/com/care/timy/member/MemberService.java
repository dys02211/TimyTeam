package com.care.timy.member;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.care.timy.member.MemberVO;

public interface MemberService {
	 public List listMembers() throws DataAccessException;
	 public int addMember(MemberVO memberVO) throws DataAccessException;
	 public int updateMember(MemberVO memberVO) throws DataAccessException;
	 public int updateEmergMember(MemberVO memberVO) throws DataAccessException;
	 public int removeMember(String timySerialNo) throws DataAccessException;
	 public MemberVO searchMember(String timySerialNo) throws DataAccessException;
	 public List warningMember() throws DataAccessException;
	 // pose
	 public int updateMember2(MemberVO memberVO) throws DataAccessException;
}
