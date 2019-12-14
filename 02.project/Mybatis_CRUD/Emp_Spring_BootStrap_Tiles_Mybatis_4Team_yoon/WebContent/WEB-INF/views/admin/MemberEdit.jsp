<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<c:set var="emp" value="${emp }" />
<head>
<meta charset="UTF-8">
<jsp:include page="/common/HeadTag.jsp"></jsp:include>
<style type="text/css">
    	select{
    		display: block;
	    	width: 100%;
	    	height: calc(1.5em + 0.75rem + 2px);
	    	padding: 0.375rem 0.75rem;
	    	font-size: 1rem;
	    	font-weight: 400;
	    	line-height: 1.5;
	    	color: #495057;
	    	background-color: #fff;
	    	background-clip: padding-box;
	    	border: 1px solid #ced4da;
	    	border-radius: 0.25rem;
	    	-webkit-transition: border-color 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
	    	transition: border-color 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
	    	transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	    	transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
    	}
    </style>
<script type="text/javascript">

    $(function(){
    	initSelectedData();
    	 $("#photo").change(function(){
    			var reader = new FileReader();

    		    reader.onload = function (e) {
    		        // get loaded data and render thumbnail.
    		        document.getElementById("viewPhoto").src = e.target.result;
    		    };

    		    // read the image file as a data URL.
    		    reader.readAsDataURL(this.files[0]);
    		});
    });

    function initSelectedData(){
        $('#jobSelect option').filter(function() { 
            return $.trim( $(this).text() ) == "${emp.job}"; 
            }).attr('selected',true);
        
        $('#mgrSelect option').filter(function() { 
            return $.trim( $(this).val() ) == "${emp.empno}"; 
            }).attr('selected',true);
        
        $('#deptSelect option').filter(function() { 
            return $.trim( $(this).text() ) == "${emp.deptno}"; 
            }).attr('selected',true);
        }
   
</script>
</head>

<body id="page-top">
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
						<i class="fas fa-user-edit"></i> 회원 정보 수정 [<b>${emp.ename}님</b>]

					</div>
					<div class="card-body">
						<div class="table-responsive">
							<div id="dataTable_wrapper"
								class="dataTables_wrapper dt-bootstrap4">
								<div class="row">
									<div class="col-sm-12">
										<form action="MemberEditOk.do" method="post"
											enctype="multipart/form-data">
											<div class="form-group">
												<div class="form-row">
													<div class="col-md-6">
														<div class="form-label-group">
															<img id="viewPhoto" name="viewPhoto"
																src="upload/${emp.imagefilename}"
																onerror="this.src='images/defaultProfile.png'"
																style="width: 10em; height: 100%;">
														</div>
													</div>
													<div class="col-md-6">
														<div class="form-label-group">
															<input type="file" id="multipartFile"
																name="multipartFile" class="form-control"
																accept="image/*"> <label for="photo">photo</label>
														</div>
													</div>
												</div>
											</div>
											<div class="form-group">
												<div class="form-row">
													<div class="col-md-6">
														<div class="form-label-group">
															<input type="number" id="empno" name="empno"
																class="form-control" placeholder="No"
																required="required" autofocus="autofocus" readonly
																value="${emp.empno}"> <label for="empno">No</label>
														</div>
													</div>
													<div class="col-md-6">
														<div class="form-label-group">
															<input type="text" id="ename" name="ename"
																class="form-control" placeholder="Name"
																required="required" value="${emp.ename}"> <label
																for="ename">Name</label>
														</div>
													</div>
												</div>
											</div>
											<div class="form-group">
												<div class="form-row">
													<div class="col-md-6">
														<div class="form-label-group">
															<input type="date" id="hiredate" name="hiredate"
																class="form-control" placeholder="Hire Date"
																required="required" value="${emp.hiredate}"> <label
																for="hiredate">Hire Date</label>
														</div>
													</div>
													<div class="col-md-6">
														<div class="form-label-group">
															<select id="jobSelect" name="job" style="height: 49px">
																<option hidden>직종 선택</option>
																<c:forEach var="job" items="${jobs}">
																	<option>${job }</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</div>
											</div>
											<div class="form-group">
												<div class="form-row">
													<div class="col-md-6">
														<div class="form-label-group">
															<select id="deptSelect" name="deptno"
																style="height: 49px">
																<option hidden>부서번호 선택</option>
																<c:forEach var="deptno" items="${deptnos}">
																	<option>${deptno }</option>
																</c:forEach>
															</select>
														</div>
													</div>
													<div class="col-md-6">
														<div class="form-label-group">
															<select id="mgrSelect" name="mgr" style="height: 49px">
																<option hidden>Manager 선택</option>
																<c:forEach var="emp" items="${emps}">
																	<option value="${emp.empno }">${emp.empno }:
																		${emp.ename }</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</div>
											</div>
											<div class="form-group">
												<div class="form-row">
													<div class="col-md-6">
														<div class="form-label-group">
															<input type="number" id="sal" name="sal"
																class="form-control" placeholder="Sal"
																required="required" value="${emp.sal}"> <label
																for="sal">Salary</label>
														</div>
													</div>
													<div class="col-md-6">
														<div class="form-label-group">
															<input type="number" id="comm" name="comm"
																class="form-control" placeholder="Commission"
																required="required" value="${emp.comm}"> <label
																for="comm">Commission</label>
														</div>
													</div>
												</div>
											</div>
											<div class="form-row">
												<div class="col-md-6">
													<input type="submit" class="btn btn-primary btn-block"
														value="Edit">
												</div>
												<div class="col-md-6">
													<input type="button" class="btn btn-danger btn-block"
														value="Cancel" onClick="location.href='MemberList.do'">
												</div>

											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>