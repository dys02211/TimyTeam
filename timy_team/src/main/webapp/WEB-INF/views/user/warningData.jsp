<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:forEach var="warning" items="${warningList}" >     
<tr align="center">
	<td>${warning.timySerialNo}</td>
	<td>${warning.warningDate}</td>
	<td>${warning.solYN}</td>		
</tr>
</c:forEach> 