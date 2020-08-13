<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>Thể loại</title>
	<base href="${pageContext.servletContext.contextPath}/">
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Favicons -->
	<link rel="shortcut icon" href="images/favicon.ico">
	<link rel="apple-touch-icon" href="images/icon.png">

	<!-- Google font (font-family: 'Roboto', sans-serif; Poppins ; Satisfy) -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">

	<!-- Stylesheets -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/plugins.css">
	<link rel="stylesheet" href="style.css">
	<link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
	<!-- Cusom css -->
   <link rel="stylesheet" href="css/custom.css">

	<!-- Modernizer js -->
	<script src="js/vendor/modernizr-3.5.0.min.js"></script>
</head>
<body>
	<!--[if lte IE 9]>
		<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
	<![endif]-->

	<!-- Main wrapper -->
	<div class="wrapper" id="wrapper">
		
		<!-- Header -->
		<header id="wn__header" class="oth-page header__area header__absolute sticky__header">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-4 col-sm-4 col-7 col-lg-2">
						<div class="logo">
							<a href="main.htm">
								<img src="images/logo/logo.png" alt="logo images">
							</a>
						</div>
					</div>
					<div class="col-lg-8 d-none d-lg-block">
						<nav class="mainmenu__nav">
							<ul class="meninmenu d-flex justify-content-start">
								<li class="drop with--one--item"><a href="home.htm">Trang chủ</a></li>
								<li class="drop"><a href="#">Thể loại</a>
									<div class="megamenu mega04">
									<c:set var="count" value="1" />
										 <% for(int i = 0; i < 6; i+=1) { %>
										 <ul class="item item03">
										<c:forEach var="u" items = "${categories}" begin="${count}" end="${count+4}">
											<li><a href="theloai/${u.idTheLoai}/1.htm">${u.tenTheLoai } </a></li>
										</c:forEach>
										</ul>
										<c:set var="count" value="${count + 5}" scope="page"/>
										 <%} %>
										
									</div>
								</li>
								
							</ul>
						</nav>
					</div>
					<div class="col-md-8 col-sm-8 col-5 col-lg-2">
						<ul class="header__sidebar__right d-flex justify-content-end align-items-center">
							<li class="shop_search"><a class="search__active" href="#"></a></li>
							<li class="wishlist"><a href="#"></a></li>
							
							<li class="setting__bar__icon"><a class="setting__active"
								href="#"></a>
								<div class="searchbar__content setting__block">
									<div class="content-inner">
										<div class="switcher-currency">
											<c:choose>
												<c:when test="${sessionScope.nickname != NULL}">
													<strong class="label switcher-label" style="text-align:center!important"> <span>${sessionScope.nickname}</span>
													</strong>
													<div class="switcher-options">
												
                                <a href="account/logout.htm" class="dropdown-item"><i class="fas fa-user mr-2"></i>Account</a>
                                <a class="dropdown-item" href="account/logout.htm"><i class="fas fa-power-off mr-2"></i>Logout</a>
                                		</div>
                            
													
												</c:when>
												<c:otherwise>
        					<strong class="label switcher-label"><a href="account.htm"> <span>Login</span></a>
													</strong>
													<div class="switcher-options">
														<strong class="label switcher-label"><a href="account/register.htm"> <span>Create account</span></a>
													</strong>
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
	            <div class="mobile-menu d-block d-lg-none">
	            </div>
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
        <!-- Start Shop Page -->
        <div class="page-shop-sidebar left--sidebar bg--white section-padding--lg">
        	<div class="container">
        		<div class="row">
        			<div class="col-lg-3 col-12 order-2 order-lg-1 md-mt-40 sm-mt-40">
        				<div class="shop__sidebar">
        					<aside class="wedget__categories poroduct--cat">
        						<h3 class="wedget__title">Thể loại</h3>
        						<ul>
        							<c:forEach var="u" items = "${categories}" >
										<li><a href="theloai/${u.idTheLoai}/1.htm">${u.tenTheLoai } </a></li>
									</c:forEach>
        						</ul>
        					</aside>
        					
        				</div>
        			</div>
        			<div class="col-lg-9 col-12 order-1 order-lg-2">
        				<div class="row">
        					<div class="col-lg-12">
								<div class="shop__list__wrapper d-flex flex-wrap flex-md-nowrap justify-content-between">
									
		                        </div>
        					</div>
        				</div>
        				<div class="tab__container">
	        				<div class="shop-grid tab-pane fade show active" id="nav-grid" role="tabpanel">
	        					<div class="row">
	        						<!-- Start Single Product -->
	        						<c:forEach var="u" items = "${truyens}">
		        					<div class="product product__style--3 col-lg-4 col-md-4 col-sm-6 col-12">
			        					<div class="product__thumb">
											<a class="first__img" href="truyen/${u.idSach}.htm"><img src="${u.hinhAnh}" style="height:340px!important; width:270px!important;" alt="product image"></a>
											<div class="hot__box">
												<span class="hot-label">BEST SALLER</span>
											</div>
										</div>
										<div class="product__content content--center">
											<h3><a href="truyen/${u.idSach}.htm">${u.tenSach}</a></h3>
											<h4><a href="truyen/${u.idSach}.htm"><%-- ${u.tacGia} --%></a></h4>
											<div class="action">
												<div class="actions_inner">
													<ul class="add_to_links">
														<li><a title="Đọc ngay" class="quickview modal-view detail-link" href="truyen/${u.idSach}.htm"><i class="zmdi zmdi-long-arrow-right"></i></a></li>
											<li><a data-toggle="modal" title="Quick View" class="quickview modal-view detail-link" href="#productmodal${u.idSach}"><i class="zmdi zmdi-search"></i></a></li>
											<li><a  title="Xem sau"
												class="quickview modal-view detail-link"
												href="favbook/${u.idSach}.htm" target="_blank">	<i class="fas fa-heart"></i></a></li>
													</ul>
												</div>
											</div>
											
										</div>
		        					</div>
		        					</c:forEach>
		        					<!-- End Single Product -->
	        						<!-- Start Single Product -->
		        				
		        				
		        					<!-- End Single Product -->
	        					</div>
	        					<ul class="wn__pagination">
	        					
	        						<% int temp = (int)request.getAttribute("num"); %>
	        						<% int temp1 = (int)request.getAttribute("numPage"); %>
	        						<% if (temp1>1) {%>
	        							<li><a href="theloai/${idTheLoai}/<%=temp1-1%>.htm"><i class="zmdi zmdi-chevron-left"></i></a></li>
	        						<%} %>
	        						<% for(int i = 0 ; i < temp ; i++){ %>
	        							<% if(temp1==i+1){ %>
	        								<li class="active"><a href="theloai/${idTheLoai}/<%=i+1%>.htm"><%=i+1%></a></li> 
	        							<%} else{ %>
	        							
	        							<li><a href="theloai/${idTheLoai}/<%=i+1%>.htm"><%=i+1%></a></li>
	        							<%}%>
	        						<%} %>
	        						<% if (temp>1 && temp!=temp1) {%>
	        							<li><a href="theloai/${idTheLoai}/<%=temp1+1%>.htm"><i class="zmdi zmdi-chevron-right"></i></a></li>
	        						<%} %>
	        					</ul>
	        				</div>
	        				<
        				</div>
        			</div>
        		</div>
        	</div>
        </div>
        <!-- End Shop Page -->
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
									<li><a href="facebook.com/hahuuvuong"><i class="fab fa-facebook-f"></i></a></li>
									<li><a href="#"><i class="fab fa-google" ></i></a></li>
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
											href="http://localhost:9999/ebook/home.htm">Ebook.com</a>
										Tổ chức phi lợi nhuận
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
		   <c:forEach var="z" items = "${truyens}" >
		    
		    <div class="modal fade" id="productmodal${z.idSach}" tabindex="-1" role="dialog">
		        <div class="modal-dialog modal__container" role="document">
		            <div class="modal-content">
		                <div class="modal-header modal__header">
		                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		                </div>
		                <div class="modal-body">
		                    <div class="modal-product">
		                        <!-- Start product images -->
		                        <div class="product-images">
		                            <div class="main-image images">
		                                <img alt="big images" src="${z.hinhAnh }" style="height:614px!important; width:420px!important;">
		                            </div>
		                        </div>
		                        <!-- end product images -->
		                        <div class="product-info">
		                            <h1>${z.tenSach}</h1>
		                            <div class="rating__and__review">
		                                
		                                <div class="review">
		                                 <%--    ${z.tacGia} --%>
		                                </div>
		                            </div>
		                            
		                            <div class="quick-desc">
		                               ${z.gioiThieu}
		                            </div>
		                            
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
		
	</body>
	</html>