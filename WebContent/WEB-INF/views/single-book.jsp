<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!doctype html>
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
<script src="js/vendor/modernizr-3.5.0.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>
<body>
	<!--[if lte IE 9]>
		<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
	<![endif]-->

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
							<li class="wishlist"><a href="favbook.htm"></a></li>
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
		<!-- End Search Popup -->
		<!-- Start Bradcaump area -->

		<!-- End Bradcaump area -->
		<!-- Start main Content -->
		<div class="maincontent brown--color pt--80 pb--55">
			<div class="container">
				<div class="row">
					<div class="col-lg-9 col-12">
						<div class="wn__single__product">
							<div class="row">
								<div class="col-lg-6 col-12">
									<div class="wn__fotorama__wrapper">
										<!-- <div class="fotorama wn__fotorama__action" > -->
										<a href="${truyen.hinhAnh}" target="_blank"> <img
											src="${truyen.hinhAnh}"
											style="height: 565px !important; width: 450px !important;"></a>

										<!-- </div> -->
									</div>
								</div>
								<div class="col-lg-6 col-12">
									<div class="product__info__main">
										<h1>${truyen.tenSach}</h1>
										<div class="product__overview">
											<p>
												<%-- ${truyen.tacGia} --%>
											</p>
										</div>

										<div class="product_meta mb-3">
											<span class="posted_in">Tác giả: 
											<c:forEach var="u"
													items="${truyen.tacgias}">
													<a href="">${u.tenTacGia}</a>,
												</c:forEach>
											</span>
										</div>
										<div class="product_meta mb-3">
											<span class="posted_in">Thể loại: <a
												href="theloai/${truyen.idTheLoai.idTheLoai}/1.htm">${truyen.idTheLoai.tenTheLoai }</a>
											</span>
										</div>
										
										<div class="product_meta mb-3">
											<span class="posted_in">Nhà xuất bản: <a
												href="theloai/${truyen.idTheLoai.idTheLoai}/1.htm">${truyen.NXB.tenNXB }</a>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="product__info__detailed">
							<div class="pro_details_nav nav justify-content-start"
								role="tablist">
								<a class="nav-item nav-link active" data-toggle="tab"
									href="#nav-details" role="tab">Tóm tắt</a> <a
									class="nav-item nav-link" data-toggle="tab"
									href="#nav-listchapter" role="tab">Chapter</a> <a
									class="nav-item nav-link" data-toggle="tab" href="#nav-review"
									role="tab">Đánh giá</a> <a class="nav-item nav-link"
									data-toggle="tab" href="#nav-write-review" role="tab">Viết
									đánh giá</a>
							</div>
							<div class="tab__container">
								<!-- Start Single Tab Content -->
								<div class="pro__tab_label tab-pane fade show active"
									id="nav-details" role="tabpanel">
									<div class="description__attribute">${truyen.gioiThieu}</div>
								</div>
								<!-- End Single Tab Content -->
								<!-- Start Single Tab Content -->
								<div class="pro__tab_label tab-pane fade" id="nav-listchapter"
									role="tabpanel">
									<c:choose>
										<c:when test="${listSize == 0}">
											<div class="container">
												<div class="row">
													<div class="col text-center">
														<p style="font-size: 20px">Các chương của sách hiện
															tại chưa được cập nhật!</p>
													</div>
												</div>
											</div>
										</c:when>
										<c:otherwise>

											<nav id="list-chapter">
												<ul class="list-group">
													<c:forEach var="u" items="${chapter}">
														<li class="list-group-item"><div class="row">
																<div class="col align-self-start">
																	<a href="chapter/${truyen.idSach}/${u.idChuong}.htm">${u.tenChuong}</a>
																</div>
																<div class="col align-self-end">
																	<p style="float: right !important">${u.luotDoc}
																		lượt đọc</p>
																</div>
															</div></li>
													</c:forEach>
												</ul>
											</nav>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="pro__tab_label tab-pane fade " id="nav-review"
									role="tabpanel">
									<c:choose>
										<c:when test="${listAssessSize == 0}">
											<div class="container">
												<div class="row">
													<div class="col">
														<p style="font-size: 20px">Hiện chưa có đánh giá nào!</p>
													</div>
												</div>
											</div>
										</c:when>
										<c:otherwise>
											<nav id="list-chapter">
												<ul class="list-group">
													<c:forEach var="u" items="${listAssess}">
														<li class="list-group-item"><div class="container">
																<div class="row" style="font-size: 20px">
																	<i class="fa fa-star text-warning" aria-hidden="true"></i>${u.soDiem}/5
																	- <b> ${u.tieuDe}</b>
																</div>
																<div class="row">
																	<p>${u.thoiGian}|${u.idDocGia.tenDocGia}</p>
																</div>
																<div class="row mt-2" style="font-size: 20px">
																	<p>${u.noiDung}</p>
																</div>
															</div></li>
													</c:forEach>
												</ul>
											</nav>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="pro__tab_label tab-pane fade " id="nav-write-review"
									role="tabpanel">
									<c:choose>
										<c:when test="${sessionScope.nickname != NULL}">
											<form:form action="rateform/${truyen.idSach}.htm"
												modelAttribute="rateForm" method="post">
												<div class="form-group">
													<div class="row m-2">
														<label for="exampleFormControlInput1">Đánh giá của
															bạn về sách ?</label>
													</div>
													<div class="row">
														<div class="rating">
															<span><input type="radio" name="rating" id="str5"
																value="5"><label for="str5"><i
																	class="zmdi zmdi-star-outline"></i></label></span> <span><input
																type="radio" name="rating" id="str4" value="4"><label
																for="str4"><i class="zmdi zmdi-star-outline"></i></label></span>
															<span><input type="radio" name="rating" id="str3"
																value="3"><label for="str3"><i
																	class="zmdi zmdi-star-outline"></i></label></span> <span><input
																type="radio" name="rating" id="str2" value="2"><label
																for="str2"><i class="zmdi zmdi-star-outline"></i></label></span>
															<span><input type="radio" name="rating" id="str1"
																value="1"><label for="str1"><i
																	class="zmdi zmdi-star-outline"></i></label></span>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label for="titleAssessment">Tiêu đề của đánh giá </label>
													<form:textarea class="form-control" path="TieuDe" rows="1"></form:textarea>
												</div>
												<div class="form-group">
													<label for="exampleFormControlTextarea1">Viết nhận
														xét của bạn</label>
													<form:textarea class="form-control" path="NoiDung" rows="3"></form:textarea>
												</div>
												<div class="d-flex justify-content-center mb-3">
													<button class="btn btn-warning" type="submit">Gửi
														đánh giá</button>
												</div>
											</form:form>
										</c:when>
										<c:otherwise>
											<div class="container">
												<div class="row text-center" style="font-size: 20px">
													<p>Vui lòng&nbsp</p>
													<a href="account.htm"><i>đăng nhập</i></a>
													<p>&nbsphoặc&nbsp</p>
													<a href="account/register.htm"><i>đăng ký </i></a>
													<p>&nbspđể đánh giá!</p>
												</div>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
								<!-- End Single Tab Content -->
							</div>
						</div>
						<div class="wn__related__product pt--80 pb--50">
							<div class="section__title text-center">
								<h2 class="title__be--2">sách cùng thể loại</h2>
							</div>
							<div class="row mt--60">
								<div
									class="productcategory__slide--2 arrows_style owl-carousel owl-theme">
									<!-- Start Single Product -->
									<c:forEach var="u" items="${relatedBook}">

										<div
											class="product product__style--3 col-lg-4 col-md-4 col-sm-6 col-12">
											<div class="product__thumb">
												<a class="first__img" href="truyen/${u.idSach}.htm"><img
													src="${u.hinhAnh}" alt="product image"
													style="height: 340px !important; width: 270px !important;"></a>
												<div class="hot__box">
													<span class="hot-label">BEST SALLER</span>
												</div>
											</div>
											<div class="product__content content--center">
												<h4>
													<a href="single-product.html">${u.tenSach}</a>
												</h4>

												<div class="action">
													<div class="actions_inner">
														<ul class="add_to_links">
															<li><a title="Đọc ngay"
																class="quickview modal-view detail-link"
																href="truyen/${u.idSach}.htm"><i
																	class="zmdi zmdi-long-arrow-right"></i></a></li>
															<li><a data-toggle="modal" title="Quick View"
																class="quickview modal-view detail-link"
																href="#productmodal${u.idSach}"><i
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
									</c:forEach>
								</div>
							</div>
						</div>

					</div>
					<div class="col-lg-3 col-12 md-mt-40 sm-mt-40">
						<div class="shop__sidebar">
							<aside class="wedget__categories poroduct--cat">
								<h3 class="wedget__title">Thể loại sách</h3>
								<ul>
									<c:forEach var="u" items="${categories}">
										<li><a href="theloai/${u.idTheLoai}/1.htm">${u.tenTheLoai }
										</a></li>

									</c:forEach>
								</ul>
							</aside>


						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End main Content -->
		<!-- Start Search Popup -->
		<div class="box-search-content search_active block-bg close__top">
			<form id="search_mini_form--2" class="minisearch" action="#">
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

			<c:forEach var="z" items="${relatedBook}">

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
												<a href="#"> <%-- ${z.tacGia} --%>
												</a>
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
			<!-- END Modal -->
		</div>
		<!-- END QUICKVIEW PRODUCT -->

	</div>
	<!-- //Main wrapper -->


	<script>
		$(document).ready(function() {
			// Check Radio-box
			$(".rating input:radio").attr("checked", false);

			$('.rating input').click(function() {
				$(".rating span").removeClass('checked');
				$(this).parent().addClass('checked');
			});

			$('input:radio').change(function() {
				var userRating = this.value;
			});
		});
		
	</script>
	<!-- JS Files -->
	<script src="js/vendor/jquery-3.2.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/active.js"></script>

</body>
</html>