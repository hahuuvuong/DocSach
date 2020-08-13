<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="ebook.entity.Sach"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>${truyen.tenSach}</title>
<base href="${pageContext.servletContext.contextPath}/">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Favicons -->
<link rel="shortcut icon" href="images/favicon.ico">
<link rel="apple-touch-icon" href="images/icon.png">

<!-- Google font (font-family: 'Roboto', sans-serif; Poppins ; Satisfy) -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,500,600,600i,700,700i,800"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900"
	rel="stylesheet">

<!-- Stylesheets -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/plugins.css">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet"
	href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">

<!-- Cusom css -->
<link rel="stylesheet" href="css/custom.css">

<!-- Modernizer js -->
</head>
<style>
.scrollable-menu {
	height: auto;
	max-height: 300px;
	font-size: 14px;
	width: 350px;
}

#myBtn {
	display: block;
	position: fixed;
	bottom: 40px;
	left: 40px;
	z-index: 99;
	font-size: 18px;
	border: none;
	outline: none;
	background-color: #e59285;
	color: white;
	cursor: pointer;
	height: 45px;
	width: 45px;
	padding-left: 16px;
	padding-top: 12px;
	border-radius: 100px;
	box-shadow: 0 0 15px 0px rgba(50, 50, 50, 0.2);
	padding-left: 16px;
}

