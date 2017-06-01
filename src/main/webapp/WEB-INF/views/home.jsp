<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
//총 게시글,멤버수,물품수	
	$.ajax({
		type:"post",
		url:"${pageContext.request.contextPath}/getCountBoardMain.do",
		dataType:"json",
		success:function(data){
			$("#CountBoardView").html(data);
		}
	});
	$.ajax({
		type:"post",
		url:"${pageContext.request.contextPath}/getCountCommentMain.do",
		dataType:"json",
		success:function(data){
			$("#CountCommentView").html(data);
		}
	});
	$.ajax({
		type:"post",
		url:"${pageContext.request.contextPath}/getCountMemberMain.do",
		dataType:"json",
		success:function(data){
			$("#CountMemberView").html(data);
		}
	});
});//ready
</script>



<section id="action" class="responsive">
	<div class="vertical-center">
		<div class="container">
			<div class="row">
				<div class="col-sm-2"></div>
				<div class="col-sm-8 text-center padding wow fadeIn"
					data-wow-duration="1000ms" data-wow-delay="600ms">
					<form action="${pageContext.request.contextPath}/search.do" method="post" role="form">
						<input type="text" class="search-form" autocomplete="off"
							placeholder="검색하기" size="80" name="word"> <i class=""></i>
							<button type="submit" class="btn btn-info">검색</button>
					</form>
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>
	</div>
</section>
<!--/#action-->
<div class="col-sm-12">
                    <div class="time-count">
                        <ul id="countdown">
                            <li class="angle-one">
                                <span id="CountMemberView" class="days time-font"></span>
                                <p>전체회원 수</p>
                            </li>
                            <li class="angle-two">
                                <span id="CountBoardView" class="hours time-font"></span>
                                <p>전체물품 수</p>
                            </li>
                            <li class="angle-three">
                                <span id="CountCommentView" class="minutes time-font"></span>
                                <p class="minute">전체후기 수</p>
                            </li>                            
                            <li class="angle-four">
                                <span class="seconds time-font">${requestScope.count}</span>
                                <p>오늘의 방문자수</p>
                            </li>               
                        </ul>   
                    </div>
                </div>
