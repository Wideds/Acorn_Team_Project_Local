package com.acorn.soso.users.info.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.soso.users.info.dto.UsersInfoDto;

@Repository
public class UsersInfoDaoImpl implements UsersInfoDao {
	@Autowired
	private SqlSession session; 

	@Override
	public List<UsersInfoDto> getWritingList(UsersInfoDto dto) {
		return session.selectList("info.getWritingList", dto);
	}
	
	@Override
	public List<UsersInfoDto> getCommentList(UsersInfoDto dto) {
		return session.selectList("info.getCommentList", dto);
	}
	
	@Override
	public List<UsersInfoDto> getSupportList(UsersInfoDto dto) {
		return session.selectList("info.getSupportList", dto);
	}

	@Override
	public int getWCount(UsersInfoDto dto) {
		return session.selectOne("info.getWCount", dto);
	}

	@Override
	public int getCCount(UsersInfoDto dto) {
		return session.selectOne("info.getCCount", dto);
	}

	@Override
	public int getSCount(UsersInfoDto dto) {
		return session.selectOne("info.getSCount", dto);
	}

}
