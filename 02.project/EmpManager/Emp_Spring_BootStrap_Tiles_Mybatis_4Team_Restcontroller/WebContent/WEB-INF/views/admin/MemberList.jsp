<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <jsp:include page="/common/HeadTag.jsp"></jsp:include>
    <jsp:include page="/common/DataTableScript.jsp"></jsp:include>
    <style type="text/css">
		.iconColumn {
			width: 100px;
			text-align: center;
		}
</style>
</head>

<body id="page-top">
<c:set var="emps" value="${emps}"/>
    <!-- Top -->
    <jsp:include page="/common/Top.jsp"></jsp:include>
    <div id="wrapper">
        <!-- Left Menu -->
        <jsp:include page="/common/Left.jsp"></jsp:include>
        <div id="content-wrapper">
            <!-- !! Content !! -->
            <div class="container-fluid">
                <div class="card mb-3">
                    <div class="card-header">
                        <i class="fas fa-user-cog"></i>
                       		회원리스트
                    </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable">
                                    <thead>
                                        <tr>
                                            <th>EMPNO</th>
                                            <th>ENAME</th>
                                            <th>DEPTNO</th>
                                            <th>HIREDATE</th>
                                            <th class="iconColumn" data-orderable="false">EDIT</th>
                                            <th class="iconColumn" data-orderable="false">DELETE</th>
                                        </tr>
                                    </thead>
								<tbody>
									<c:forEach var="emp" items="${emps}">
										<tr>
											<td class="sorting_1"><a href="MemberDetail.do?empno=${emp.empno }">${emp.empno}</a></td>
											<td>${emp.ename}</td>
											<td>${emp.deptno}</td>
											<td>${emp.hiredate}</td>
											<td class="iconColumn">
												<a href="MemberEdit.do?empno=${emp.empno}">
													<i class="fas fa-user-edit"></i>
												</a>
											</td>
											<td class="iconColumn">
												<a href="#" data-toggle="modal" data-target="#deleteModal" data-delete-id="${emp.empno}">
													<i class="fas fa-trash-alt"></i>
												</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
 	<!-- Delete Modal-->
	<jsp:include page="../modal/MemberDeleteModal.jsp"></jsp:include>
</body>

</html>