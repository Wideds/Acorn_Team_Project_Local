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
	public int getCount(UsersInfoDto dto) {
		return session.selectOne("info.getCount", dto);
	}

}
