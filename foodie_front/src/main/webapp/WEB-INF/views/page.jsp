<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />



<c:set var="contextRoot" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>FOODIE - ${title}</title>

<script>
	window.menu = '${title}';
	window.contextRoot = '${contextRoot}'
	
</script>

<!-- Bootstrap core CSS -->
<link href="${css}/bootstrap.css" rel="stylesheet">

<!-- Bootstrap readable theme -->
<link href="${css}/bootstrap-readable-theme.css" rel="stylesheet">

<!-- Bootstrap DataTables -->
<link href="${css}/dataTables.bootstrap.css" rel="stylesheet">

<!-- Add custom CSS here -->
<link href="${css}/myapp.css" rel="stylesheet">

</head>

<body>

	<div class="wrapper">

		<!-- navigation -->
		<%@include file="./shared/navbar.jsp"%>

		<!-- page content -->
		<div class="content">
			<!-- loading home page -->

			<c:if test="${userClickHome == true}">
				<%@include file="home.jsp"%>
			</c:if>


			<!-- loading about page -->
			<c:if test="${userClickAbout == true}">
				<%@include file="about.jsp"%>
			</c:if>

			<!-- loading contact page -->
			<c:if test="${userClickContact == true}">
				<%@include file="contact.jsp"%>
			</c:if>

			<!-- loading click content -->
			<c:if
				test="${userClickAllProducts == true or userClickcategoryProducts == true }">
				<%@include file="listProducts.jsp"%>
			</c:if>

			<!-- Load only when user clicks show product -->
			<c:if test="${userClickShowProduct == true}">
				<%@include file="singleProduct.jsp"%>
			</c:if>	
			
			<!-- Load only when user clicks manage product -->
			<c:if test="${userClickManageProducts == true}">
				<%@include file="manageProducts.jsp"%>
			</c:if>
			
		</div>


		<!-- footer -->
		<%@include file="./shared/footer.jsp"%>

		<!-- JavaScript -->
		<script src="${js}/jquery-1.10.2.js"></script>
		<script src="${js}/bootstrap.js"></script>

		<!-- datatable plugins -->
		<script src="${js}/jquery.dataTables.js"></script>

		<!-- DataTable Bootstrap Script -->
		<script src="${js}/dataTables.bootstrap.js"></script>

		<!-- self coded javascript -->
		<script src="${js}/myapp .js"></script>
	</div>
</body>

</html>
