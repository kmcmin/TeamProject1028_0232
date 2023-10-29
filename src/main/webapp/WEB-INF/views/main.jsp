<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
     <%@page import="com.example.dto.UserDTO"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
<!--     <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<!--     <meta http-equiv="X-UA-Compatible" content="ie=edge"> -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" 
    integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link href="resources/main.css" rel="stylesheet" type="text/css">
    
	<link rel="stylesheet" href="resources/css/changeUser.css">
	
<meta charset="UTF-8">
<title>팀플젝 메인</title>
</head>
<body>
<script>
//세션에 담아둔 경고문구가 있다면 출력 후 해당 메세지 담은 세션 삭제
<%if(session.getAttribute("mesg")!=null){ %>
	alert("<%=session.getAttribute("mesg")%>");
<%	session.removeAttribute("mesg");} %>
</script>

	<jsp:include page="common/top.jsp" flush="true"/> <br>

	 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
    crossorigin="anonymous"></script>
	
	
  <div id="demo" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
      <!-- 슬라이드 쇼 -->
      <div class="carousel-item active">
        <!--가로-->
        <img class="d-block w-100" src="resources/img/2309.png" alt="First slide">
<!--           <div class="carousel-caption d-none d-md-block"></div> -->
      </div>
	      <div class="carousel-item">
	        <img class="d-block w-100" src="resources/img/e.png" alt="First slide">
	      </div>
      <div class="carousel-item">
        <img class="d-block w-100" src="resources/img/f.png" alt="First slide">
      </div>
    </div>
    <!-- / 슬라이드 쇼 끝 -->
    
    <!-- 오늘 그만 보기 --><!-- 오늘 그만 보기 --><!-- 오늘 그만 보기 --><!-- 오늘 그만 보기 --><!-- 오늘 그만 보기 --><!-- 오늘 그만 보기 -->
	<div id="eventPopup1" style="border-radius:20px; position: absolute; display:none; left: 200px; top: 0px; border:2px solid transparent; width:426px; height:473px; border-top-right-radius: 0;">
<!-- 	<div id="eventPopup1" style="border-radius:20px; display:none; left: 200px; top: 160px; position: fixed; border:2px solid 4390e1; width:450px; height:453px; "> -->
			<div style="padding:10px; background: transparent; webkit-border-radius: 20px; -moz-border-radius: 20px; border-radius :20px; margin:0 auto; overflow:hidden; width:426px; height:473px;">
<!-- 			   <iframe src="https://sahubconn001.blob.core.windows.net/ct-sahubconn001/img/newshop/popup/231002_popup02pc.jpg" width="290px" height="290px"></iframe> -->
<!-- 			   <iframe src="https://sahubconn001.blob.core.windows.net/ct-sahubconn001/img/newshop/popup/231023_popup01pc.jpg" width="100%" height="100%"></iframe> -->
				<img src="resources/img/food/iframImg2.png" style="border-radius: 5px;"></img>
			</div>
			<div style='clear:both; overflow:hidden; background:#fff; padding:15px 30px; border-radius:20px;'>
				<input type="checkbox" id="eventCookie1" value="0"> &nbsp;&nbsp;&nbsp;오늘 그만 보기
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    <button onclick='mainlayerPopdel("eventPopup1","eventCookie1")'>닫기</button>
			</div>
     </div>
	<div id="eventPopup2" style="border-radius:20px; position: absolute; display:none; left: 640px; top: 0px; border:2px solid transparent; width:490px; height:610px; border-top-right-radius: 0;">
<!-- 		<div style="padding:10px; background: transparent; webkit-border-radius: 20px; -moz-border-radius: 20px; border-radius :20px; margin:0 auto; overflow:hidden; width:426px; height:473px;"> -->
<!-- 		   <iframe src="https://img.choroc.com/newshop/popup/230707_popup1pc.jpg" width="100%" height="100%"></iframe> -->
<!-- 		</div> -->
		<div style='width:480px; height:600px; clear:both; overflow:hidden; background:#fff; padding:10px; border-radius:20px; text-align: center;'>
			<div style='text-align: center;'>
