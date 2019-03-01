<%@page import="com.yaboja.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
      int userseq = 0;
   String usergrade="";
   if(session.getAttribute("dto") != null){
      userseq = ((UserDto)session.getAttribute("dto")).getUserseq();
      usergrade=((UserDto)session.getAttribute("dto")).getUsergrade();
      
   }
   
   
%>
<!DOCTYPE html>
<html>
<head>
<script src="vendor/jquery/jquery.min.js"></script>
   <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
   
<style type="text/css">

n{
font-weight: bold;
   font-variant:small-caps;
   color: darkblue;
   
   
   font-family:monospace;

}

.commentInfo{
   
   text-shadow: 2px 6px 2px skyblue;
}

m{
font-weight: bold;
   font-variant:small-caps;
   color: dark;
   
   font-size:17px;
   font-family:"맑은 고딕";

}
</style>   
   
<script type="text/javascript">
var movieseq = '${moviedto.movieseq}'; //게시글 번호

$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
    commentInsert(insertData); //Insert 함수호출(아래)
});
 
 
 
//댓글 목록 
function commentList(){
   
    $.ajax({
        url : '/controller/movie_coment_list.do',
        type : 'get',
        data : {'movieseq':movieseq},
        success : function(data){
            var a =''; 
           var userseq = document.getElementById("userseq").value;
           var usergrade = document.getElementById("usergrade").value;
           var coupdate = '';
            $.each(data, function(key, value){
               coupdate='';
               if(userseq == value.userseq || usergrade== "admin" ){
                  
                  coupdate = '<div style = "float:right;"><a onclick="commentUpdate('+value.moviecomentseq+',\''+value.moviecomentcontent+'\');"> 수정 </a>'+'<a onclick="commentDelete('+value.moviecomentseq+');"> 삭제 </a> </div>';
               }
               
                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                a += coupdate;
                a += 'ID : <n class="commentInfo">'
               + value.username + '</n>';
                a += '<div class="commentContent'+value.moviecomentseq+'"><m><p>내용 :  '
            + value.moviecomentcontent
            + '</p></m>';
                a += '</div></div>';
            });
            
            $(".commentList").html(a);
        }
    });
}
 
//댓글 등록
function commentInsert(insertData){
    $.ajax({
        url : '/controller/movie_coment_insert.do',
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
                commentList(); //댓글 작성 후 댓글 목록 reload
                $('[name=moviecomentcontent]').val('');
            }
        }
    });
}
 
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(moviecomentseq, moviecomentcontent){
    var a ='';
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="moviecomentcontent_'+moviecomentseq+'" value="'+moviecomentcontent+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+moviecomentseq+');">수정</button> </span>';
    a += '</div>';
    
    $('.commentContent'+moviecomentseq).html(a);
    
}
 
//댓글 수정
function commentUpdateProc(moviecomentseq){
    var updateContent = $('[name=moviecomentcontent_'+moviecomentseq+']').val();
    
    $.ajax({
        url : '/controller/movie_coment_update.do',
        type : 'post',
        data : {'moviecomentcontent' : updateContent, 'moviecomentseq' : moviecomentseq},
        success : function(data){
            if(data == 1) commentList(movieseq); //댓글 수정후 목록 출력 
        }
    });
}
 
//댓글 삭제 
function commentDelete(moviecomentseq){
   
   $.ajax({
        url : '/controller/movie_coment_delete.do',
        type : 'post',
        data : { 'moviecomentseq' : moviecomentseq},
        success : function(data){
            if(data == 1) commentList(movieseq); //댓글 삭제후 목록 출력 
        }
    });
}
 
 
 
 
$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});
 
 
 
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <input type="hidden" id="userseq" value="<%= userseq%>"/>
   <input type="hidden" id="usergrade" value="<%= usergrade %>"/>
</body>
</html>