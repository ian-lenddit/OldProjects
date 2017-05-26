<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table table-hover" id="commentList">
		<thead>
		<tr>
			<th class="no">NO</th>
			<th class="title">제목</th>
			<th class="name">이름</th>
			<th class="date">작성일</th>
			<th class="hit">HIT</th>
			<th class="addr">지역</th>
			</tr>
		</thead>
		<tbody>			
<c:forEach items="${requestScope.lvo.list}" var="cvo" >				
			<tr>
			    <td>${cvo.cno }</td>		
				<td>
					<c:choose>
					<c:when test="${sessionScope.mvo!=null}">
					<a href="${pageContext.request.contextPath}/showComment.do?cno=${cvo.cno }">${cvo.title }</a>
					</c:when>
					<c:otherwise>
					${cvo.title }
					</c:otherwise>
					</c:choose>
					</td>
					<td>${cvo.id }</td>
					<td>${cvo.time_posted }</td>
					<td>${cvo.hit }</td>
					<td>${cvo.addr }</td>	
			</tr>	
		</c:forEach>
			
		</tbody>					
	</table><br></br>
	<div class="pb_div">
	<c:set var="pb" value="${requestScope.lvo.pagingBean}"></c:set>
    
	<c:if test="${pb.previousPageGroup}">
	<a href="${pageContext.request.contextPath}/getCommentList.do?pageNo=${pb.startPageOfPageGroup-1}">
	<!-- <img src="img/left_arrow_btn.gif"> -->
	◀&nbsp; </a>	
	</c:if>
	<!-- step1. 1)현 페이지 그룹의 startPage부터 endPage까지 forEach 를 이용해 출력한다
				   2) 현 페이지가 아니면 링크를 걸어서 서버에 요청할 수 있도록 한다.
				      현 페이지이면 링크를 처리하지 않는다.  
				      PagingBean의 nowPage
				      jstl choose 를 이용  
				      예) <a href="list.do?pageNo=...">				   
	 -->		
	<c:forEach var="i" begin="${pb.startPageOfPageGroup}" 
	end="${pb.endPageOfPageGroup}">
	<c:choose>
	<c:when test="${pb.nowPage!=i}">
	<a href="${pageContext.request.contextPath}/getCommentList.do?pageNo=${i}">${i}</a> 
	</c:when>
	<c:otherwise>
	${i}
	</c:otherwise>
	</c:choose>
	&nbsp;
	</c:forEach>	 
	<!-- 
			step3 1) 다음 페이지 그룹이 있으면 이미지(img/right_arrow_btn.gif) 보여준다. 
				   		페이징빈의 nextPageGroup 이용 
				   2)  이미지에 이전 그룹의 마지막 페이지번호를 링크한다. 
				   	    hint)   endPageOfPageGroup+1 하면 됨 		 
	 -->   
	<c:if test="${pb.nextPageGroup}">
	<a href="${pageContext.request.contextPath}/getCommentList.do?pageNo=${pb.endPageOfPageGroup+1}">
	▶<!-- <img src="img/right_arrow_btn.gif"> --></a>
	</c:if>
	</div>
	<br><br>
	<c:if test="${sessionScope.mvo.id != null }">
		<input class="write_btn" type="button" value="글쓰기" onclick="javascript:location.href='${pageContext.request.contextPath}/commentRegisterView.do'">
	</c:if>
	