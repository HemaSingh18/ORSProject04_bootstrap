
<%@page import="in.co.rays.proj4.controller.UserCtl"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
.btn-outline-orange {
	color: #F97316;
	border: 1px solid #F97316 !important;
	background-color: transparent;
}

.btn-outline-orange:hover {
	color: #FFFFFF !important;
	background-color: #F97316;
	border-color: #F97316;
}

.btn-outline-orange:focus {
	box-shadow: 0 0 0 0.2rem rgba(249, 115, 22, 0.25);
}
</style>
<title>Insert title here</title>
</head>
<body class="">

	<%
	String succ = ServletUtility.getSuccessMessage(request);
	String error = ServletUtility.getErrorMessage(request);
	List<UserBean> list = ServletUtility.getList(request);
	int pageNo = ServletUtility.getPageNo(request);
	int pageSize = ServletUtility.getPageSize(request);
	int index = (pageNo - 1) * pageSize + 1;
	Iterator<UserBean> it = list.iterator();
	%>
	<%@ include file="Header.jsp"%>

	<!-- pb-5 mb-5 keeps the last rows from hiding behind the fixed footer -->
	<div align="center" class="container-fluid px-3 pb-5 mb-5">
		<div class="row justify-content-center">
			<div class="col-12 col-lg-10 col-xl-9">

				<%-- OLD heading (kept): <h1>User List</h1> --%>
				<h1 class="fs-3 fw-bold  m-0 mb-3 text-start" style="color: #F97316">User
					List</h1>


				<%-- OLD messages (kept, not deleted; replaced by Bootstrap alerts)
				<h3 style="color: red"><%=succ%></h3>
				<h3 style="color: red"><%=error%></h3>
				--%>

				<%
				if (succ != null && !succ.trim().equals("")) {
				%>
				<div
					class="alert alert-success alert-dismissible fade show shadow-sm border-0 py-3 mb-4"
					role="alert">
					<div class="fw-medium"><%=succ%></div>
				</div>
				<%
				}
				%>

				<%
				if (error != null && !error.trim().equals("")) {
				%>
				<div
					class="alert alert-danger alert-dismissible fade show shadow-sm border-0 py-3 mb-4"
					role="alert">
					<div class="fw-medium"><%=error%></div>
				</div>
				<%
				}
				%>

				<div class="d-flex gap-2 align-items-right justify-content-end mb=3">
					<a href="<%=ORSView.USER_REPORT_CTL%>" target="_blank"
						class="btn btn-sm btn-warning fw-semibold"> <i
						class="bi bi-file-earmark-pdf me-1"></i> Print PDF
					</a> <a href="<%=ORSView.USER_REPORT_CTL%>?type=doc" target="_blank"
						class="btn btn-sm btn-info fw-semibold"> <i
						class="bi bi-file-earmark-word me-1"></i> Print DOC
					</a>
				</div>

				<form action="<%=ORSView.USER_LIST_CTL%>" method="post">

					<%-- OLD search table (kept, not deleted; replaced by Bootstrap row)
					<table>
						<tr>
							<th>First Name</th>
							<td><input type="text" name="firstName" value=""
								placeholder="search by first name"></td>
							<th>Last Name</th>
							<td><input type="text" name="lastName" value=""
								placeholder="search by last name"></td>
							<th>Login</th>
							<td><input type="email" name="login" value=""
								placeholder="search by login"></td>
							<th>Dob</th>
							<td><input type="date" name="dob" value=""
								placeholder="search by dob"><input type="submit"
								name="operation" value="<%=UserCtl.OP_SEARCH%>"></td>
						</tr>
					</table>
					--%>

					<!-- Bootstrap search box similar to Role List -->
					<div
						class="bg-white border border-primary rounded-3 p-2 shadow-sm mb-3">

						<div class="row g-2 align-items-end justify-content-between">

							<div class="col-12 col-md-6 col-lg-5 col-xl-3 text-start">
								<label class="form-label small fw-semibold  mb-1"
									style="color: #F97316"> First Name </label> <input type="text"
									name="firstName" value="" class="form-control form-control-sm"
									placeholder="search by first name">
							</div>

							<div class="col-12 col-md-6 col-lg-5 col-xl-3 text-start">
								<label class="form-label small fw-semibold  mb-1"
									style="color: #F97316"> Last Name </label> <input type="text"
									name="lastName" value="" class="form-control form-control-sm"
									placeholder="search by last name">
							</div>

							<div class="col-12 col-md-6 col-lg-5 col-xl-3 text-start">
								<label class="form-label small fw-semibold  mb-1"
									style="color: #F97316"> Login </label> <input type="email"
									name="login" value="" class="form-control form-control-sm"
									placeholder="search by login">
							</div>

							<div class="col-12 col-md-6 col-lg-5 col-xl-2 text-start">
								<label class="form-label small fw-semibold  mb-1"
									style="color: #F97316"> Dob </label> <input type="date"
									name="dob" value="" class="form-control form-control-sm">
							</div>

							<div class="col-12 col-md-auto d-flex gap-2">
								<input type="submit" name="operation"
									value="<%=UserCtl.OP_SEARCH%>"
									class="btn text-white btn-sm px-3"
									style="background-color: #EA580C;">
							</div>

						</div>
					</div>

					<%-- OLD table tag (kept): <table border="10px" width="100%"> --%>
					<div
						class="bg-white border rounded-3 shadow-sm overflow-hidden mb-3 table-responsive">


						<table
							class="table table-hover align-middle text-center mb-0 small">

							<%-- OLD header row (kept, not deleted; replaced by the thead below)
							<tr style="background: skyblue">
								<th><input type="checkbox"
									onclick="document.querySelectorAll('input[name=ids]').forEach(c=>c.checked=this.checked)">Select
									All</th>
								<th>S No.</th>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Login</th>
								<th>Gender</th>
								<th>Dob</th>
								<th>Edit</th>
							</tr>
							--%>

							<thead class=" text-primary-emphasis border-bottom"
								style="background-color: #ff8800; color: #FFFFFF;">
								<tr>
									<th class="py-2" style="width: 110px;">
										<div
											class="form-check d-flex justify-content-center align-items-center gap-2 mb-0">
											<input
												class="form-check-input mt-0 shadow-none border-primary"
												type="checkbox"
												onclick="document.querySelectorAll('input[name=ids]').forEach(c=>c.checked=this.checked)">
											<label class="form-check-label small fw-bold">Select
												All</label>
										</div>
									</th>

									<th class="py-2" style="width: 65px;">S No.</th>
									<th class="py-2" style="width: 70px;">Profile</th>
									<th class="py-2">First Name</th>
									<th class="py-2">Last Name</th>
									<th class="py-2">Login</th>
									<th class="py-2">Gender</th>
									<th class="py-2">Dob</th>
									<th class="py-2" style="width: 75px;">Edit</th>
								</tr>
							</thead>

							<%
							while (it.hasNext()) {
								UserBean bean = it.next();
							%>
							<tr align="center">

								<td><input type="checkbox" name="ids"
									class="form-check-input shadow-none border-primary-subtle"
									value="<%=bean.getId()%>"></td>

								<td class="py-2 text-secondary fw-semibold"><%=index++%></td>
								<td><img
									src="<%=ORSView.UPLOAD_PHOTO_CTL + "?id=" + bean.getId()%>"
									width="42" height="42"></td>

								<td class="fw-bold text-dark"><%=bean.getFirstName()%></td>

								<td class="fw-bold text-dark"><%=bean.getLastName()%></td>

								<td class="text-muted"><%=bean.getLogin()%></td>

								<td class="text-secondary"><%=bean.getGender()%></td>

								<td class="text-secondary"><%=bean.getDob()%></td>

								<%-- OLD edit link (kept):
								<td><a href="<%=ORSView.USER_CTL + "?id=" + bean.getId()%>">Edit</a></td>
								--%>

								<td><a
									class="btn btn-outline-orange btn-sm px-2 rounded-pill fw-medium"
									href="<%=ORSView.USER_CTL + "?id=" + bean.getId()%>">Edit</a></td>

							</tr>
							<%
							}
							%>


						</table>
						<%@ include file="ListFooter.jsp"%>
					</div>
				</form>
			</div>
		</div>
	</div>

	<%@ include file="Footer.jsp"%>
</body>
</html>