<!-- 				<iframe src="https://img.choroc.com/newshop/popup/230707_popup1pc.jpg" style="width:90%; height:550px; border-radius:20px;"></iframe> -->
				<img src="resources/img/food/iframImg2.png" style="border-radius: 5px;"></img>
			</div>
			<input type="checkbox" id="eventCookie2" value="0">오늘 그만 보기
		    <button onclick='mainlayerPopdel("eventPopup2","eventCookie2")'>닫기</button>
		</div>
     </div>
     
<!-- 오늘 그만 보기 --><!-- 오늘 그만 보기 --><!-- 오늘 그만 보기 --><!-- 오늘 그만 보기 --><!-- 오늘 그만 보기 --><!-- 오늘 그만 보기 -->
    
    <!-- 왼쪽 오른쪽 화살표 버튼 -->
    <a class="carousel-control-prev" style="margin-top: 380px;" href="#demo" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    </a>
    <a class="carousel-control-next" style="margin-top: 380px;" href="#demo" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
<!--       <span style="font:bold; color:green;">Next</span> -->
    </a>
    <!-- / 화살표 버튼 끝 -->
    <!-- 인디케이터 -->
    <ul class="carousel-indicators">
      <li data-target="#demo" data-slide-to="0" class="active"></li> <!--0번부터시작-->
      <li data-target="#demo" data-slide-to="1"></li>
      <li data-target="#demo" data-slide-to="2"></li>
    </ul>
    <!-- 인디케이터 끝 -->
  </div>
<!-- **************************************************************************************************************** -->
	
<!-- 	 <div class="container marketing"> -->
  
<!--       Three columns of text below the carousel -->
<!--       <div class="row"> -->
<!--         <div class="col-lg-4"> -->
<!--           <img src="resources/img/b.png" svg class="bd-placeholder-img rounded-circle"  -->
<!--           width="140" height="140" xmlns="http://www.w3.org/2000/svg"  -->
<!--           role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice"  -->
<!--           focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="var(--bs-secondary-color)"/></svg> -->
<!--           <h2 class="fw-normal">유기농 매실차</h2> -->
<!--           <p>국내산 중에서도 엄선한 매실과 설탕만으로 순수하게 만든 매실 농축액입니다. </p> -->
<!--           <p><a class="btn btn-secondary" href="##">더보기 &raquo;</a></p> -->
<!--         </div>/.col-lg-4 -->
        
<!--         <div class="col-lg-4"> -->
<!--           <img src="resources/img/c.png" svg class="bd-placeholder-img rounded-circle"  -->
<!--           width="140" height="140" xmlns="http://www.w3.org/2000/svg"  -->
<!--           role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice"  -->
<!--           focusable="false"> -->
<!--           <rect width="100%" height="100%" fill="var(--bs-secondary-color)"/></svg> -->
<!--           <h2 class="fw-normal">상품2</h2> -->
<!--           <p>상품2설명</p> -->
<!--           <p><a class="btn btn-secondary" href="##">더보기 </a></p> -->
<!--         </div>/.col-lg-4 -->
        
