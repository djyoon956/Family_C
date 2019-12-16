<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <jsp:include page="/common/HeadTag.jsp"/>
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
	    		 $("#multipartFile").change(function(){
	 	    		var reader = new FileReader();

	 	    	    reader.onload = function (e) {
	 	    	        // get loaded data and render thumbnail.
	 	    	        document.getElementById("viewPhoto").src = e.target.result;
	 	    	    };

	 	    	    // read the image file as a data URL.
	 	    	    reader.readAsDataURL(this.files[0]);
	 	    	});
		 	    	
		    	 $.ajax({
		    		url:"GetSelectBoxData.do",
		    		dataType:"json",
		    		success:function(data){
		    			console.log(data);	

		    			$.each(data.deptnos, function(index, element){
		    				let option = $("<option></option>");
		    				$(option).text(element);
		    				$("#deptSelect").append(option);
		    			})
		    			
		    			$.each(data.jobs, function(index, element){
		    				let option = $("<option></option>");
		    				$(option).text(element);
		    				$("#jobSelect").append(option);
		    			})
		    			
		    			$.each(data.emps, function(index, element){
		    				let option = $("<option></option>");
		    				$(option).text(element.empno+" : "+element.ename);
		    				$(option).val(element.empno);
		    				$("#mgrSelect").append(option);
		    			})
		    		}
		    	});
		    	
		    	$("#empnoCheck").click(function(){
		    		if($("#empno").val() == "" || $("#empno").val() == null){
		    			warningAlert("EMPNO 입력하세요");
		    		}else{
		    			$.ajax({
		    				url:"CheckEmpno.do",
		    				data:{empno:$("#empno").val()},
		    				success:function(data){
		    					if(data.isUse){
		    						errorAlert("중복된 사원번호입니다");
		    					}else{
		    						successAlert("사용가능한 사원번호입니다.");
		    					}
		    				}
		    			});
		    		}
		    	});
	    	});
    </script>
</head>
<c:set var="emps" value="${emps}"/>
<body id="page-top">
    <!-- Top -->
    <jsp:include page="/common/Top.jsp"></jsp:include>
    <div id="wrapper">
        <!-- Left Menu -->
        <jsp:include page="/common/Left.jsp"></jsp:include>

        <div id="content-wrapper">

            <!-- Content -->
            <div class="container-fluid">
                <div class="card mb-3">
                    <div class="card-header">
                        <i class="fas fa-user-plus"></i>
                        회원가입
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <form action="" method="post" enctype="multipart/form-data">
                                            <div class="form-group">
                                                		<div class="form-row">
                                                   			<div class="col-md-6">
                                                        		<div class="form-label-group">
                                                            		<img id="viewPhoto" name="viewPhoto" src="images/defaultProfile.png" alt="" style="width:10em; height:100%;">
                                                        		</div>
                                                    		</div>
                                                    		<div class="col-md-6">
                                                        		<div class="form-label-group">
                                                            		<input type="file" id="multipartFile" name="multipartFile" class="form-control" accept="image/*">
                                                            		<label for="multipartFile">photo</label>
                                                        		</div>
                                                    		</div>
                                                		</div>
                                            		</div>
                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                    <div class="input-group">
												        <input type="number" id="empno" name="empno"  class="form-control" placeholder="No" aria-label="Search" aria-describedby="basic-addon2" style="height: 50px">
												        <div class="input-group-append">
												          <button class="btn btn-primary" type="button" id="empnoCheck">
												            <i class="fas fa-check"></i>
												          </button>
												        </div>
												      </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-label-group">
                                                            <input type="text" id="ename" name="ename" class="form-control" placeholder="Name" >
                                                            <label for="ename">Name</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <div class="form-label-group">
                                                            <input type="date" id="hiredate" name="hiredate" class="form-control" placeholder="Hire Date" >
	                                                        <label for="hiredate">Hire Date</label>
                                                        </div> 
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-label-group">
                                                        	 <select id="jobSelect" name="job" style="height : 49px">
                                                        	 	<option hidden>직종 선택</option> 
                                                             </select> 
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <div class="form-label-group">
                                                            <select id="deptSelect" name="deptno" style="height : 49px">
                                                            	<option hidden>부서번호 선택</option>
                                                            </select> 
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-label-group">
                                                        	<select id="mgrSelect" name="mgr" style="height : 49px">
                                                            	<option hidden >Manager 선택</option>
                                                            	
                                                            </select> 
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <div class="form-label-group">
                                                            <input type="number" id="sal" name="sal" class="form-control" placeholder="Sal" >
                                                            <label for="sal">Salary</label>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-label-group">
                                                            <input type="number" id="comm" name="comm" class="form-control" placeholder="Commission" >
                                                            <label for="comm">Commission</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-row">
                                             	 <div class="col-md-6">
                                                    <input type="submit" class="btn btn-primary btn-block" value="Register">
                                                </div>
                                                <div class="col-md-6">
                                                    <input type="reset" class="btn btn-danger btn-block" value="Cancel">
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
            <!-- Bottom -->
            <jsp:include page="/common/Bottom.jsp"></jsp:include>
        </div>
    </div>
    </body>
</html>