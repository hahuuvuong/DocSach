<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Các thể loại</title>
<base href="${pageContext.servletContext.contextPath}/">
<!-- Bootstrap CSS -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,500,600,600i,700,700i,800"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900"
	rel="stylesheet">
<link rel="stylesheet"
	href="assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/libs/css/style.css">
<link rel="stylesheet"
	href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
<link rel="stylesheet" type="text/css"
	href="assets/vendor/datatables/css/dataTables.bootstrap4.css">
<link rel="stylesheet" type="text/css"
	href="assets/vendor/datatables/css/buttons.bootstrap4.css">
<link rel="stylesheet" type="text/css"
	href="assets/vendor/datatables/css/select.bootstrap4.css">
<link rel="stylesheet" type="text/css"
	href="assets/vendor/datatables/css/fixedHeader.bootstrap4.css">
</head>
<style type="text/css">
td {
	display: inline-block;
	width: 18.295em;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	height: 50px;
}

td.nobreak {
	white-space: nowrap;
}

th {
	display: inline-block;
	width: 18.295em;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
</style>
<body>
	<!-- ============================================================== -->
	<!-- main wrapper -->
	<!-- ============================================================== -->
	<div class="dashboard-main-wrapper">
		<!-- ============================================================== -->
		<!-- navbar -->
		<!-- ============================================================== -->
		<div class="dashboard-header">
			<nav class="navbar navbar-expand-lg bg-white fixed-top">
				<a class="navbar-brand" href="/DocSach/dashboard.htm">Home</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
			</nav>
		</div>
		<!-- ============================================================== -->
		<!-- end navbar -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- left sidebar -->
		<!-- ============================================================== -->
		<div class="nav-left-sidebar sidebar-dark">
			<div class="menu-list">
				<nav class="navbar navbar-expand-lg navbar-light">
					<a class="d-xl-none d-lg-none" href="#">Dashboard</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarNav" aria-controls="navbarNav"
						aria-expanded="true" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarNav">
						<ul class="navbar-nav flex-column">
							<li class="nav-divider">Menu</li>
							<li class="nav-item "><a class="nav-link active" href="#"
								data-toggle="collapse" aria-expanded="false"
								data-target="#submenu-1" aria-controls="submenu-1"><i
									class="fa fa-fw fa-user-circle"></i>Dashboard <span
									class="badge badge-success">6</span></a>
								<div id="submenu-1" class="collapse submenu show">
									<ul class="nav flex-column">
										<li class="nav-item"><a class="nav-link" href="#"
											data-toggle="collapse" aria-expanded="false"
											data-target="#submenu-1-2" aria-controls="submenu-1-2">Thể
												loại</a>
											<div id="submenu-1-2" class="collapse submenu" style="">
												<ul class="nav flex-column">
													<li class="nav-item"><a class="nav-link"
														href="dashboard/theloai.htm">Các thể loại</a></li>

												</ul>
											</div></li>

										<li class="nav-item"><a class="nav-link" href="#"
											data-toggle="collapse" aria-expanded="false"
											data-target="#submenu-1-1" aria-controls="submenu-1-1">Truyện</a>
											<div id="submenu-1-1" class="collapse submenu" style="">
												<ul class="nav flex-column">
													<li class="nav-item"><a class="nav-link"
														href="addtruyen.htm">Thêm truyện</a></li>
													<li class="nav-item"><a class="nav-link"
														href="inserttruyen/1.htm">Chỉnh sửa truyện</a></li>
												</ul>
											</div></li>
										<li class="nav-item"><a class="nav-link" href="#"
											data-toggle="collapse" aria-expanded="false"
											data-target="#submenu-1-0" aria-controls="submenu-1-0">Chapter</a>
											<div id="submenu-1-0" class="collapse submenu" style="">
												<ul class="nav flex-column">
													<li class="nav-item"><a class="nav-link"
														href="addchapter.htm">Thêm chapter</a></li>
													<li class="nav-item"><a class="nav-link"
														href="insertchapter/1.htm">Chỉnh sửa chapter</a></li>
												</ul>
											</div></li>
										<c:choose>
											<c:when test="${sessionScope.username == 'sa'}">
												<li class="nav-item"><a class="nav-link" href="#"
													data-toggle="collapse" aria-expanded="false"
													data-target="#submenu-1-4" aria-controls="submenu-1-4">User</a>
													<div id="submenu-1-4" class="collapse submenu" style="">
														<ul class="nav flex-column">
															<li class="nav-item"><a class="nav-link"
																href="user.htm">Các user</a></li>

														</ul>
													</div></li>
											</c:when>
										</c:choose>
									</ul>
								</div></li>

						</ul>
					</div>
				</nav>
			</div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- end left sidebar -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- wrapper  -->
	<!-- ============================================================== -->
	<div class="dashboard-wrapper">
		<div class="container-fluid  dashboard-content">
			<!-- ============================================================== -->
			<!-- pageheader -->
			<!-- ============================================================== -->
			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="page-header">
						<h2 class="pageheader-title">Các thể loại</h2>
						<p class="pageheader-text">Proin placerat ante duiullam
							scelerisque a velit ac porta, fusce sit amet vestibulum mi. Morbi
							lobortis pulvinar quam.</p>

					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- end pageheader -->
			<!-- ============================================================== -->
			<div class="row">
				<!-- ============================================================== -->
				<!-- basic table  -->
				<!-- ============================================================== -->
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="card">
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-hover table-striped table-bordered">
									<thead>
										<tr>
											<th style="width: 50% !important">ID thể loại</th>
											<th style="width: 50% !important">Tên thể loại</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="u" items="${categories}">
											<tr>
												<td style="width: 50% !important">${u.idTheLoai}</td>
												<td style="width: 50% !important">${u.tenTheLoai}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div class="card-body border-top">
									<nav aria-label="Page navigation example"></nav>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- end basic table  -->
				<!-- ============================================================== -->
			</div>

			<!-- ============================================================== -->
			<!-- end data table multiselects  -->
			<!-- ============================================================== -->
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- footer -->
	<!-- ============================================================== -->

	<!-- ============================================================== -->
	<!-- end footer -->
	<!-- ============================================================== -->
	</div>
	</div>
	<!-- ============================================================== -->
	<!-- end main wrapper -->
	<!-- ============================================================== -->
	<!-- Optional JavaScript -->
	<script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
	<script src="assets/vendor/slimscroll/jquery.slimscroll.js"></script>
	<script src="assets/vendor/multi-select/js/jquery.multi-select.js"></script>
	<script src="assets/libs/js/main-js.js"></script>
	<script
		src="../../../../../cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script src="assets/vendor/datatables/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="../../../../../cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
	<script src="assets/vendor/datatables/js/buttons.bootstrap4.min.js"></script>
	<script src="assets/vendor/datatables/js/data-table.js"></script>
	<script src="js/jquery.twbsPagination.js" type="text/javascript"></script>
	<script
		src="../../../../../cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	<script
		src="../../../../../cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
	<script
		src="../../../../../cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
	<script
		src="../../../../../cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
	<script
		src="../../../../../cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
	<script
		src="../../../../../cdn.datatables.net/buttons/1.5.2/js/buttons.colVis.min.js"></script>
	<script
		src="../../../../../cdn.datatables.net/rowgroup/1.0.4/js/dataTables.rowGroup.min.js"></script>
	<script
		src="../../../../../cdn.datatables.net/select/1.2.7/js/dataTables.select.min.js"></script>


</body>

</html>