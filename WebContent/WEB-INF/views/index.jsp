<%@ page pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page import="ebook.entity.Sach"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Home</title>
<base href="${pageContext.servletContext.contextPath}/">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Favicons -->
<link rel="shortcut icon" href="images/favicon.ico">
<link rel="apple-touch-icon" href="images/icon.png">

<!-- Google font (font-family: 'Roboto', sans-serif; Poppins ; Satisfy) --
>	<!-- Stylesheets -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/plugins.css">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet"
	href="assets/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
<!-- Cusom css -->
<link rel="stylesheet" href="css/custom.css">

<!-- Modernizer js -->
<script src="js/vendor/modernizr-3.5.0.min.js"></script>
</head>
<style>
.carousel-item {
	height: 65vh;
	min-height: 350px;
	background: no-repeat center center scroll;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

.col-lg-3 col-md-4 col-sm-6 col-12 {
	margin-bottom: 50px;
}
</style>
<body>
	<!--[if lte IE 9]>
		<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
	<![endif]-->




	<!-- Main wrapper -->
	<div class="wrapper" id="wrapper">
		<!-- Header -->
		<header id="wn__header"
			class="header__area header__absolute sticky__header is-sticky">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-6 col-sm-6 col-6 col-lg-2">
						<div class="logo">
							<a href="index.html"> <img src="images/logo/Books-banner.png"
								alt="logo images">
							</a>
						</div>
					</div>
					<div class="col-lg-8 d-none d-lg-block">
						<nav class="mainmenu__nav">
							<ul class="meninmenu d-flex justify-content-start">
								<li class="drop with--one--item"><a href="home.htm">Trang
										chủ</a></li>

								<li class="drop"><a><p style="color: white !important">Thể loại</p></a>

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
							<li class="wishlist"><a class="cartbox_active" href="#"></a>
								<!-- Start Shopping Cart -->
								<div class="block-minicart minicart__active">
									<div class="minicart-content-wrapper">
										<div class="micart__close">
											<span>close</span>
										</div>

										<div class="single__items">
											<div class="miniproduct">

												<c:choose>
													<c:when test="${sessionScope.nickname != NULL}">
														<c:forEach var="u" items="${listFavBook}" end="2">

															<div class="item01 d-flex">
																<div class="thumb">
																	<a href="product-details.html"><img
																		src="${u.hinhAnh}" alt="product images"></a>
																</div>
																<div class="content">
																	<h6>
																		<a href="product-details.html">${u.tenSach}</a>
																	</h6>
																	<span class="prize"><%-- ${u.tacGia} --%></span>
																	<div
																		class="product_prize d-flex justify-content-between">
																		<span class="qun"></span>
																		<ul class="d-flex justify-content-end">
																			<li><a href="favbook/delete/${u.idSach}.htm"><i
																					class="zmdi zmdi-delete"></i></a></li>
																		</ul>
																	</div>
																</div>
															</div>
														</c:forEach>
													</c:when>
													<c:otherwise>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
										<div class="mini_action cart">
											<a class="cart__btn" href="favbook.htm">Xem truyện yêu
												thích của bạn</a>
										</div>
									</div>
								</div> <!-- End Shopping Cart --></li>
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
														<c:choose>
															<c:when test="${sessionScope.role == true}">
																<a href="dashboard.htm" class="dropdown-item"><i
																	class="fas fa-user mr-2"></i>Dashboard</a>
															</c:when>
														</c:choose>
														<a class="dropdown-item" href="account/changepass.htm"><i
															class="fas fa-exchange-alt mr-2"></i>Change password</a> <a
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
		<div
			class="brown--color box-search-content search_active block-bg close__top">
			<form id="search_mini_form" class="minisearch" action="search.htm"
				method="POST">
				<div class="field__search">
					<input type="text" placeholder="Tìm kiếm truyện ..."
						name="searchText">

					<div class="action">
						<a href="javascript:{}"
							onclick="document.getElementById('search_mini_form').submit();"><i
							class="zmdi zmdi-search"></i></a>
						<!-- nút tim kiếm ở đây  -->
					</div>
				</div>
			</form>
			<div class="close__wrap">
				<span>close</span>
			</div>
		</div>
		<!-- End Search Popup -->
		<!-- Start Slider area -->

		<header>
			<div id="carouselExampleIndicators" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<!-- Slide One - Set the background hinhAnh for this slide in the line below -->
					<div class="carousel-item active"
						style="background-image: url('https://pathforyou.org/wp-content/uploads/2018/10/slider-book-cover-1024x527.jpg'); opacity: 0.7;">
						<div class="carousel-caption d-none d-md-block"></div>
					</div>
					<!-- Slide Two - Set the background hinhAnh for this slide in the line below -->
					<div class="carousel-item"
						style="background-image: url('https://www.indesprocom.com/wp-content/uploads/2017/09/book-slider.jpg'); opacity: 0.7;">

					</div>
					<!-- Slide Three - Set the background hinhAnh for this slide in the line below -->
					<div class="carousel-item"
						style="background-image: url('https://mrhayxinhun.github.io/Project/Web%20ban%20sach%20online/images/slider-re4.jpg')">

					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</header>

		<!-- Page Content -->

		<!-- CAROUSEL-INNER -->
	</div>
	<!-- End Slider area -->
	<!-- Start BEst Seller Area -->
	<section class="wn__product__area brown--color pt--80  pb--30">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section__title text-center">
						<h2 class="title__be--2">
							Mới <span class="color--theme">Cập nhật</span>
						</h2>

					</div>
				</div>
			</div>
			<!-- Start Single Tab Content -->
			<div
				class="furniture--4 border--round arrows_style owl-carousel owl-theme row mt--50">
				<!-- Start Single Product -->
				<c:forEach var="x" items="${truyenHot}">
					<div class="product product__style--3">
						<div class="col-lg-3 col-md-4 col-sm-6 col-12">
							<div class="product__thumb">
								<a class="first__img" href="truyen/${x.idSach}.htm"><img
									src="${x.hinhAnh}"
									style="height: 340px !important; width: 270px !important;"
									alt="product hinhAnh"></a>
								<div class="hot__box">
									<span class="hot-label">ĐỌC NHIỀU</span>
								</div>
							</div>
							<div class="product__content content--center">
								<h3>
									<a href="truyen/${x.idSach}.htm">${x.tenSach}</a>
								</h3>
								<h4>
									<a href="truyen/${x.idSach}.htm"><%-- ${x.tacGia} --%></a>
								</h4>
								<div class="action">
									<div class="actions_inner">
										<ul class="add_to_links">
											<li><a title="Đọc ngay"
												class="quickview modal-view detail-link"
												href="truyen/${x.idSach}.htm"><i
													class="zmdi zmdi-long-arrow-right"></i></a></li>
											<li><a data-toggle="modal" title="Quick View"
												class="quickview modal-view detail-link"
												href="#productmodal${x.idSach}"><i
													class="zmdi zmdi-search"></i></a></li>
											<li><a title="Xem sau"
												class="quickview modal-view detail-link"
												href="favbook/${x.idSach}.htm" target="_blank"> <i
													class="fas fa-heart"></i></a></li>
										</ul>
									</div>
								</div>

							</div>
						</div>
					</div>
				</c:forEach>
				<!-- Start Single Product -->
			</div>
			<!-- End Single Tab Content -->
		</div>
	</section>
	<!-- Start BEst Seller Area -->
	<!-- Start NEwsletter Area -->
	<section class="wn__newsletter__area bg-hinhAnh--2">
		<div class="container">
			<div class="row"></div>
		</div>
	</section>
	<!-- End NEwsletter Area -->
	<!-- Start Best Seller Area -->
	<section class="wn__bestseller__area bg--white pt--80  pb--30">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section__title text-center">
						<h2 class="title__be--2">
							CÁC <span class="color--theme">THỂ LOẠI</span>
						</h2>

					</div>
				</div>
			</div>
			<div class="row mt--50">
				<div class="col-md-12 col-lg-12 col-sm-12">
					<div class="product__nav nav justify-content-center" role="tablist">
						<a class="nav-item nav-link active" data-toggle="tab"
							href="#nav-all" role="tab">Tiểu thuyết</a> <a
							class="nav-item nav-link" data-toggle="tab"
							href="#nav-biographic" role="tab">Kinh tế học</a> <a
							class="nav-item nav-link" data-toggle="tab" href="#nav-adventure"
							role="tab">Tâm lý</a> <a class="nav-item nav-link"
							data-toggle="tab" href="#nav-children" role="tab">Giả tưởng</a> <a
							class="nav-item nav-link" data-toggle="tab" href="#nav-cook"
							role="tab">Trinh thám</a>
					</div>
				</div>
			</div>
			<div class="tab__container mt--60">
				<!-- Start Single Tab Content -->
				<div class="row single__tab tab-pane fade show active" id="nav-all"
					role="tabpanel">
					<div
						class="product__indicator--4 arrows_style owl-carousel owl-theme">

						<c:set var="count1" value="1" />
						<%
							for (int i = 0; i < 5; i += 1) {
						%>
						<div class="single__product">

							<c:forEach var="z" items="${tieuthuyet}" begin="${count1}"
								end="${count1+1}">

								<div class="col-lg-3 col-md-4 col-sm-6 col-12">
									<div class="product product__style--3">
										<div class="product__thumb">
											<a class="first__img" href="truyen/${z.idSach}.htm"><img
												src="${z.hinhAnh}"
												style="height: 340px !important; width: 270px !important;"
												alt="product hinhAnh"></a>
											<div class="hot__box">
												<span class="hot-label">BEST SALLER</span>
											</div>
										</div>
										<div class="product__content content--center">
											<h3>
												<a href="truyen/${z.idSach}.htm">${z.tenSach}</a>
											</h3>
											<h4>
												<a href="truyen/${z.idSach}.htm"><%-- ${z.tacGia} --%></a>
											</h4>
											<div class="action">
												<div class="actions_inner">
													<ul class="add_to_links">
														<li><a title="Đọc ngay"
															class="quickview modal-view detail-link"
															href="truyen/${z.idSach}.htm"><i
																class="zmdi zmdi-long-arrow-right"></i></a></li>
														<li><a data-toggle="modal" title="Quick View"
															class="quickview modal-view detail-link"
															href="#productmodal${z.idSach}"><i
																class="zmdi zmdi-search"></i></a></li>
														<li><a title="Xem sau"
															class="quickview modal-view detail-link"
															href="favbook/${z.idSach}.htm" target="_blank"> <i
																class="fas fa-heart"></i></a></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>


							</c:forEach>


						</div>

						<c:set var="count1" value="${count1 + 2}" scope="page" />
						<%
							}
						%>
					</div>
				</div>
				<!-- End Single Tab Content -->
				<!-- Start Single Tab Content -->
				<div class="row single__tab tab-pane fade" id="nav-biographic"
					role="tabpanel">
					<div
						class="product__indicator--4 arrows_style owl-carousel owl-theme">

						<c:set var="count1" value="1" />
						<%
							for (int i = 0; i < 5; i += 1) {
						%>
						<div class="single__product">

							<c:forEach var="z" items="${kinhte}" begin="${count1}"
								end="${count1+1}">

								<div class="col-lg-3 col-md-4 col-sm-6 col-12">
									<div class="product product__style--3">
										<div class="product__thumb">
											<a class="first__img" href="truyen/${z.idSach}.htm"><img
												src="${z.hinhAnh}"
												style="height: 340px !important; width: 270px !important;"
												alt="product hinhAnh"></a>
											<div class="hot__box">
												<span class="hot-label">BEST SALLER</span>
											</div>
										</div>
										<div class="product__content content--center">
											<h3>
												<a href="truyen/${z.idSach}.htm">${z.tenSach}</a>
											</h3>
											<h4>
												<a href="truyen/${z.idSach}.htm"><%-- ${z.tacGia} --%></a>
											</h4>
											<div class="action">
												<div class="actions_inner">
													<ul class="add_to_links">
														<li><a title="Đọc ngay"
															class="quickview modal-view detail-link"
															href="truyen/${z.idSach}.htm"><i
																class="zmdi zmdi-long-arrow-right"></i></a></li>
														<li><a data-toggle="modal" title="Quick View"
															class="quickview modal-view detail-link"
															href="#productmodal${z.idSach}"><i
																class="zmdi zmdi-search"></i></a></li>
														<li><a title="Xem sau"
															class="quickview modal-view detail-link"
															href="favbook/${z.idSach}.htm" target="_blank"> <i
																class="fas fa-heart"></i></a></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>


							</c:forEach>


						</div>

						<c:set var="count1" value="${count1 + 2}" scope="page" />
						<%
							}
						%>
					</div>
				</div>
				<!-- End Single Tab Content -->
				<!-- Start Single Tab Content -->
				<div class="row single__tab tab-pane fade" id="nav-adventure"
					role="tabpanel">
					<div
						class="product__indicator--4 arrows_style owl-carousel owl-theme">

						<c:set var="count1" value="1" />
						<%
							for (int i = 0; i < 5; i += 1) {
						%>
						<div class="single__product">

							<c:forEach var="z" items="${tamly}" begin="${count1}"
								end="${count1+1}">

								<div class="col-lg-3 col-md-4 col-sm-6 col-12">
									<div class="product product__style--3">
										<div class="product__thumb">
											<a class="first__img" href="truyen/${z.idSach}.htm"><img
												src="${z.hinhAnh}"
												style="height: 340px !important; width: 270px !important;"
												alt="product hinhAnh"></a>
											<div class="hot__box">
												<span class="hot-label">BEST SALLER</span>
											</div>
										</div>
										<div class="product__content content--center">
											<h3>
												<a href="truyen/${z.idSach}.htm">${z.tenSach}</a>
											</h3>
											<h4>
												<a href="truyen/${z.idSach}.htm"><%-- ${z.tacGia} --%></a>
											</h4>
											<div class="action">
												<div class="actions_inner">
													<ul class="add_to_links">
														<li><a title="Đọc ngay"
															class="quickview modal-view detail-link"
															href="truyen/${z.idSach}.htm"><i
																class="zmdi zmdi-long-arrow-right"></i></a></li>
														<li><a data-toggle="modal" title="Quick View"
															class="quickview modal-view detail-link"
															href="#productmodal${z.idSach}"><i
																class="zmdi zmdi-search"></i></a></li>
														<li><a title="Xem sau"
															class="quickview modal-view detail-link"
															href="favbook/${z.idSach}.htm" target="_blank"> <i
																class="fas fa-heart"></i></a></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>


							</c:forEach>


						</div>

						<c:set var="count1" value="${count1 + 2}" scope="page" />
						<%
							}
						%>
					</div>
				</div>
				<!-- End Single Tab Content -->
				<!-- Start Single Tab Content -->
				<div class="row single__tab tab-pane fade" id="nav-children"
					role="tabpanel">
					<div
						class="product__indicator--4 arrows_style owl-carousel owl-theme">

						<c:set var="count1" value="1" />
						<%
							for (int i = 0; i < 5; i += 1) {
						%>
						<div class="single__product">

							<c:forEach var="z" items="${giatuong}" begin="${count1}"
								end="${count1+1}">

								<div class="col-lg-3 col-md-4 col-sm-6 col-12">
									<div class="product product__style--3">
										<div class="product__thumb">
											<a class="first__img" href="truyen/${z.idSach}.htm"><img
												src="${z.hinhAnh}"
												style="height: 340px !important; width: 270px !important;"
												alt="product hinhAnh"></a>
											<div class="hot__box">
												<span class="hot-label">BEST SALLER</span>
											</div>
										</div>
										<div class="product__content content--center">
											<h3>
												<a href="truyen/${z.idSach}.htm">${z.tenSach}</a>
											</h3>
											<h4>
												<a href="truyen/${z.idSach}.htm"><%-- ${z.tacGia} --%></a>
											</h4>
											<div class="action">
												<div class="actions_inner">
													<ul class="add_to_links">
														<li><a title="Đọc ngay"
															class="quickview modal-view detail-link"
															href="truyen/${z.idSach}.htm"><i
																class="zmdi zmdi-long-arrow-right"></i></a></li>
														<li><a data-toggle="modal" title="Quick View"
															class="quickview modal-view detail-link"
															href="#productmodal${z.idSach}"><i
																class="zmdi zmdi-search"></i></a></li>
														<li><a title="Xem sau"
															class="quickview modal-view detail-link"
															href="favbook/${z.idSach}.htm" target="_blank"> <i
																class="fas fa-heart"></i></a></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>


							</c:forEach>


						</div>

						<c:set var="count1" value="${count1 + 2}" scope="page" />
						<%
							}
						%>
					</div>
				</div>
				<!-- End Single Tab Content -->
				<!-- Start Single Tab Content -->
				<div class="row single__tab tab-pane fade" id="nav-cook"
					role="tabpanel">
					<div
						class="product__indicator--4 arrows_style owl-carousel owl-theme">

						<c:set var="count1" value="1" />
						<%
							for (int i = 0; i < 5; i += 1) {
						%>
						<div class="single__product">

							<c:forEach var="z" items="${trinhtham}" begin="${count1}"
								end="${count1+1}">

								<div class="col-lg-3 col-md-4 col-sm-6 col-12">
									<div class="product product__style--3">
										<div class="product__thumb">
											<a class="first__img" href="truyen/${z.idSach}.htm"><img
												src="${z.hinhAnh}"
												style="height: 340px !important; width: 270px !important;"
												alt="product hinhAnh"></a>
											<div class="hot__box">
												<span class="hot-label">BEST SALLER</span>
											</div>
										</div>
										<div class="product__content content--center">
											<h3>
												<a href="truyen/${z.idSach}.htm">${z.tenSach}</a>
											</h3>
											<h4>
												<a href="truyen/${z.idSach}.htm"><%-- ${z.tacGia} --%></a>
											</h4>
											<div class="action">
												<div class="actions_inner">
													<ul class="add_to_links">
														<li><a title="Đọc ngay"
															class="quickview modal-view detail-link"
															href="truyen/${z.idSach}.htm"><i
																class="zmdi zmdi-long-arrow-right"></i></a></li>
														<li><a data-toggle="modal" title="Quick View"
															class="quickview modal-view detail-link"
															href="#productmodal${z.idSach}"><i
																class="zmdi zmdi-search"></i></a></li>
														<li><a title="Xem sau"
															class="quickview modal-view detail-link"
															href="favbook/${z.idSach}.htm" target="_blank"> <i
																class="fas fa-heart"></i></a></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>


							</c:forEach>


						</div>

						<c:set var="count1" value="${count1 + 2}" scope="page" />
						<%
							}
						%>
					</div>
				</div>
				<!-- End Single Tab Content -->
			</div>
		</div>
	</section>
	<!-- Start BEst Seller Area -->
	<!-- Start Recent Post Area -->

	<!-- End Recent Post Area -->
	<!-- Best Sale Area -->
	<section class="best-seel-area pt--80 pb--60">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section__title text-center pb--50">
						<h2 class="title__be--2">
							Sách <span class="color--theme">Ngẫu nhiên </span>
						</h2>

					</div>
				</div>
			</div>
		</div>
		<div class="slider center">
			<c:forEach var="t" items="${truyenRandom}">
				<div class="product product__style--3">
					<div class="product__thumb">
						<a class="first__img" href="truyen/${t.idSach}.htm"><img
							src="${t.hinhAnh}"
							style="height: 384px !important; width: 304px !important;"
							alt="product hinhAnh"></a>
					</div>
					<div class="product__content content--center">
						<div class="action">
							<div class="actions_inner">
								<ul class="add_to_links">
									<li><a title="Đọc ngay"
										class="quickview modal-view detail-link"
										href="truyen/${t.idSach}.htm"><i
											class="zmdi zmdi-long-arrow-right"></i></a></li>
									<li><a data-toggle="modal" title="Quick View"
										class="quickview modal-view detail-link"
										href="#productmodal${t.idSach}"><i
											class="zmdi zmdi-search"></i></a></li>
									<li><a title="Xem sau"
										class="quickview modal-view detail-link"
										href="favbook/${t.idSach}.htm" target="_blank"> <i
											class="fas fa-heart"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>
	<!-- Best Sale Area Area -->
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
	<!-- QUICKVIEW PRODUCT -->
	<div id="quickview-wrapper">
		<!-- Modal -->


		<c:forEach var="z" items="${truyenHot}">

			<div class="modal fade" id="productmodal${z.idSach}" tabindex="-1"
				role="dialog">
				<div class="modal-dialog modal__container" role="document">
					<div class="modal-content">
						<div class="modal-header modal__header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="modal-product">
								<!-- Start product images -->
								<div class="product-images">
									<div class="main-image images">
										<img alt="big images" src="${z.hinhAnh }"
											style="height: 614px !important; width: 420px !important;">
									</div>
								</div>
								<!-- end product images -->
								<div class="product-info">
									<h1>${z.tenSach}</h1>
									<div class="rating__and__review">
										<div class="review">
											<a href="#"><%-- ${z.tacGia} --%></a>
										</div>
									</div>
									<div class="quick-desc">${z.gioiThieu}</div>
									<div class="addtocart-btn">
										<a href="truyen/${z.idSach}.htm">Đọc ngay</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


		</c:forEach>
		<c:forEach var="z" items="${truyenRandom}">

			<div class="modal fade" id="productmodal${z.idSach}" tabindex="-1"
				role="dialog">
				<div class="modal-dialog modal__container" role="document">
					<div class="modal-content">
						<div class="modal-header modal__header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="modal-product">
								<!-- Start product images -->
								<div class="product-images">
									<div class="main-image images">
										<img alt="big images" src="${z.hinhAnh }"
											style="height: 614px !important; width: 420px !important;">
									</div>
								</div>
								<!-- end product images -->
								<div class="product-info">
									<h1>${z.tenSach}</h1>
									<div class="rating__and__review">

										<div class="review">
											<a href="#"><%-- ${z.tacGia} --%></a>
										</div>
									</div>

									<div class="quick-desc">${z.gioiThieu}</div>

									<div class="addtocart-btn">
										<a href="truyen/${z.idSach}.htm">Đọc ngay</a>
									</div>

								</div>


							</div>


						</div>
					</div>
				</div>
			</div>


		</c:forEach>
		<c:forEach var="z" items="${trinhtham}">

			<div class="modal fade" id="productmodal${z.idSach}" tabindex="-1"
				role="dialog">
				<div class="modal-dialog modal__container" role="document">
					<div class="modal-content">
						<div class="modal-header modal__header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="modal-product">
								<!-- Start product images -->
								<div class="product-images">
									<div class="main-image images">
										<img alt="big images" src="${z.hinhAnh }"
											style="height: 614px !important; width: 420px !important;">
									</div>
								</div>
								<!-- end product images -->
								<div class="product-info">
									<h1>${z.tenSach}</h1>
									<div class="rating__and__review">

										<div class="review">
											<a href="#"><%-- ${z.tacGia} --%></a>
										</div>
									</div>

									<div class="quick-desc">${z.gioiThieu}</div>

									<div class="addtocart-btn">
										<a href="truyen/${z.idSach}.htm">Đọc ngay</a>
									</div>

								</div>


							</div>


						</div>
					</div>
				</div>
			</div>


		</c:forEach>
		<c:forEach var="z" items="${giatuong}">

			<div class="modal fade" id="productmodal${z.idSach}" tabindex="-1"
				role="dialog">
				<div class="modal-dialog modal__container" role="document">
					<div class="modal-content">
						<div class="modal-header modal__header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="modal-product">
								<!-- Start product images -->
								<div class="product-images">
									<div class="main-image images">
										<img alt="big images" src="${z.hinhAnh }"
											style="height: 614px !important; width: 420px !important;">
									</div>
								</div>
								<!-- end product images -->
								<div class="product-info">
									<h1>${z.tenSach}</h1>
									<div class="rating__and__review">

										<div class="review">
											<a href="#"><%-- ${z.tacGia} --%></a>
										</div>
									</div>

									<div class="quick-desc">${z.gioiThieu}</div>

									<div class="addtocart-btn">
										<a href="truyen/${z.idSach}.htm">Đọc ngay</a>
									</div>

								</div>


							</div>
						</div>
					</div>
				</div>
			</div>


		</c:forEach>
		<c:forEach var="z" items="${tamly}">

			<div class="modal fade" id="productmodal${z.idSach}" tabindex="-1"
				role="dialog">
				<div class="modal-dialog modal__container" role="document">
					<div class="modal-content">
						<div class="modal-header modal__header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="modal-product">
								<!-- Start product images -->
								<div class="product-images">
									<div class="main-image images">
										<img alt="big images" src="${z.hinhAnh }"
											style="height: 614px !important; width: 420px !important;">
									</div>
								</div>
								<!-- end product images -->
								<div class="product-info">
									<h1>${z.tenSach}</h1>
									<div class="rating__and__review">

										<div class="review">
											<a href="#"><%-- ${z.tacGia} --%></a>
										</div>
									</div>

									<div class="quick-desc">${z.gioiThieu}</div>

									<div class="addtocart-btn">
										<a href="truyen/${z.idSach}.htm">Đọc ngay</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


		</c:forEach>
		<c:forEach var="z" items="${kinhte}">

			<div class="modal fade" id="productmodal${z.idSach}" tabindex="-1"
				role="dialog">
				<div class="modal-dialog modal__container" role="document">
					<div class="modal-content">
						<div class="modal-header modal__header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="modal-product">
								<!-- Start product images -->
								<div class="product-images">
									<div class="main-image images">
										<img alt="big images" src="${z.hinhAnh }"
											style="height: 614px !important; width: 420px !important;">
									</div>
								</div>
								<!-- end product images -->
								<div class="product-info">
									<h1>${z.tenSach}</h1>
									<div class="rating__and__review">

										<div class="review">
											<a href="#"><%-- ${z.tacGia} --%></a>
										</div>
									</div>

									<div class="quick-desc">${z.gioiThieu}</div>

									<div class="addtocart-btn">
										<a href="truyen/${z.idSach}.htm">Đọc ngay</a>
									</div>

								</div>


							</div>


						</div>
					</div>
				</div>
			</div>


		</c:forEach>

		<c:forEach var="z" items="${tieuthuyet}">

			<div class="modal fade" id="productmodal${z.idSach}" tabindex="-1"
				role="dialog">
				<div class="modal-dialog modal__container" role="document">
					<div class="modal-content">
						<div class="modal-header modal__header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="modal-product">
								<!-- Start product images -->
								<div class="product-images">
									<div class="main-image images">
										<img alt="big images" src="${z.hinhAnh }"
											style="height: 614px !important; width: 420px !important;">
									</div>
								</div>
								<!-- end product images -->
								<div class="product-info">
									<h1>${z.tenSach}</h1>
									<div class="rating__and__review">

										<div class="review">
											<a href="#"><%-- ${z.tacGia} --%></a>
										</div>
									</div>

									<div class="quick-desc">${z.gioiThieu}</div>

									<div class="addtocart-btn">
										<a href="truyen/${z.idSach}.htm">Đọc ngay</a>
									</div>

								</div>


							</div>


						</div>
					</div>
				</div>
			</div>


		</c:forEach>

	</div>
	<!-- END QUICKVIEW PRODUCT -->
	</div>
	<!-- //Main wrapper -->

	<!-- JS Files -->
	<script src="js/vendor/jquery-3.2.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/active.js"></script>
	<!--	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.slim.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"></script>-->
</body>
</html>