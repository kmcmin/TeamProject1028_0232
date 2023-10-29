<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>상품관리</title>
<link href="resources/css/styles.css" rel="stylesheet" />
<link href="resources/css/testgs.css" rel="stylesheet" />

<!-- <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" /> -->
<!-- <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script> -->
<!-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<!-- <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css" /> -->
<!-- <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css" /> -->
<!-- <link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css" /> -->
<!-- <script	src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script> -->



<!-- <link rel="stylesheet" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css" /> -->
<link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css" />
<script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>







<script type="text/javascript">
	//화면 진입시 호출하는 이벤트 모음
	$(document).ready(function() {
		productListAdmin();
	
	}) //end ready
	
	//전체 DB상품리스트
	function productListAdmin(){
		$("#productList").DataTable({
			ajax : {
			url : "adminProductList",
			type : "POST",
// 			dataSrc : '' // 이 부분은 data 말고 다른걸로 할때 쓰는듯?
// 			ordering: false,
			},
			columns: [
				
			{ data: 'PRODUCT_CODE', render : function(data){
				var data=data.substr(0,2)+'-'+data.substr(2,4)+'-'+data.substr(6,6)
				return data;
			}},
			
			{ 
				data: 'PRODUCT_NAME', render:function(data){
					var fdata="";
					if(data.length>27){
						fdata +="<div class='tooltip-container'>";
						
						fdata +="</div>";
// 						fdata += "<div class='tooltip-container'>";
// 						fdata += "<p class='tooltip-text' style='display:none;'>"+data+"</p>";
// 						fdata += "<p name='tooltip-button' onmouseleave='leave()' onmouseover='over()'>"+data+"..."+"</p>";
// 						fdata += "</div>";
						return data.substr(0,27)+'...';
					}
						return data;
			} },
			
			{ 
				data: 'PRODUCT_IMG', render:function(data){
				return data.substr(0,10)+'...';
			} },
			{ 
				data: 'PRODUCT_CONTEXT', render:function(data){
				return data.substr(0,10)+'...';
			} },
			{ 
				data: 'PRODUCT_PRICE', render:function(data){
				return data.toLocaleString();
			} },
			{ 
				data: 'PRODUCT_STOCK', render:function(data){
				return data.toLocaleString();
			} },
			{ data: 'CATEGORY_CODE'},
			
			{ data: 'PRODUCT_COMPANY', render:function(data){
				if(data.length>10) return data.substr(0,10)+'...';
					return data;
			}},
			
			{ data: 'PRODUCT_DELIP'},
			{ data: 'PRODUCT_STATUS'},
			{ 
				data: 'PRODUCT_REGDATE', render:function(data){
				return data.substr(0,10);
			} },
			{ 
				data: 'PRODUCT_UPDATE', render:function(data){
				return data.substr(0,10);
			} },
			{data: 'PRODUCT_CODE', render : function(data){
				var rdata= '<button style="center;" onclick="updateProduct('+data+')">'+'수정'+'</button>';
				return rdata;
			}},
			{data: 'CATEGORY_CODE'},
			
			],
			columnDefs: [
			{"targets" : [0], "width" : '7%'}, 
			{"targets" : [1], "width" : '20%'},
			{"targets" : [2], "width" : '5%'},
			{"targets" : [3], "width" : '5%'},
			{"targets" : [4], "width" : '3%'},
			{"targets" : [5], "width" : '3%'},
			{"targets" : [6], "width" : '5%'},
			{"targets" : [7], "width" : '10%'},
			{"targets" : [8], "width" : '3%'},
			{"targets" : [9], "width" : '5%'},
			{"targets" : [10], "width" : '5%'},
			{"targets" : [11], "width" : '5%'},
			{"targets" : [12], "width" : '5%', ordering : false},
			{"targets" : [13], "width" : '5%'},
			],
			})
	}//end productAdmin

	//상품수정
	function updateProduct(val){
		var productCode=val;
// 		window.open('tables2', 'window_name', 'width=680, height=690, location=no, status=no, scrollbars=yes');
	}
	
	function over(val) {
		var target = document.getElementsByName("tooltip-text"+val)[0];
		target.style='display:block;'
		target.classList.remove("tooltip-text:before");
		target.classList.add("tooltip-text");
	};
  
	function leave(val) {
		var target = document.getElementsByName("tooltip-text"+val)[0];
		target.style='display:none;'
		target.classList.add("tooltip-text:before");
		target.classList.remove("tooltip-text");
	};
	
	
</script>




</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="index.html">Start Bootstrap</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Search for..."
					aria-label="Search for..." aria-describedby="btnNavbarSearch" />
				<button class="btn btn-primary" id="btnNavbarSearch" type="button">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="#!">Settings</a></li>
					<li><a class="dropdown-item" href="#!">Activity Log</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" href="#!">Logout</a></li>
				</ul></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">Core</div>
						<a class="nav-link" href="index.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> Dashboard
						</a>
						<div class="sb-sidenav-menu-heading">Interface</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> Layouts
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="layout-static.html">Static
									Navigation</a> <a class="nav-link" href="layout-sidenav-light.html">Light
									Sidenav</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> Pages
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion"
								id="sidenavAccordionPages">
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseAuth" aria-expanded="false"
									aria-controls="pagesCollapseAuth"> Authentication
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseAuth"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="login.html">Login</a> <a
											class="nav-link" href="register.html">Register</a> <a
											class="nav-link" href="password.html">Forgot Password</a>
									</nav>
								</div>
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseError" aria-expanded="false"
									aria-controls="pagesCollapseError"> Error
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseError"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="401.html">401 Page</a> <a
											class="nav-link" href="404.html">404 Page</a> <a
											class="nav-link" href="500.html">500 Page</a>
									</nav>
								</div>
							</nav>
						</div>
						<div class="sb-sidenav-menu-heading">Addons</div>
						<a class="nav-link" href="charts.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> Charts
						</a> <a class="nav-link" href="tables.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> Tables
						</a>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					Start Bootstrap
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">테이블이다.</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
						<li class="breadcrumb-item active">Tables</li>
					</ol>
					<div class="card mb-4">
						<div class="card-body">
							1. 이름 길면 툴팁 <br>
							2. 상품 수정, 등록 버튼 누르면 창 하나 띄워서 <br>
							3. 삭제 버튼 클릭시 해당 라인 진짜 삭제 할건지 물어보는 창 띄우고 ㅇㅇ 누르면 삭제  <br>
							 <a target="_blank" href="https://datatables.net/">official
								DataTables documentation</a> .
						</div>
					</div>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 예시라고한다.
						</div>
						<div class="card-body" >
						<form>
							<table id="productList" style="table-layout:fixed; border:1px solid red;">
								<thead style="border:1px solid red;">
									<tr>
										<th>상품코드</th>
										<th>상품명</th>
										<th>상품이미지</th>
										<th>상품설명</th>
										<th>가격</th>
										<TH>재고</TH>
										<TH>카테고리</TH>
										<TH>제조사</TH>
										<TH>배송료</TH>
										<TH>상품상태</TH>
										<TH>상품등록일</TH>
										<th>상품수정일</th>
										<th>수정</th>
										<th>삭제</th>
									</tr>
								</thead>
							</table>
						</form>
						</div>
					</div>
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2023</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	
	
	
	
	
	
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="resources/js/scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>