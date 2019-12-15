<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<c:set var="message" value="${requestScope.board_msg }"/>
<c:set var="url" value="${requestScope.board_url}"/>
<c:set var="result" value="${requestScope.board_result}"/>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- sweetalert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="sweetalert2.all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>

<c:if test="${message != null && url != null && result != null }">
	<script>
		let icon="";
		if(${result})
			icon="success";
		else
			icon="error";
		
		$(function(){
			Swal.fire({
				  icon: icon,
				  title: "${message}",
				  showConfirmButton: false,
				  timer: 2000
				}).then(function() {
  				 	 location.href = "${url}";
  			  })
		})
	</script>
</c:if>