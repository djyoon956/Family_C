<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <c:import url="/common/HeadTag.jsp"/>
</head>
<script type="text/javascript">
	//Remember ID 구현
</script>
<body id="page-top">
    <!-- Top -->
    <c:import url="/common/Top.jsp"/>
    <div id="wrapper">
        <!-- Left Menu -->
        <c:import url="/common/Left.jsp"/>

        <div id="content-wrapper">

            <!-- !! Content !! -->
            <div class="container-fluid">
                <div class="card mb-3">
                    <div class="card-header">
                        <i class="fas fa-user-check"></i>
                        로그인
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <form action="LoginOk.do" method="post">
                                            <div class="form-group">
                                                <div class="form-label-group">
                                                    <input type="text" id="userid" name="userid" class="form-control"
                                                        placeholder="ID" required="required" autofocus="autofocus">
                                                    <label for="userid">ID</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-label-group">
                                                    <input type="password" id="pwd" name="pwd" class="form-control"
                                                        placeholder="Password" required="required">
                                                    <label for="pwd">Password</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" value="remember-me"> Remember ID
                                                    </label>
                                                </div>
                                            </div>
                                            <input type="submit" value="Login" class="btn btn-primary btn-block">
                                        </form>
                                        <div class="text-center">
                                            <a class="d-block small mt-3" href="Register.do">Register an
                                                Account</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Bottom -->
            <c:import url="/common/Bottom.jsp"/>
        </div>
    </div>
</body>

</html>