#myBtn:hover {
	background-color: white;
}
</style>
<body>
	<!--[if lte IE 9]>
		<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
	<![endif]-->
	<c:set var="btnPrevious" value="1" />
	<c:forEach var="item" items="${chapter}" varStatus="loop">
		<c:if test="${item.idChuong==content.idChuong}">
			<c:set var="btnPrevious" value="${loop.index}" />
		</c:if>
	</c:forEach>

	<!-- Main wrapper -->
	<div class="wrapper" id="wrapper">

		<!-- Header -->
		<!-- Header -->
		<header id="wn__header"
			class="header__area header__absolute sticky__header is-sticky">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-6 col-sm-6 col-6 col-lg-2">
						<div class="logo">
							<a href="home.htm"> <img src="images/logo/Books-banner.png"
								alt="logo images">
							</a>
						</div>
					</div>
					<div class="col-lg-8 d-none d-lg-block">
						<nav class="mainmenu__nav">
							<ul class="meninmenu d-flex justify-content-start">
								<li class="drop with--one--item"><a href="home.htm">Trang
										chủ</a></li>

								<li class="drop"><a><p style="color: white !important">Thể
											loại</p></a>

									<div class="megamenu mega04">
										<c:set var="count" value="1" />
										<%
											for (int i = 0; i < 6; i += 1) {
										%>
										<ul class="item item03">
											<c:forEach var="u" items="${categories}" begin="${count}"
												end="${count+4}">
												<li><a href="theloai/${u.idTheLoai}/1.htm">${u.tenTheLoai }
												</a></li>
											</c:forEach>
										</ul>
										<c:set var="count" value="${count + 5}" scope="page" />
										<%
											}
										%>

									</div>
							</ul>
						</nav>
					</div>
					<div class="col-md-6 col-sm-6 col-6 col-lg-2">
						<ul
							class="header__sidebar__right d-flex justify-content-end align-items-center">
							<li class="shop_search"><a class="search__active" href="#"></a></li>
							<li class="wishlist"><a href="#"></a></li>
							<!-- Start Shopping Cart -->

							<!-- End Shopping Cart -->
							<li class="setting__bar__icon"><a class="setting__active"
								href="#"></a>
								<div class="searchbar__content setting__block">
									<div class="content-inner">
										<div class="switcher-currency">
											<c:choose>
												<c:when test="${sessionScope.nickname != NULL}">
													<strong class="label switcher-label"
														style="text-align: center !important"> <span>${sessionScope.nickname}</span>
													</strong>
													<div class="switcher-options">

														<a href="account/logout.htm" class="dropdown-item"><i
															class="fas fa-user mr-2"></i>Account</a> <a
															class="dropdown-item" href="account/logout.htm"><i
															class="fas fa-power-off mr-2"></i>Logout</a>
													</div>
												</c:when>
												<c:otherwise>
													<strong class="label switcher-label"><a
														href="account.htm"> <span>Login</span></a> </strong>
													<div class="switcher-options">
														<strong class="label switcher-label"><a
															href="account/register.htm"> <span>Create
																	account</span></a> </strong>
													</div>
												</c:otherwise>
											</c:choose>
										</div>


									</div>
								</div></li>

						</ul>
					</div>
				</div>
				<!-- Start Mobile Menu -->

				<!-- End Mobile Menu -->
				<div class="mobile-menu d-block d-lg-none"></div>
				<!-- Mobile Menu -->
			</div>
		</header>
		<!-- //Header -->
		<!-- Start Search Popup -->
		<div class="box-search-content search_active block-bg close__top">
			<form id="search_mini_form" class="minisearch" action="#">
				<div class="field__search">
					<input type="text" placeholder="Search entire store here...">
					<div class="action">
						<a href="#"><i class="zmdi zmdi-search"></i></a>
					</div>
				</div>
			</form>
			<div class="close__wrap">
				<span>close</span>
			</div>
		</div>
		<!-- //Header -->
		<!-- Start Search Popup -->
		<div class="box-search-content search_active block-bg close__top">
			<form id="search_mini_form" class="minisearch" action="#">
				<div class="field__search">
					<input type="text" placeholder="Search entire store here...">
					<div class="action">
						<a href="#"><i class="zmdi zmdi-search"></i></a>
					</div>
				</div>
			</form>
			<div class="close__wrap">
				<span>close</span>
			</div>
		</div>
		<!-- End Search Popup -->
		<!-- Start Bradcaump area -->

		<!-- End Bradcaump area -->
		<!-- Start About Area -->
		<div class="page-about about_area bg--white section-padding--lg">
			<div class="container"
				style="background-color: rgb(238, 238, 238) !important; border-radius: 30px; padding: 10px;">

				<h3 class="text-center" style="margin: 30px 30px 30px 30px;">
					<a href="truyen/${truyen.idSach}.htm">${truyen.tenSach}</a>
				</h3>
				<div class="text-center" style="margin: 30px 30px 30px 30px;">${content.tenChuong}</div>
				<div class="text-center">

					<!--  -->
					<c:set var="btnTemp" value="0" />

					<c:forEach var="u" items="${chapter}" begin="0"
						end="${btnPrevious}" varStatus="count">
						<c:if test="${btnTemp==btnPrevious - 1}">
							<a href="chapter/${truyen.idSach}/${u.idChuong}.htm"><button
									type="button" class="btn btn-default"
									style="margin-right: 5px !important">
									<i class="zmdi zmdi-arrow-left"></i>
								</button></a>
						</c:if>
						<c:set var="btnTemp" value="${count.count}" />
					</c:forEach>


					<div class="btn-group text-center">
						<button type="button" class="btn btn-sm btn-info dropdown-toggle"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Chọn Tập <span class="caret"></span>
						</button>
						<ul class="dropdown-menu scrollable-menu">
							<c:forEach var="u" items="${chapter}">
								<c:choose>
									<c:when test="${u.idChuong==content.idChuong}">
										<a href="chapter/${truyen.idSach}/${u.idChuong}.htm"><li
											class="list-group-item active">${u.tenChuong}</li></a>
									</c:when>
									<c:otherwise>
										<a href="chapter/${truyen.idSach}/${u.idChuong}.htm"><li
											class="list-group-item">${u.tenChuong}</li></a>
									</c:otherwise>
								</c:choose>

							</c:forEach>
						</ul>
					</div>


					<c:set var="btnTemp" value="0" />

					<c:forEach var="u" items="${chapter}" begin="0"
						end="${btnPrevious+1}" varStatus="count">
						<c:if test="${btnTemp==btnPrevious + 1}">
							<a href="chapter/${truyen.idSach}/${u.idChuong}.htm"><button
									type="button" class="btn btn-default"
									style="margin-left: 5px !important">
									<i class="zmdi zmdi-arrow-right"></i>
								</button></a>
						</c:if>
						<c:set var="btnTemp" value="${count.count}" />
					</c:forEach>


				</div>
				<hr
					style="border-top: 1px solid black; margin: 30px 30px 30px 30px;">

				<div style="color: black; font-size: 18px; padding: 20px;">${content.noiDung}</div>
				<hr
					style="border-top: 1px solid black; margin: 30px 30px 30px 30px;">

				<div class="text-center"
					style="margin: 30px 30px 30px 30px;!important">

					<!--  -->
					<c:set var="btnTemp" value="0" />

					<c:forEach var="u" items="${chapter}" begin="0"
						end="${btnPrevious}" varStatus="count">
						<c:if test="${btnTemp==btnPrevious - 1}">
							<a href="chapter/${truyen.idSach}/${u.idChuong}.htm"><button
									type="button" class="btn btn-default"
									style="margin-right: 5px !important">
									<i class="zmdi zmdi-arrow-left"></i>
								</button></a>
						</c:if>
						<c:set var="btnTemp" value="${count.count}" />
					</c:forEach>


					<div class="btn-group text-center">
						<button type="button" class="btn btn-sm btn-info dropdown-toggle"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Chọn Tập <span class="caret"></span>
						</button>
						<ul class="dropdown-menu scrollable-menu">
							<c:forEach var="u" items="${chapter}">
								<c:choose>
									<c:when test="${u.idChuong==content.idChuong}">
										<a href="chapter/${truyen.idSach}/${u.idChuong}.htm"><li
											class="list-group-item active">${u.tenChuong}</li></a>
									</c:when>
									<c:otherwise>
										<a href="chapter/${truyen.idSach}/${u.idChuong}.htm"><li
											class="list-group-item">${u.tenChuong}</li></a>
									</c:otherwise>
								</c:choose>

							</c:forEach>
						</ul>
					</div>
					<c:set var="btnTemp" value="0" />

					<c:forEach var="u" items="${chapter}" begin="0"
						end="${btnPrevious+1}" varStatus="count">
						<c:if test="${btnTemp==btnPrevious + 1}">
							<a href="chapter/${truyen.idSach}/${u.idChuong}.htm"><button
									type="button" class="btn btn-default"
									style="margin-left: 5px !important">
									<i class="zmdi zmdi-arrow-right"></i>
								</button></a>
						</c:if>
						<c:set var="btnTemp" value="${count.count}" />
					</c:forEach>
				</div>
			</div>
		</div>
		<!-- End About Area -->
		<!-- Start Team Area -->

		<!-- End Team Area -->
		<!-- Footer Area -->
		<footer id="wn__footer" class="footer__area bg__cat--8 brown--color">
			<div class="footer-static-top">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="footer__widget footer__menu">
								<div class="ft__logo">
									<a href="index.html"> <img src="images/logo/3.png"
										alt="logo">
									</a>
									<p>Liên hệ với chúng tôi</p>
								</div>
								<div class="footer__content">
									<ul
										class="social__net social__net--2 d-flex justify-content-center">
										<li><a href="facebook.com/hahuuvuong"><i
												class="fab fa-facebook-f"></i></a></li>
										<li><a href="#"><i class="fab fa-google"></i></a></li>
										<li><a href="#"><i class="fab fa-twitter"></i></a></li>
										<li><a href="#"><i class="fab fa-linkedin"></i></a></li>
										<li><a href="#"><i class="fab fa-youtube"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="copyright__wrapper">
				<div class="container">
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="copyright">
								<div class="copy__right__inner text-left">
									<p>
										<i class="fa fa-copyright"></i> <a
											href="http://localhost:9999/ebook/home.htm">Ebook.com</a> Tổ
										chức phi lợi nhuận
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</footer>
		<!-- //Footer Area -->
	</div>
	<a onclick="topFunction()" id="myBtn" title="Go to top"><i
		class="zmdi zmdi-bookmark-outline"></i></a>
	<script>
		var mybutton = document.getElementById("myBtn");
		var scrollPos;
		window.onscroll = function() {
			scrollPos = $(window).scrollTop();

		};
		<c:choose>
			<c:when test="${sessionScope.nickname != NULL}">
		
		window.onload = function(){
			window.scrollTo(0,1387);
		};
		function topFunction() {

            $.ajax({
                type: "GET",
                data:{
                	IdSach:${truyen.idSach},
                	IdDocGia:${sessionScope.idDocGia},
                	IdChuong:${content.idChuong},
                	ViTri: scrollPos,
                },
                url: "addlichsudoc.htm",
                success: function(value){
					if(value =="success"){
						alert("Đánh dấu sách thành công!");
					}
					else{
						alert("Đánh dấu sách thất bại! "+ value);
					}
                }
                });
		}
			</c:when>
		<c:otherwise>
		function topFunction() {
			alert("Vui lòng đăng nhập để thực hiện thao tác đánh dấu");
		}
			</c:otherwise>
		</c:choose>
	</script>
	<!-- //Main wrapper -->
	<!-- JS Files -->
	<script src="js/vendor/jquery-3.2.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/active.js"></script>

</body>
</html>