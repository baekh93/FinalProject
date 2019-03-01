<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%
   String ctx = request.getContextPath(); //콘텍스트명 얻어오기.
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>야보자</title>

<!-- Bootstrap Core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="vendor/font-awesome/css/font-awesome.min.css"
   rel="stylesheet" type="text/css">
<link
   href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic'
   rel='stylesheet' type='text/css'>
<link
   href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
   rel='stylesheet' type='text/css'>



<!-- Menu Bar -->
<link href="css/menubar.css" rel="stylesheet">
<!-- Content -->
<link href="css/index_content.css" rel="stylesheet">
<<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript" src="SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<!-- jQuery -->
<script src="vendor/jquery/jquery.min.js"></script>
<script type="text/javascript"
   src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
   src="<%=ctx%>/resource/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
   var oEditors = [];
   $(function() {
      nhn.husky.EZCreator.createInIFrame({
         oAppRef : oEditors,
         elPlaceHolder : "ir1", //textarea에서 지정한 id와 일치해야 합니다. 
         //SmartEditor2Skin.html 파일이 존재하는 경로
         sSkinURI : "resource/SE2/SmartEditor2Skin.html",
         htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : false,
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true,
            fOnBeforeUnload : function() {

            }
         },
         fOnAppLoad : function() {
            //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
            oEditors.getById["ir1"].exec("PASTE_HTML", "<pre>"+$("#ir1").innerHTML+"</pre>");

         },
         fCreator : "createSEditor2"
      });

      //저장버튼 클릭시 form 전송
      $("#save").click(function() {
         oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);

         $("#frm").submit();
      });
   });
</script>
</head>

<body>


   <!-- Navigation -->
   <%@ include file="inc/topbar.jsp"%>


   <!-- Menu Bar -->
   <nav class="nav2" style="margin-top: 60px; margin-bottom: 20px;">
      <!-- 메뉴바 -->
      <a href=""><strong>Movie Board</strong></a> <a href=""><strong>Matching
            Board</strong></a> <a href="reviewboard.do"><strong>Review Board</strong></a> <a href=""><strong>Q&A
            Board</strong></a> <a href=""><strong>My Page</strong></a>
      <div class="nav-underline"></div>
   </nav>
   
   <!-- 영화매칭, 마이페이지말고는 여기부터 소스 넣으면 돼!!! -->
   <input type="hidden" name="userseq" value="${dto.userseq }"/>
   <div class="container">
   <h2>후기게시판(수정)</h2>
   <form action="review_update.do" id="frm" method="post">
      <div>
         <input type="hidden" name="reviewboardseq" value="${reviewboarddto.reviewboardseq }">
      </div>
      <div class="form-group">
         영화제목 : <input type="text" class="form-control" name="movietitle" value="${movieDto.movietitle }" readonly="readonly">
      </div>
      <div class="form-group">
         제목 : <input type="text" class="form-control" name="reviewboardtitle" value="${reviewboarddto.reviewboardtitle }" maxlength="20">
      </div>
      <div class="form-group">
         작성자 : <input type="text" value="${dto.username }" readonly="readonly" class="form-control">
      </div>
      <div class="form-group">
         내용 : <textarea id="ir1" name="reviewboardcontent" style="overflow-y : scroll; width: 100%; height: 350px;">${reviewboarddto.reviewboardcontent }</textarea>
      </div>
    
         <input type="button" value="취소" onclick="location.href='review_detail.do'" class="btn btn-default pull-right">
         <input type="button" value="수정" class="btn btn-default pull-right" id="save">
      </form>
   </div>
   
<br><hr><br>
   <!-- Footer -->
   <%@ include file="inc/footer.jsp"%>

   

</body>

</html>