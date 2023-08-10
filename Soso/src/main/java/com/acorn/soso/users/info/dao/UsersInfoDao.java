package com.acorn.soso.users.info.dao;

import java.util.List;

import com.acorn.soso.users.info.dto.UsersInfoDto;

public interface UsersInfoDao {
	public List<UsersInfoDto> getWritingList(UsersInfoDto dto);
	public List<UsersInfoDto> getCommentList(UsersInfoDto dto);
	public List<UsersInfoDto> getSupportList(UsersInfoDto dto);
	public int getWCount(UsersInfoDto dto);
	public int getCCount(UsersInfoDto dto);
	public int getSCount(UsersInfoDto dto);
}