<!--         <div class="col-lg-4"> -->
<!--           <img src="resources/img/a.png" svg class="bd-placeholder-img rounded-circle"  -->
<!--           width="140" height="140" xmlns="http://www.w3.org/2000/svg"  -->
<!--           role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false"> -->
<!--           <title>Placeholder</title> -->
<!--           <rect width="100%" height="100%" fill="var(--bs-secondary-color)"/></svg> -->
<!--           <h2 class="fw-normal">상품3</h2> -->
<!--           <p>상품3설명</p> -->
<!--           <p><a class="btn btn-secondary" href="##">더보기 &raquo;</a></p> -->
<!--         </div>/.col-lg-4 -->
<!--       </div>/.row -->
  <!-- **************************************************************************************************************** -->
  
      <div class="row featurette">
      	<!-- -------------------------템플릿 1------------------------- -->
      	<div style="text-align:center; margin-bottom: 100px;">
      		<h2><b>오늘 이 메뉴 어때요?</b></h2>
      		<p style="margin-bottom: 50px;">몸과 마음을 따듯하고 든든하게 채워주는 건강한 집 밥 제안.</p>
      		
      		<div style="height: 270px; padding: 1% 15% 0 15%">
	      		<div style="float: left;">
	      			<h4 style="text-align:left; color: green;">돼지고기 삼겹살</h4>
	      			<p style="text-align:left;">다져서 볶기만 하면 완성</p>
	      			<p style="text-align:left;">김밥, 맛있지만 한 줄 한 줄 싸는 게 얼마나 힘든가요, 빠르고 쉽게 김밥의 맛을 즐길수 있는 방법을 소개해 드려요</p>
	      			<p style="text-align:left;">김밥의 재료를 모두 잘게 다진 후 프라이팬에 달달 볶아 밥과 섞어 주기만 하면 끝! 집에 남은 김밥이 있다면, 김밥을 가위로 먹기 좋은 크기로</p>
	      			<p style="text-align:left;">레시피 보기 ></p>
	      		</div>
	      		<div style="border:1px solid gray; float: right;">
	      			<img src="resources/img/food/mainFood2.png" style="border-radius: 5px;"></img>
	      		</div>
      		</div>
      		
      		<div style="height: 270px; padding: 3% 15% 5% 15%">
	      		<div style="border:1px solid gray; float: left;">
	      			<img src="resources/img/food/mainFood1.png" style="border-radius: 5px;"></img>
	      		</div>
	      		<div style="float: right;">
	      			<h4 style="text-align:left; color: green;">김치볶음밥</h4>
	      			<p style="text-align:left;">다져서 볶기만 하면 완성</p>
	      			<p style="text-align:left;">김밥, 맛있지만 한 줄 한 줄 싸는 게 얼마나 힘든가요, 빠르고 쉽게 김밥의 맛을 즐길수 있는 방법을 소개해 드려요</p>
	      			<p style="text-align:left;">김밥의 재료를 모두 잘게 다진 후 프라이팬에 달달 볶아 밥과 섞어 주기만 하면 끝! 집에 남은 김밥이 있다면, 김밥을 가위로 먹기 좋은 크기로</p>
	      			<p style="text-align:left;">레시피 보기 ></p>
	      		</div>
      		</div>
      		
      		<div style="height: 270px; padding: 6% 15% 0 15%">
	      		<div style="float: left;">
	      			<h4 style="text-align:left; color: green;">백미 쌀</h4>
	      			<p style="text-align:left;">다져서 볶기만 하면 완성</p>
	      			<p style="text-align:left;">김밥, 맛있지만 한 줄 한 줄 싸는 게 얼마나 힘든가요, 빠르고 쉽게 김밥의 맛을 즐길수 있는 방법을 소개해 드려요</p>
	      			<p style="text-align:left;">김밥의 재료를 모두 잘게 다진 후 프라이팬에 달달 볶아 밥과 섞어 주기만 하면 끝! 집에 남은 김밥이 있다면, 김밥을 가위로 먹기 좋은 크기로</p>
	      			<p style="text-align:left;">레시피 보기 ></p>
	      		</div>
	      		<div style="border:1px solid gray; float: right;">
	      			<img src="resources/img/food/mainFood4.png" style="border-radius: 5px;"></img>
	      		</div>
      		</div>
      		
      		<div style="height: 270px; padding: 9% 15% 5% 15%">
	      		<div style="border:1px solid gray; float: left;">
	      			<img src="resources/img/food/mainFood3.png" style="border-radius: 5px;"></img>
	      		</div>
	      		<div style="float: right;">
	      			<h4 style="text-align:left; color: green;">생선구이</h4>
	      			<p style="text-align:left;">다져서 볶기만 하면 완성</p>
	      			<p style="text-align:left;">김밥, 맛있지만 한 줄 한 줄 싸는 게 얼마나 힘든가요, 빠르고 쉽게 김밥의 맛을 즐길수 있는 방법을 소개해 드려요</p>
	      			<p style="text-align:left;">김밥의 재료를 모두 잘게 다진 후 프라이팬에 달달 볶아 밥과 섞어 주기만 하면 끝! 집에 남은 김밥이 있다면, 김밥을 가위로 먹기 좋은 크기로</p>
	      			<p style="text-align:left;">레시피 보기 ></p>
	      		</div>
      		</div>
      		
      	</div>
      	<!-- -------------------------템플릿 1------------------------- -->
      	<!-- -------------------------템플릿 2------------------------- -->
      	<section class="main-box-section con">
      		<div style="text-align:center;">
				<h2><b>ON Sale</b></h2>
				<p>매주 달라지는 다양한 혜택을 모아모아!</p>
			</div>
			<div class=" min-height-50vh flex flex-jc-c flex-ai-c ">
				<div class=" flex flex-jc-c flex-ai-c" style="margin-right:10px;">
					<div class="section-MyPage-body__cell">
						<div class="MyPage_cell__title">
			                <img src="resources/img/food/mainFood1.png" style="border-radius: 5px;"></img>
		                </div>
		                <p>해당 상품에 대한 설명필요</p>
		              	<div class="MyPage_cell__title">
		                	<img src="resources/img/food/mainFood2.png" style="border-radius: 5px;"></img>
	              		</div>
	              		<p>해당 상품에 대한 설명필요</p>
					</div>
				</div>
				<div class=" flex flex-jc-c flex-ai-c" style="margin-right:10px;">
					<div class="section-MyPage-body__cell">
						<div class="MyPage_cell__title">
			                <img src="resources/img/food/mainFood3.png" style="border-radius: 5px;"></img>
		                </div>
		                <p>해당 상품에 대한 설명필요</p>
		              	<div class="MyPage_cell__title">
		                	<img src="resources/img/food/mainFood4.png" style="border-radius: 5px;"></img>
	              		</div>
	              		<p>해당 상품에 대한 설명필요</p>
					</div>
				</div>
				<div class=" flex flex-jc-c flex-ai-c" style="margin-right:10px;">
					<div class="section-MyPage-body__cell">
						<div class="MyPage_cell__title">
			                <img src="resources/img/food/mainFood1.png" style="border-radius: 5px;"></img>
		                </div>
		                <p>해당 상품에 대한 설명필요</p>
		              	<div class="MyPage_cell__title">
		                	<img src="resources/img/food/mainFood2.png" style="border-radius: 5px;"></img>
	              		</div>
	              		<p>해당 상품에 대한 설명필요</p>
					</div>
				</div>
				<div class=" flex flex-jc-c flex-ai-c" style="margin-right:10px;">
					<div class="section-MyPage-body__cell">
						<div class="MyPage_cell__title">
			                <img src="resources/img/food/mainFood3.png" style="border-radius: 5px;"></img>
		                </div>
		                <p>해당 상품에 대한 설명필요</p>
		              	<div class="MyPage_cell__title">
		                	<img src="resources/img/food/mainFood4.png" style="border-radius: 5px;"></img>
	              		</div>
	              		<p>해당 상품에 대한 설명필요</p>
					</div>
				</div>
			</div>
		</section>
		<!-- -------------------------템플릿 2------------------------- -->
		<!-- -------------------------템플릿 3------------------------- -->
      	<div style="text-align:center;">
			<h2><b>ON Sale</b></h2>
			<p style="margin-bottom: 50px;">매주 달라지는 다양한 혜택을 모아모아!</p>
	      	<div style="display: flex; padding:10px 100px 50px 100px;">
	    		<div style="margin-left:30px;">
	    			<img src="resources/img/food/mainFood1.png" style="border-radius: 5px;"></img>
	    			<p>해당 상품에 대한 설명필요</p>
	    			<p>해당 상품에 대한 설명필요</p>
	    		</div>
	    		<div style="margin-left:30px;">
	    			<img src="resources/img/food/mainFood2.png" style="border-radius: 5px;"></img>
	    			<p>해당 상품에 대한 설명필요</p>
	    			<p>해당 상품에 대한 설명필요</p>
	    		</div>
	    		<div style="margin-left:30px;">
	    			<img src="resources/img/food/mainFood3.png" style="border-radius: 5px;"></img>
	    			<p>해당 상품에 대한 설명필요</p>
	    			<p>해당 상품에 대한 설명필요</p>
	    		</div>
	    		<div style="margin-left:30px;">
	    			<img src="resources/img/food/mainFood4.png" style="border-radius: 5px;"></img>
	    			<p>해당 상품에 대한 설명필요</p>
	    			<p>해당 상품에 대한 설명필요</p>
	    		</div>
	   		</div>
   		</div>
   		<!-- -------------------------템플릿 3------------------------- -->
