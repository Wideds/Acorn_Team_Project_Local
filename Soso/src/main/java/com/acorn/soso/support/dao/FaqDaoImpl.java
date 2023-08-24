package com.acorn.soso.support.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.soso.support.dto.FaqDto;

@Repository
public class FaqDaoImpl implements FaqDao{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<FaqDto> getList(FaqDto dto) {
		return session.selectList("faq.getList", dto);
	}
	@Override
	public List<FaqDto> getListCategory(FaqDto dto) {
		return session.selectList("faq.getListCategory", dto);
	}

	@Override
	public void insert(FaqDto dto) {
		session.insert("faq.insert",dto);
	}

	@Override
	public FaqDto getData(FaqDto dto) {
		
		return session.selectOne("faq.getData",dto);
	}

	@Override
	public int getCount(FaqDto dto) {
		return session.selectOne("faq.getCount",dto);
	}
	
	@Override
	public int getFAQCount(int category) {
		return session.selectOne("faq.getFAQCount", category);
	}

	@Override
	public void update(FaqDto dto) {
		
		session.update("faq.update",dto);
		
	}

	@Override
	public void delete(int faq_num) {
	
		session.delete("faq.delete",faq_num);
	}

	@Override
	public FaqDto getData(int faq_num) {
		
		return session.selectOne("faq.getData",faq_num);
	}

}
