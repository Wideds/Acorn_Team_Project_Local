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
	public List<GroupDto> getFinishedGroupList(String manager_id) {
		return session.selectList("groupManaging.getFinishedGroupList", manager_id);
	}
	
	@Override
	public List<GroupDto> getAllGroupList(String manager_id) {
		return session.selectList("groupManaging.getAllGroupList", manager_id);
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
	public List<GroupManagingDto> getApplicantList(int group_num) {
		return session.selectList("groupManaging.getApplicantList", group_num);
	}
	
	@Override
	public List<GroupManagingDto> getRejectedApplicantList(int group_num) {
		return session.selectList("groupManaging.getRejectedApplicantList", group_num);
	}
	
	@Override
	public List<GroupManagingDto> getMemberList(int group_num) {
		return session.selectList("groupManaging.getMemberList", group_num);
	}
	
	@Override
	public List<GroupManagingDto> getKickedMemberList(int group_num) {
		return session.selectList("groupManaging.getKickedMemberList", group_num);
	}
	
	@Override
	public void joinApprove(int num) {
		session.update("groupManaging.joinApprove", num);
	}

	@Override
	public int getMemberCount(int group_num) {
		return session.selectOne("groupManaging.getMemberCount", group_num);
	}
	
	@Override
	public void updateNowPeople(GroupDto dto) {
		session.update("groupManaging.updateNowPeople", dto);
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
	public void dropOut(GroupManagingDto dto) {
		session.update("groupManaging.dropOut", dto);
	}
	
	@Override
	public List<GroupDto> getGroupList2(String user_id) {
		return session.selectList("groupManaging.getGroupList2", user_id);
	}

	@Override
	public List<GroupDto> getFinishedGroupList2(String user_id) {
		return session.selectList("groupManaging.getFinishedGroupList2", user_id);
	}

	@Override
	public List<GroupDto> getAllGroupList2(String user_id) {
		return session.selectList("groupManaging.getAllGroupList2", user_id);
	}

	@Override
	public List<GroupManagingDto> getMateList(int num) {
		return session.selectList("groupManaging.getMateList", num);
	}

	
	
}
