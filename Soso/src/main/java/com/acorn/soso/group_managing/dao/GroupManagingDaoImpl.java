package com.acorn.soso.group_managing.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.soso.group.dto.GroupDto;
import com.acorn.soso.group_managing.dto.GroupManagingDto;

@Repository
public class GroupManagingDaoImpl implements GroupManagingDao{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<GroupDto> getGroupList(String manager_id) {
		return session.selectList("groupManaging.getGroupList", manager_id);
	}
	
	@Override
	public GroupDto getGroupData(int num) {
		return session.selectOne("groupManaging.getGroupData", num);
	}
	
	@Override
	public void updateGroupData(GroupDto dto) {
		session.update("groupManaging.updateGroupData", dto);
	}
	
	@Override
	public void deleteGroupData(int num) {
		session.delete("groupManaging.deleteGroupData", num);
		
	}
	
	@Override
	public List<GroupManagingDto> getApplicantList(GroupManagingDto dto) {
		return session.selectList("groupManaging.getApplicantList", dto);
	}
	
	@Override
	public List<GroupManagingDto> getRejectedApplicantList(GroupManagingDto dto) {
		return session.selectList("groupManaging.getRejectedApplicantList", dto);
	}
	
	@Override
	public List<GroupManagingDto> getMemberList(GroupManagingDto dto) {
		return session.selectList("groupManaging.getMemberList", dto);
	}
	
	@Override
	public List<GroupManagingDto> getKickedMemberList(GroupManagingDto dto) {
		return session.selectList("groupManaging.getKickedMemberList", dto);
	}

	@Override
	public void joinApprove(int num) {
		session.update("groupManaging.joinApprove", num);
	}

	@Override
	public int getMemberCount(int num) {
		return session.selectOne("groupManaging.getMemberCount", num);
	}

	@Override
	public void kick(int num) {
		session.update("groupManaging.kick", num);
	}

	@Override
	public void reject(int num) {
		session.update("groupManaging.reject", num);
	}

	@Override
	public void dropOut(int num) {
		session.update("groupManaging.dropOut", num);
	}
}