<!--         <div class="col-md-7 order-md-2"> -->
<!--           <h2 class="featurette-heading fw-normal lh-1">Oh yeah, it’s that good. <span class="text-body-secondary">See for yourself.</span></h2> -->
<!--           <p class="lead">Another featurette? Of course. More placeholder content here to give you an idea of how this layout would work with some actual real-world content in place.</p> -->
<!--         </div> -->
<!--         <div class="col-md-5 order-md-1"> -->
<!--           <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="var(--bs-secondary-bg)"/><text x="50%" y="50%" fill="var(--bs-secondary-color)" dy=".3em">500x500</text></svg> -->
<!--         </div> -->
      </div>
  
      <hr class="featurette-divider">
  
<!--       <div class="row featurette"> -->
<!--         <div class="col-md-7"> -->
<!--           <h2 class="featurette-heading fw-normal lh-1">And lastly, this one. <span class="text-body-secondary">Checkmate.</span></h2> -->
<!--           <p class="lead">And yes, this is the last block of representative placeholder content. Again, not really intended to be actually read, simply here to give you a better view of what this would look like with some actual content. Your content.</p> -->
<!--         </div> -->
<!--         <div class="col-md-5"> -->
<!--           <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="var(--bs-secondary-bg)"/><text x="50%" y="50%" fill="var(--bs-secondary-color)" dy=".3em">500x500</text></svg> -->
<!--         </div> -->
<!--       </div> -->
  
    </div><!-- /.container -->
    <!-- quickMenu -->
    <div class="quickMenuWrap">
    	<jsp:include page="common/quickMenu.jsp" flush="true"/> <br> 
            <div>
            	<button type="button" onclick="chat()">
               		<img src="resources/img/cha.png" style="width:50px;" >
				</button>
            </div>
        <button onclick="gotoScrollTop()"><img src="resources/img/GoTop.png" style="width:50px; hight:50px;" ></button>
        <button onclick='cookiedel()'><img src="resources/img/cookie.png" style="width:50px; hight:50px;" ></button>
    </div>
    <!-- quickMenu -->
    
    
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/js-cookie@2.2.0/src/js.cookie.min.js"></script>
<script type="text/javascript">

