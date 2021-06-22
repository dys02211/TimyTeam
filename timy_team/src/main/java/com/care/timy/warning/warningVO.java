package com.care.timy.warning;

import java.sql.Date;

import org.springframework.stereotype.Component;

/**
 * @author Dia
 *
 */
@Component("warningVO")
public class warningVO {
	private String timySerialNo;
	private Date warningDate;
	private String solYN;				// 위급 메세지
	
	public String getTimySerialNo() {
		return timySerialNo;
	}
	public void setTimySerialNo(String timySerialNo) {
		this.timySerialNo = timySerialNo;
	}
	public Date getWarningDate() {
		return warningDate;
	}
	public void setWarningDate(Date warningDate) {
		this.warningDate = warningDate;
	}
	public String getSolYN() {
		return solYN;
	}
	public void setSolYN(String solYN) {
		this.solYN = solYN;
	}
	
	
	
}
