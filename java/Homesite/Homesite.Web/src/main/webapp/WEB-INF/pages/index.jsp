<%--
  Author: Rick Flagg
  Date: 10/8/14
  Time: 4:26 AM
  Email: rick.flagg@gmail.com
  Website: rickflagg.net
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

<!-- Side Menu -->
<%@include file="/WEB-INF/fragments/sideMenu.jsp" %>
<!-- /Side Menu -->

<!-- Full Page Image Header Area -->
<div id="top" class="header">
    <div class="vert-text">
        <h1>Rick Flagg</h1>
        <h3>Software Design</h3>
        <a href="#about" class="btn btn-default btn-lg">Find Out More</a>
    </div>
</div>
<!-- /Full Page Image Header Area -->

<!-- Intro -->
<%@include file="/WEB-INF/fragments/globalIntro.jsp" %>
<!-- /Intro -->

<!-- Content Categories -->
<%@include file="/WEB-INF/fragments/contentCategories.jsp" %>
<!-- /Content Categories -->

<!-- Callout -->
<div class="callout">
    <div class="vert-text">
        <h1>Making your vision reality</h1>
    </div>
</div>
<!-- /Callout -->

<!-- Portfolio -->
<%@include file="/WEB-INF/fragments/projectPortfolio.jsp" %>
<!-- /Portfolio -->

<!-- Skills -->
<%@include file="/WEB-INF/fragments/skillMatrix.jsp" %>
<!-- /Skills -->


<!-- Links -->
<%@include file="/WEB-INF/fragments/links.jsp" %>
<!-- /Links -->

<!-- Footer -->
<%@include file="/WEB-INF/fragments/globalFooter.jsp" %>
<!-- /Footer -->


<!-- Custom JavaScript for the Side Menu and Smooth Scrolling -->
<script>
    $("#menu-close").click(function(e) {
        e.preventDefault();
        $("#sidebar-wrapper").toggleClass("active");
    });
</script>
<script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#sidebar-wrapper").toggleClass("active");
    });
</script>

<!-- Google Analytics -->
<script type="text/javascript">

    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-48130151-1']);
    _gaq.push(['_setDomainName', 'rickflagg.net']);
    _gaq.push(['_trackPageview']);

    (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();

</script>

<script>
    $(function() {
        $('a[href*=#]:not([href=#])').click(function() {
            if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'')
                    || location.hostname == this.hostname) {

                var target = $(this.hash);
                target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
                if (target.length) {
                    $('html,body').animate({
                        scrollTop: target.offset().top
                    }, 1000);
                    return false;
                }
            }
        });
    });
</script>



</body>

</html>