package com.acorn.soso.users.info.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.acorn.soso.users.info.dao.UsersInfoDao;
import com.acorn.soso.users.info.dto.UsersInfoDto;

@Service
public class UsersInfoServiceImpl implements UsersInfoService {
	@Autowired
	private UsersInfoDao infoDao;

	@Override
	public void getWritingList(Model model) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		final int PAGE_ROW_COUNT = 5;
		final int PAGE_DISPLAY_COUNT = 5;
		
		String id = request.getSession().getAttribute("id").toString();
		
		int pageNum = 1;
		
		String strPageNum = request.getParameter("pageNum");
		if(strPageNum != null) {
			pageNum = Integer.parseInt(strPageNum);
		}
		
		int startRowNum = 1 + (pageNum-1) * PAGE_ROW_COUNT;
		int endRowNum = pageNum * PAGE_ROW_COUNT;
		
		UsersInfoDto dto = new UsersInfoDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		dto.setWriter(id);
		
		List<UsersInfoDto> list = infoDao.getWritingList(dto);
		
		int totalRow = infoDao.getCount(dto);
        int startPageNum = 1 + ((pageNum - 1) / PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;
        int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;

        int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);
        if (endPageNum > totalPageCount) {
            endPageNum = totalPageCount;
        }
		
		model.addAttribute("list", list);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("startPageNum", startPageNum);
        model.addAttribute("endPageNum", endPageNum);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("totalRow", totalRow);
	}

	@Override
	public void getCommentList(Model model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getSupportList(Model model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getBookmarkList(Model model) {
		// TODO Auto-generated method stub
		
	}

}
