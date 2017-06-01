<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/member/login_register.css">

<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$('.message a').click(function() {
		$('form').animate({
			height : "toggle",
			opacity : "toggle"
		}, "slow");
	});
	$(document).ready(function() {
		$(".logc").click(function() {
			if ($("#id").val() == "") {
				alert("아이디를 입력하세요");
				return false;

			}
			else if ($("#password").val().trim() == "") {
				alert("비밀번호를 입력하세요");
				return false;
			}else{
				var result = confirm("로그인하시겠습니까?");
				if (result) {
					return true;
				} else {
					return false;

				}
			}
		});
	});
</script>
<section id="login">
	<div class="container">
		<div class="row">
			<div class="login-page">
				<div class="form">
					<form action="${pageContext.request.contextPath }/login.do"
						method="post">
						<input id="id" name="id" required="required" type="text"
							placeholder="아이디" /><br> <input type="password"
							name="password" id="password" required="required"
							placeholder="비밀번호"><br> <span id="idCheckView"></span>
						<a href="${pageContext.request.contextPath }/member/forgotId.do">아이디찾기</a><br>
						<a href="${pageContext.request.contextPath }/member/forgotPass.do">비밀번호찾기</a><br>
						<button id="log" class="logc">로그인</button>
						<p class="message">
							Not registered? <a
								href="${pageContext.request.contextPath}/member/registers.do">Create
								an account</a>
						</p>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>

