package com.care.timy.member;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.care.timy.member.MemberVO;


public interface MemberDAO {
	 public List selectAllMemberList() throws DataAccessException;
	 public int insertMember(MemberVO memberVO) throws DataAccessException ;
	 public int updateMember(MemberVO memberVO) throws DataAccessException ;
	 public int updateEmergMember(MemberVO memberVO) throws DataAccessException ;
	 public int deleteMember(String timySerialNo) throws DataAccessException;
	 public MemberVO searchMember(String timySerialNo) throws DataAccessException;
	 public List warning() throws DataAccessException;
	 
	 // pose
	 public int updateMember2(MemberVO memberVO) throws DataAccessException ;
}
