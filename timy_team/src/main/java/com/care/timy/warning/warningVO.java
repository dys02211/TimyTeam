package com.care.timy.warning;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import org.springframework.stereotype.Component;

@Component("warningVO")
public class warningVO {
	private String timySerialNo;
	private Timestamp warningDate;
	private Timestamp solDate;
	private String solYN;				// 위급 메세지
	private String bigo;

	public void setWarningDate(Timestamp warningDate) {
		this.warningDate = warningDate;
	}
	public Timestamp getWarningDate() {			
		return warningDate;
	}
	
	public void setSolDate(Timestamp solDate) {
		this.solDate = solDate;
	}
	public Timestamp getSolDate() {
		return solDate;
	}
	
	
	public String getBigo() {
		return bigo;
	}
	public void setBigo(String bigo) {
		this.bigo = bigo;
	}
	public String getTimySerialNo() {
		return timySerialNo;
	}
	public void setTimySerialNo(String timySerialNo) {
		this.timySerialNo = timySerialNo;
	}	
	public String getSolYN() {
		return solYN;
	}
	public void setSolYN(String solYN) {
		this.solYN = solYN;
	}	
}
