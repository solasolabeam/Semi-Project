<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맞집 찾기 게시판</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script:400" rel="stylesheet">
<!--  <link href="https://fonts.googleapis.com/css?family=Song+Myung:400" rel="stylesheet">-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/food.js"></script>
<!--  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 -->
 <style type="text/css">
 .containerr{
	position:relative;
	text-align:center;
	color:blue;
}
.centered {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  font-family: Nanum Pen Script;
	
	font-size:100px;
	color:white;
  
}
span{
	/*font-family: 'Song Myung', cursive; */
	
}
 </style>
 </head>
<body>
<div class="page-main">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<br>
	<br>
	<div class="content-main">
	
	<div class="containerr">
   	    <img alt="" src="${pageContext.request.contextPath}/images/brooke-lark-wMzx2nBdeng-unsplash.jpg" width="900" height="150">
	 	<div class="centered">
	 		<span>맛집 찾기
	 		</span>
		</div>
	</div>
		<!-- <h2 align= "center">맛집 찾기</h2> -->
		<form id="search_form" action="list.do" method="get">
			<ul class="search">
				<li>
					<select name="keyfield">
						<option value="1">제목</option>
						<option value="2">작성자</option>
						<option value="3">내용</option>
					</select>
				</li>
				<li>
					<input type="search" size="16" 
					  name="keyword" id="keyword"
					  value="${param.keyword}">
				</li>
				<li>
					<input type="submit" value="검색">
				</li>
			</ul>
			
			
			
			
		</form>
		<div class="list-space align-right">
		    <c:if test="${!empty user_num}">
			<input type="button" value="글쓰기"
			   onclick="location.href='writeForm.do'">
			</c:if>   
			<input type="button" value="목록"
			       onclick="location.href='list.do'"> 
			<input type="button" value="홈으로"
			 onclick="location.href='${pageContext.request.contextPath}/main/main.do'">         
		</div>
		<c:if test="${count == 0}">
		<div class="result-display">
			표시할 게시물이 없습니다.
		</div>
		</c:if>
		<c:if test="${count > 0}">
		<table>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회</th>
			</tr>
			<c:forEach var="food" items="${list}">
			<tr>
				<td>${food.food_num}</td>
				<td><a href="detail.do?food_num=${food.food_num}">${food.food_name}</a></td>
				<td>${food.mem_name}</td>
				<td>${food.food_date}</td>
				<td>${food.food_count}</td>
			</tr>
			</c:forEach>
		</table>
		<div class="align-center">
			${page}
		</div>
		</c:if>
	</div>
</div>
<!--     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
 --></body>
</html>







