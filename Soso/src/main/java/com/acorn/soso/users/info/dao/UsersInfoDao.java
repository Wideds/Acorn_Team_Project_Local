package com.acorn.soso.users.info.dao;

import java.util.List;

import com.acorn.soso.users.info.dto.UsersInfoDto;

public interface UsersInfoDao {
	public List<UsersInfoDto> getWritingList(UsersInfoDto dto);
	public int getCount(UsersInfoDto dto);
}
