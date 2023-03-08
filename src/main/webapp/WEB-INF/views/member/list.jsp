<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>멤버 목록 조회</title>
		<style>
			table{
				border:1px solid black;
			}
			th, td{
				border:1px solid black;
			}
		</style>
	</head>
	<body>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>ID</th>
					<th>NAME</th>
					<th>EMAIL</th>
					<th>PHONE</th>
					<th>ADDRESS</th>
					<th>ENROLL DATE</th>
					<th>STATUS</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${mList }" var="member" varStatus="i">
				<tr>
					<td>${i.count }</td>
					<td>${member.memberId }</td>
					<td>${member.memberName }</td>
					<td>${member.memberEmail }</td>
					<td>${member.memberPhone }</td>
					<td>${member.memberAddr }</td>
					<td>${member.enrollDate }</td>
					<td>${member.mStatus }</td>
				</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="7">
						<input type="text" placeholder="검색어를 입력하세요">
					</td>
				</tr>
			</tfoot>
		</table>
	</body>
</html>