<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

        <div class="inner-wrapper">
        		<c:forEach var="tmp" items="${list}" >
        		<div class="mate_content_list">
	               <div class="mate_contents">
	                   <a href="${pageContext.request.contextPath}/group/group_page?num=${tmp.num }">
	                       <div class="mate_content_img">
	                           <img src="${pageContext.request.contextPath}${tmp.img_path}">
	                           <!-- 신청 마감일시 마감버튼 보이게 -->
								<c:set var="now" value="<%= new java.util.Date() %>" />
								<c:set var="nowDate"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 
								<c:choose>
									<c:when test="${tmp.deadline_dt lt nowDate}">
										<div class="deadline_btn">마감</div>
									</c:when>
									<c:otherwise>
									</c:otherwise>
								</c:choose>	                                  
	                       </div>
	                       <div class="mate_content_text">
	                           <p class="mate_content_title">${tmp.name}</p>
	                           <p>모임장 ${tmp.manager_id}</p>
	                           <p>조회수 ${tmp.viewCount}</p>
	                           <p class="mate_content_date">${tmp.meeting_time}ㆍ금요일ㆍ${tmp.meeting_loc }</p>
	                       </div>
	                   </a>
	               </div>
	           </div>
        	</c:forEach>	
        </div>