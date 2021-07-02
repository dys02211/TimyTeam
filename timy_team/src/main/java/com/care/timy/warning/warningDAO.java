package com.care.timy.warning;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;




@Repository("warningDAO")
public class warningDAO {
	@Autowired
	private SqlSession sqlSession;

	/* warning TBL select all */
	public List selectAllWarningList() throws DataAccessException {
		List<warningVO> warningsList = null;
		warningsList = sqlSession.selectList("mapper.warning.selectAllWarningList");
		return warningsList;
	}

	/* warning TBL insert */
	public int insertWarning(warningVO warningVO) throws DataAccessException {
		int result = sqlSession.insert("mapper.warning.insertWarning", warningVO);
		return result;
	}

	/* warning TBL update */
	public int updateWarning(warningVO warningVO) throws DataAccessException {
		int result = sqlSession.insert("mapper.warning.updateWarning", warningVO);
		return result;
	}
	
	/* search warning TBL */
	public warningVO searchWarning(String timySerialNo) throws DataAccessException {
		warningVO vo = (warningVO) sqlSession.selectOne("mapper.warning.selectWarningById", timySerialNo);
		return vo;
	}
	
	/* warning bigo update */
	public int updateWarningBigo(warningVO warningVO) throws DataAccessException {
		int result = sqlSession.insert("mapper.warning.updateWarningBigo", warningVO);
		return result;
	}

} 
