package com.care.timy.warning;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.care.timy.member.MemberVO;


@Service("warningService")
@Transactional(propagation = Propagation.REQUIRED)
public class warningService {
	@Autowired
	private warningDAO warningDAO;

	/* warning TBL select all */
	public List listWarnings() throws DataAccessException{
		List warningList = null;
		warningList = warningDAO.selectAllWarningList();
		return warningList;
	}

	/* warning TBL insert */
	public int addWarning(warningVO warning) throws DataAccessException {
		return warningDAO.insertWarning(warning);
	}

	/* warning TBL update */
	public int updateWarning(warningVO warning) throws DataAccessException {
		return warningDAO.updateWarning(warning);
	}
	
	/* search warning TBL */
	public warningVO searchWarning(String timySerialNo) throws DataAccessException {
		return warningDAO.searchWarning(timySerialNo);
	}
	
	/* warning bigo update */
	public int updateWarningBigo(warningVO warning) throws DataAccessException {
		return warningDAO.updateWarningBigo(warning);
	}

} 