//화면 진입시 호출 하는 이벤트
$(document).ready(function() {
	layerPopup('eventPopup1');
	layerPopup('eventPopup2');
	
});
// 위로가기
function gotoScrollTop() {
    $('html, body').animate({ scrollTop: '0' }, 0);
}
// 채팅
function chat(){ 
	 selectMyRoom();
}

function selectMyRoom(){
	<% if(session.getAttribute("login")==null){ %>
		alert("로그인이 필요");
	<% }else{ %>
		commonAjax('getSelectMyRoom', "", 'post', function(result){
			console.log(result);
			window.open('room', 'window_name', 'width=680, height=690, location=no, status=no, scrollbars=yes');
		});
	<% } %>
}

// function goRoom(number, name){
// 	location.href="moveChating?roomName="+name+"&"+"roomNumber="+number;
// }





// 메인 이벤트팝업 쿠키 없으면 보여줌, js쿠키라이브러리 씀
function layerPopup(id) {
    if (!Cookies.get(id)) {
		var popup= document.getElementById(id);
        popup.style.display = 'block';
    } 
};
// 메인 이벤트팝업 닫기 버튼
function mainlayerPopdel(eventPopup,eventCookie){
	var eventCookie=document.getElementById(eventCookie);
	if(eventCookie.checked==true){
		eventCookie.value=1;
	}else{
		eventCookie.value=0;
	}
	var expired  = parseInt(eventCookie.value);
    Cookies.set(eventPopup, 'popup_closed', { expires: expired });
    document.getElementById(eventPopup).style.display = 'none';
};
// 메인이벤트 팝업 쿠키 삭제 ( 테스트 용이라 지워도 무방 )
function cookiedel() {
	Cookies.remove('eventPopup1');
	Cookies.remove('eventPopup2');
	console.log("쿠키 삭제한다 ");
};

function commonAjax(url, parameter, type, calbak, contentType){
	$.ajax({
		url: url,
		data: parameter,
		type: type,
		contentType : contentType!=null?contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		success: function (res) {
			calbak(res);
		},
		error : function(err){
			console.log('error');
			calbak(err);
		}
	});
} // 공통 Ajax

</script>
	
	<jsp:include page="common/bottom.jsp" flush="true"/> <br>
</body>
</html>	