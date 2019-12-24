<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <c:import url="/common/HeadTag.jsp"/>
    <style type="text/css">
        .main {
            background-image: url(images/main.gif);
            background-repeat: no-repeat;
            height: 100%;
            background-size: cover;
        }

        .headLine {
            font-weight: 700;
            text-align: center;
			font-size: 4rem;	
            color: white;
            padding-top: 18%;
            font-style: italic;
            font-family: 'Droid Serif', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
        }
    </style>
</head>

<body id="page-top">
    <!-- Top -->
    <c:import url="/common/Top.jsp"/>
    <div id="wrapper">
        <!-- Left Menu -->
        <c:import url="/common/Left.jsp"/>

        <div id="content-main">
            <div class="container-fluid main">
                <h1 class="headLine">Welcome Family C World👨‍👩‍👧‍👧👼</h1>
            </div>

            <!-- Bottom -->
             <c:import url="/common/Bottom.jsp"/>
        </div>
    </div>
</body>

</html>