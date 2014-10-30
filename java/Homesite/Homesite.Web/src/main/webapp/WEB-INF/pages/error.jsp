<%--
  Author: Rick Flagg
  Date: 10/30/14
  Time: 4:24 AM
  Email: rick.flagg@gmail.com
  Website: rickflagg.net
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en" ng-app="homesite">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Portfolio site for Rick Flagg. This site contains work I have done and also interests I have.">
    <meta name="keywords" content="c# scrum java python">
    <meta name="author" content="Rick Flagg">
    <meta name="google-site-verification" content="s9Pzwx0cWgm_Ve3TX-g9cmtx-q9mEaPx1P0Jm9fqmFw" />

    <meta content="yes" name="mobile-web-app-capable">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">


    <title>RickFlagg.net</title>

    <!-- Bootstrap core CSS -->
    <link href="/resources/css/bootstrap.css"  rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="<%=request.getContextPath()%>/resources/css/site.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/font-awesome/css/font-awesome.min.css" rel="stylesheet">

    <!-- favorite icon -->
    <link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/img/favicon.ico" />

    <!-- JavaScript -->
    <script src="<%=request.getContextPath()%>/resources/js/vendor/jquery-1.10.2.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/vendor/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/vendor/modernizr-2.6.2.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/vendor/angular.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/vendor/angular-resource.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/app.js"></script>

</head>

<body>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6 col-md-offset-4" style="margin-top: 10%;">
                <ul class="media-list">
                    <li class="media">
                        <a class="pull-left" href="#">
                            <img class="media-object img-circle" src="<%=request.getContextPath()%>/resources/img/error.png" alt="image indicating error" />
                        </a>

                        <div class="media-body">
                            <h4 class="media-heading">Oops!</h4>
                            <p class="lead">
                                We're sorry! We've encountered an unexpected error while fulfilling your request.
                            </p>

                            <a href="/">Return to rickflagg.net</a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>