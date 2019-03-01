<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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
<!-- jQuery -->
<script src="vendor/jquery/jquery.min.js"></script>

</head>

<script type="text/javascript">
	function map1() {
		
		window.open('map1.do', "", "width=1000,height=550");
	}
</script>

<body>

	<!-- Navigation -->
	<%@ include file="../inc/topbar.jsp"%>

	<!-- Menu Bar -->
	<c:choose>
		<c:when test="${dto.usergrade eq 'admin'}">
			<nav class="nav2" style="margin-top: 60px; margin-bottom: 20px;">
				<!-- 메뉴바 -->
				<a href="movieBoard.do"><strong>Movie Board</strong></a> <a
					href="matchingboardlist.do"><strong>Matching Board</strong></a> <a
					href="reviewBoard.do"><strong>Review Board</strong></a> <a
					href="qnaboard.do"><strong>Q&A Board</strong></a> <a
					href="adminPreferences.do"><strong>preferences</strong></a>
				<div class="nav-underline"></div>
			</nav>
		</c:when>
		<c:otherwise>
			<nav class="nav2" style="margin-top: 60px; margin-bottom: 20px;">
				<!-- 메뉴바 -->
				<a href="movieBoard.do"><strong>Movie Board</strong></a> <a
					href="matchingboardlist.do"><strong>Matching Board</strong></a> <a
					href="reviewboard.do"><strong>Review Board</strong></a> <a
					href="qnaboard.do"><strong>Q&A Board</strong></a> <a
					href="mypage.do"><strong>My Page</strong></a>
				<div class="nav-underline"></div>
			</nav>
		</c:otherwise>
	</c:choose>


	<!--adminsidebar -->
	<%@ include file="../inc/adminSidebar.jsp"%>
	<!-- 내부jsp -->
	
	<br>
	<br>
	<br>
	
	<h2 style="padding-left: 250px;"> 영화관 등록 및 삭제</h2>
	
	<!-- 지도-------------------------------------------- -->
	
	   <center>
   <div>
	<div id="map" style="width: 800px; height: 400px;" ></div>


	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fcce2df2939bca5734fd756caf9ea252&libraries=clusterer"></script>
	

	<script>
	

    var map = new daum.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
        center : new daum.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표
        level : 14 // 지도의 확대 레벨
    });
    
 // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	//가능할 경우
    if (navigator.geolocation) {
        
        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function(position) {
            
            var lat = position.coords.latitude, // 위도
                lon = position.coords.longitude; // 경도
            
            var locPosition = new daum.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                
                //message = '<p> 님의 접속 위치</p>  ';
            // 마커와 인포윈도우를 표시합니다
            //displayMarker(locPosition, message);
                
          });
        
    } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다        
        var locPosition = new daum.maps.LatLng(37.499005, 127.032907),    //kh정보교육원 위치로 잡음
            message = 'KH정보교육원';            
        displayMarker(locPosition, message);
    }
 
    function displayMarker(locPosition, message) {

        // 마커를 생성합니다
        var marker = new daum.maps.Marker({  
            map: map, 
            position: locPosition
        }); 
        
        var iwContent = message, // 인포윈도우에 표시할 내용
            iwRemoveable = true;

        // 인포윈도우를 생성합니다
        var infowindow = new daum.maps.InfoWindow({
            content : iwContent,
            removable : iwRemoveable
        });
        
        // 인포윈도우를 마커위에 표시합니다 
        infowindow.open(map, marker);
        
        // 지도 중심좌표를 접속위치로 변경합니다
        map.setCenter(locPosition);      
    }    

    // 마커 클러스터러를 생성합니다
    // 마커 클러스터러를 생성할 때 disableClickZoom 값을 true로 지정하지 않은 경우
    // 클러스터 마커를 클릭했을 때 클러스터 객체가 포함하는 마커들이 모두 잘 보이도록 지도의 레벨과 영역을 변경합니다
    // 이 예제에서는 disableClickZoom 값을 true로 설정하여 기본 클릭 동작을 막고
    // 클러스터 마커를 클릭했을 때 클릭된 클러스터 마커의 위치를 기준으로 지도를 1레벨씩 확대합니다
    var clusterer = new daum.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
        minLevel: 10, // 클러스터 할 최소 지도 레벨
        
    });

    // 데이터를 가져오기 위해 jQuery를 사용합니다
    // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다

    
     
    function myJson(mark) {
        // 데이터에서 좌표 값을 가지고 마커를 표시합니다
        
        
        
        $.ajax({
     	   url:"getJson.do",
     	   dataType:"json",
     	   success:function(msg){
     		   
     		 
     		  
     		  var markers = $(msg.positions).map(function(i, position) {
     	            var markers = new daum.maps.Marker({
     	                map: map,
     	                position : new daum.maps.LatLng(position.lat, position.lng)
     	            
     	            }); 
     	          
     	            
     	            var infowindow = new daum.maps.InfoWindow({
     	                content: position.html,
     	                
     	                removable : true
     	            });
     	            infowindow.open(map, markers);


     	           
     	          
     	 
     	            return markers;
     	 
     	        });
     		  
     		 clusterer.addMarkers(markers);
     		 
     		   
     	   },
     	   error:function(jqXHR, textStatus){
     		   alert(textStatus + " " + jqXHR.status + "\n" +jqXHR.responseText);
     	   }
     	});
        

        
    }
    myJson();
   

    // 인포윈도우를 표시하는 클로저를 만드는 함수입니다

    function makeOverListener(map, marker, infowindow) {
        infowindow.close();
        return function() {
            infowindow.open(map, marker);
        };
    }

  
    

</script>
</div>
   </center>
	
	
	
	
	<!-- /지도-------------------------------------------- -->
	<br>
	<div class="container">
		
		<form action="#">
			<div align="right">
				<button type="button" class="btn btn-default"
											onclick="map1()">영화관 등록</button>
			</div>
			<br>
			<center>
			<table border="1" class="table" style="text-align: center;">
				<thead align="center">
					<tr>
						<th style="width: 100px;">영화관 번호
						<th>영화관
						<th style="width: 100px;">위도
						<th style="width: 100px;">경도
						<th style="width: 100px;">삭제
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty cinemaList }">
							<tr>
								<td colspan="8">사용자가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="i" items="${cinemaList }">

								<tr>
									<td>${i.cinemaseq }</td>
									<td>${i.cinema }</td>
									<td>${i.latitude }</td>
									<td>${i.longitude }</td>
									<td>
										<button type="button" class="btn btn-default"
											onclick="location.href='deleteCinema.do?cinemaseq=${i.cinemaseq }'">삭제</button>
									</td>

								</tr>

							</c:forEach>

						</c:otherwise>
					</c:choose>

				</tbody>
			</table>
			</center>
		</form>
		<!-- Footer -->
		<%@ include file="../inc/footer.jsp"%>
</body>

</html>
