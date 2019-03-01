<%@page import="com.yaboja.dto.MovieDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<MovieDto> movieList = (List) request.getAttribute("movieList");
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>야보자</title>

<!-- jquery -->
<script src="vendor/jquery/jquery.min.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<script type="text/javascript">


function setChildText(cInput){
	
	
	/* alert("검색 실행"); */
	var sb = cInput;
	alert("검색 완료");
	opener.document.getElementById("pInput").value = sb;
	window.close();
}
</script>



<!-- Bootstrap Core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
	<h1>MovieSearch</h1>
	<Form name = frm1>
	<table class="table table-hover">
		<thead align="center">
			<tr>
				<th>title</th>
		
			</tr>
		</thead>
		<%
			if (movieList.size() == 0) {
		%>
		<tr>
			<td colspan="5" align="center">----선택 가능한 영화가 없습니다.----</td>
		</tr>
		<%
			} else {
				for (int i = 0; i < movieList.size(); i++) {
		%>
		<tr>
			<td>
			<!--  x<input type = "button" value = <%=movieList.get(i).getMovietitle()%> onclick = "setChildText()" id = "cInput">-->
			<p onclick="setChildText('<%=movieList.get(i).getMovietitle()%>')" id = "cInput" ><%=movieList.get(i).getMovietitle()%> </p>
			</td>

		</tr>
		<%
			}
			}
		%>
	</table>
	</Form>

	<div align="center">

		<c:if test="${pageMaker.prev}">
			<a href="movieSearch.do?page=${pageMaker.startPage - 1}">이전</a>
		</c:if>

		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
			var="idx">
			<a href="movieSearch.do?page=${idx}">${idx}</a>
		</c:forEach>

		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<a href="movieSearch.do?page=${pageMaker.endPage + 1}">다음</a>
		</c:if>

	</div>
	<!-- 검색 추가 -->
	<div class="search">
		<select name="searchType">
			<option value="t"
				<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>

		</select> <input type="text" name="keyword" id="keywordInput"
			value="${scri.keyword}" />

		<button id="searchBtn">검색</button>

		<script>
			$(function() {
				$('#searchBtn').click(
						function() {
							self.location = "movieSearch1.do"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword="
									+ encodeURIComponent($('#keywordInput')
											.val());
						});
			});
		</script>
	</div>



</body>
</html>