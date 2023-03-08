<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 작성</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		
	</head>
	<body>
		<jsp:include page="../common/menuBar.jsp"></jsp:include>
        <h1>공지글 등록페이지</h1>
        <form action="/notice/write.kh" method="post" enctype="multipart/form-data">
            제목 : <input type="text" name="noticeTitle"><br>
            작성자 : <input type="text" name="noticeWriter"><br>
            내용 : <textarea name="noticeContent" id="" cols="30" rows="10"></textarea><br>
            첨부파일 : <input type="file" name="uploadFile"><br>
            <button type="submit" class="btn btn-outline-success my-2 my-sm-0" >등록</button>
            <button type="reset" class="btn btn-outline-success my-2 my-sm-0" >취소</button>
            <!-- <input type="submit" value="등록">
            <input type="reset" value="취소"> -->
        </form>
	</body>
</html>