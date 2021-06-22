package com.care.timy.member;

import org.springframework.stereotype.Component;

@Component("memberVO")
public class MemberVO {

	private String timySerialNo;
	private String username;
	private String yearofbirth;
	private String gender;
	private String addr;
	private String illness;
	private String mobile1;
	private String mobile2;
	private String emerg;
	
	public MemberVO() {
		
	}
	
	public MemberVO(String timySerialNo, String username, String yearofbirth, String gender, String addr, String illness, String mobile1, String mobile2, String emerg) {
		this.timySerialNo = timySerialNo;
		this.username = username;
		this.yearofbirth = yearofbirth;
		this.gender = gender;
		this.addr = addr;
		this.illness = illness;
		this.mobile1 = mobile1;
		this.mobile2 = mobile2;
		this.emerg = emerg;
	}

	public String getTimySerialNo() {
		return timySerialNo;
	}

	public void setTimySerialNo(String timySerialNo) {
		this.timySerialNo = timySerialNo;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getYearofbirth() {
		return yearofbirth;
	}

	public void setYearofbirth(String yearofbirth) {
		this.yearofbirth = yearofbirth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getIllness() {
		return illness;
	}

	public void setIllness(String illness) {
		this.illness = illness;
	}

	public String getMobile1() {
		return mobile1;
	}

	public void setMobile1(String mobile1) {
		this.mobile1 = mobile1;
	}

	public String getMobile2() {
		return mobile2;
	}

	public void setMobile2(String mobile2) {
		this.mobile2 = mobile2;
	}

	public String getEmerg() {
		return emerg;
	}

	public void setEmerg(String emerg) {
		this.emerg = emerg;
	}
	

}
