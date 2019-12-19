<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<body>
    <!-- Sidebar -->
   <c:choose>
   	<c:when test="${sessionScope.userid == null }">
   		<c:set var="isLogin" value="false"/>
   	</c:when>
   	<c:otherwise>
   		<c:set var="isLogin" value="true"/>
   	</c:otherwise>
   </c:choose>
    <ul class="sidebar navbar-nav">
        <li class="nav-item active">
            <a class="nav-link" href="index.jsp">
                <i class="fas fa-home"></i>
                <span>Main</span>
            </a>
        </li>
        
        <c:choose>
        	<c:when test="${isLogin}">
        		<li class="nav-item">
		            <a class="nav-link" data-toggle="modal" data-target="#logoutModal">
		                <i class="fas fa-sign-out-alt"></i>
		                <span>Logout</span>
		             </a>
		        </li>
		        <li class="nav-item dropdown">
		            <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown"
		                aria-haspopup="true" aria-expanded="false">
		                <i class="fas fa-user-shield"></i>
		                <span>Admin</span>
		            </a>
		            <div class="dropdown-menu" aria-labelledby="pagesDropdown">
		                <!-- <h6 class="dropdown-header">Login Screens:</h6> -->
		                <a class="dropdown-item" href="MemberAdd.do">사원 추가</a>
		                <a class="dropdown-item" href="MemberList.do">사원 관리</a>
		            </div>
		        </li>
		        <li class="nav-item">
		            <a class="nav-link" href="Chat.do">
		                <i class="fas fa-sign-out-alt"></i>
		                <span>실시간 채팅</span>
		             </a>
		        </li>
		        
		        <!-- <li class="nav-item dropdown">
		            <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown"
		                aria-haspopup="true" aria-expanded="false">
		                <i class="fas fa-user-shield"></i>
		                <span>Chart</span>
		            </a>
		            <div class="dropdown-menu" aria-labelledby="pagesDropdown">
		                <h6 class="dropdown-header">Login Screens:</h6>
		                <a class="dropdown-item" href="SalaryRanking.do?cmd=show">Chart_1</a>
		                <a class="dropdown-item" href="SalaryRanking_won.do?cmd=show">원보연</a> 내가 선점 했음 여기 내자리
		                <a class="dropdown-item" href="SalaryRanking_chung.do?cmd=show">Chart_3</a>
		                <a class="dropdown-item" href="SalaryRanking_lee.do?cmd=show">Chart_4</a>
		                <a class="dropdown-item" href="바꿔^^">Chart_5</a>
		                <a class="dropdown-item" href="LocCount.do">Chart_6</a>
		            </div>
		        </li> -->
		        
        	</c:when>
        	<c:otherwise>
        		 <li class="nav-item">
		            <a class="nav-link" href="Login.do">
		                <i class="fas fa-sign-in-alt"></i>
		                <span>Login</span></a>
		        </li>
        	</c:otherwise>
        </c:choose>
    </ul>
    
    <!-- Logout Modal-->
     <jsp:include page="/WEB-INF/views/modal/LogoutModal.jsp"/> 
</body>
</html>