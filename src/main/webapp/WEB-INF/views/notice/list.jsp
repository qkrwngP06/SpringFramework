<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 목록</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	</head>
	
    <style>
       /*  table{
            border: 1px solid black;
        }
        th, td {
            border: 1px solid black;
        }
        th{
            background-color: black;
            color:greenyellow;
        } */
        select{
        	width: 150px;
        	height: 40px;
        	color: #999;
        	border: 2px solid #ddd;
        }
      .pageNavi{
            text-decoration: none;
            color: grey;
        }
        .search{
        	display: flex;
	  		justify-content : center;
        }
    </style>
	<body>
        <jsp:include page="../common/menuBar.jsp"></jsp:include>
        <h1>공지사항 목록</h1>
        <div class="container">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성날짜</th>
                    <th>첨부파일</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach items="${nList }" var="notice" varStatus="i">
                <tr>
                    <td>${i.count }</td>
                    <td><a href="/notice/detail.kh?noticeNo=${notice.noticeNo}">${notice.noticeTitle }</a></td>
                    <td>${notice.noticeWriter }</td>
                    <td>${notice.nCreateDate }</td>
                    <td>
                    	<c:if test="${!empty notice.noticeFilename }">O</c:if>
                    	<c:if test="${empty notice.noticeFilename }">X</c:if>
                    </td>
                </tr>
            	</c:forEach>
            </tbody>
            <tfoot>
            	<tr align="center">
            		<td colspan="5">
            			<input id="page" type="hidden" value="${pi.currentPage }">
            			<c:if test="${pi.currentPage ne 1 }">
                    		<a href="/notice/list.kh?page=${pi.currentPage - 1 }">&laquo;</a>
                    	</c:if>
                        <c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
                        	<c:url var="pageUrl" value="/notice/list.kh">
                        		<c:param name="page" value="${p }"></c:param>
                        	</c:url>
                        	<a class="pageNavi" href="${pageUrl }">${p }</a>
                        </c:forEach>
                        <c:if test="${pi.currentPage ne pi.maxPage }">
                    		<a href="/notice/list.kh?page=${pi.currentPage + 1 }">&raquo;</a>
                    	</c:if>
            		</td>
            	</tr>
               <!--  <tr>
                    <td colspan="4">
                        <form action="/notice/search.kh" method="get">
                            <select name="searchCondition">
                                <option value="all">전체</option>
                                <option value="writer">작성자</option>
                                <option value="title">제목</option>
                                <option value="content">내용</option>
                            </select>
                            <input type="text" name="searchValue" placeholder="검색어를 입력해주세요">
                            <input type="submit" value="검색">
                        </form>
                    </td>
                    <td>
                        <button onclick="location.href='/notice/writeView.kh'">글쓰기</button>
                    </td>
                </tr> -->
            </tfoot>
        </table>
			</div>
			<div class="search">
			<form action="/notice/search.kh" method="get" class="form-inline my-2 my-lg-0">
				<select name="searchCondition">
					<option value="all">전체</option>
					<option value="writer">작성자</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select> 
					<input type="search" id="search" name="searchValue" class="form-control mr-sm-2" placeholder="검색어를 입력해주세요" aria-label="Search">
	      			<button type="submit" class="btn btn-outline-success my-2 my-sm-0" >Search</button>
			</form>
					<button class="btn btn-outline-success my-2 my-sm-0" onclick="location.href='/notice/writeView.kh'">글쓰기</button>
			</div>
	<script>
            var page = document.querySelector("#page").value
            var pageNavi = document.querySelectorAll(".pageNavi")
            
            for(let i = 0; i < pageNavi.length; i++) {
                if (pageNavi[i].innerHTML == page) pageNavi[i].style.fontSize = '40px';
            }
        </script>
	</body>
</html>