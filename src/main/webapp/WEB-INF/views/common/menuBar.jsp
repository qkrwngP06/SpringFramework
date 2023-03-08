<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<style>
			h1{
				text-align: center;
			}
			ul {
				list-style-type: none;
			}
		</style>
	</head>
	<body>
		<h1>Welcome to Spring Web!!</h1>
		<c:if test="${sessionScope.loginUser eq null }">
			<div>
				<form action="/member/login.kh" method="post" class="form-inline my-2 my-lg-0">
					<ul>
						<li>
							<input type="text" name="member-id" id="id" class="form-control mr-sm-2" placeholder="ID">
						</li>
						<li>
							<input type="password" name="member-pw" id="pw" class="form-control mr-sm-2" placeholder="PW">
						</li>
					</ul>
					<div>
						<input type="submit" value="로그인" class="btn btn-outline-success my-2 my-sm-0">
						<a href="/member/registerView.kh">회원가입</a>
					</div>
				</form>
			</div>
		</c:if>
		<c:if test="${sessionScope.loginUser ne null }">
			<div id="login-wrapper">	
				<b>${sessionScope.loginUser.memberName }</b>님 환영합니다! <br>
				<a href="/member/mypage.kh">마이페이지</a>
				<a href="/member/logout.kh">로그아웃</a>
			</div>
		</c:if>
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	  	  <a class="navbar-brand" href="#">NANCHO's</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
      </button>

<div class="collapse navbar-collapse" id="navbarSupportedContent">
<ul class="navbar-nav mr-auto">
<li class="nav-item active">
<a class="nav-link" href="/home.kh">Home <span class="sr-only">(current)</span></a>
</li>
<li class="nav-item">
<a class="nav-link" href="/notice/list.kh">공지사항</a>
</li>
      
<li class="nav-item">
        <a class="nav-link" href="#">자유게시판</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/member/list.kh">관리자페이지</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
   
  </div>
</nav>
      <script>
        function goHome() {
          location.href = "/home.kh";
        }

        function goNoticeLost() {
          location.href = "/notice/list.kh";
          return false;
        }
      </script>
	</body>
</html>