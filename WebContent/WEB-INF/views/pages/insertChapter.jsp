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
<title>Tất cả chapter</title>
<base href="${pageContext.servletContext.contextPath}/">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="assets/vendor/bootstrap/css/bootstrap.min.css">
<link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
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
	height:80px;
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
							<h5 class="card-header">Chapter</h5>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered first">

										<thead>
											<tr>
												<th style="width: 150px !important">ID chapter</th>
												<th style="width: 150px !important">ID truyện</th>
												<th style="width: 175px !important">Tên chapter</th>
												<th style="width: 750px !important">Nội dung</th>
												<th style="width: 10% !important">Insert/Delete</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="u" items="${chapters}">
												<tr>
													<td style="width: 150px !important">${u.idChuong}</td>
													<td style="width: 150px !important">${u.idSach.idSach}</td>
													<td style="width: 175px !important">${u.tenChuong}</td>
													<td style="width: 750px!important">${u.noiDung}</td>
													<td style="width: 10% !important"><div
															class="dd-nodrag btn-group ml-auto">
															<a href = "updateChapter/${u.idChuong}.htm"><button class="btn btn-sm btn-outline-light">Edit</button></a>
															<a href = "deleteChapter/${u.idChuong}.htm"}><button class="btn btn-sm btn-outline-light">
																<i class="far fa-trash-alt"></i>
															</button></a>
														</div></td>
												</tr>
											</c:forEach>
										</tbody>


									</table>


	

									<div class="card-body border-top">
										<nav aria-label="Page navigation example">
											<ul class="pagination" id="pagination-demo">
												<%
													int temp = (int) request.getAttribute("num");
												%>
												<%
													int temp1 = (int) request.getAttribute("numPage");
												%>
												<%
													if (temp1 > 1) {
												%>
												<li class="page-item first"><a class="page-link"
													href="insertchapter/<%=1%>.htm">First
														
												</a></li>
												<li class="page-item prev"><a class="page-link"
													href="insertchapter/<%=temp1 - 1%>.htm">Previous
														
												</a></li>
												<%
													}
												%>
												<%if(temp1 <=3) {%>
												<%
													for (int i = 0; i < 8; i++) {
												%>
												<%
													if (temp1 == i + 1) {
												%>
												<li class="page-item active"><a class="page-link"
													href="insertchapter/<%=i + 1%>.htm"><%=i + 1%></a></li>
												<%
													} else {
												%>
												<li class="page-item"><a class="page-link"
													href="insertchapter/<%=i + 1%>.htm"><%=i + 1%></a></li>
												<%
													}
												%>
												<%
													}
												%>
												<%} else{ %>
												
												
												
												
												<%
													for (int i = temp1-4; i < temp1+3 && i<=temp-1; i++) {
												%>
												<%
													if (temp1 == i + 1) {
												%>
												<li class="page-item active"><a class="page-link"
													href="insertchapter/<%=i + 1%>.htm"><%=i + 1%></a></li>
												<%
													} else {
												%>
												<li class="page-item"><a class="page-link"
													href="insertchapter/<%=i + 1%>.htm"><%=i + 1%></a></li>
												<%
													}
												%>
												<%
													}
												%>
												<%} %>
												<%
													if (temp1 != temp) {
												%>
												<li class="page-item next"><a class="page-link" href="insertchapter/<%=temp1+1%>.htm"
													>Next</a></li>
												<li class="page-item last"><a class="page-link" href="insertchapter/<%=temp%>.htm"
													>Last</a></li>
													<%
													}
												%>
											</ul>
										</nav>
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