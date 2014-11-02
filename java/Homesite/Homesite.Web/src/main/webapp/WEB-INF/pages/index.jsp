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
    <link href="/resources/styles/bootstrap.css"  rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="<%=request.getContextPath()%>/resources/styles/site.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/styles/font-awesome/css/font-awesome.min.css" rel="stylesheet">

    <!-- favorite icon -->
    <link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/img/favicon.ico" />

    <!-- JavaScript -->
    <script src="<%=request.getContextPath()%>/resources/scripts/vendor/jquery-1.10.2.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/scripts/vendor/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/scripts/vendor/modernizr-2.6.2.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/scripts/vendor/angular.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/scripts/vendor/angular-resource.js"></script>

    <!-- Angular App -->
    <script src="<%=request.getContextPath()%>/resources/scripts/app.js"></script>
    <!-- Angular Controllers -->
    <script src="<%=request.getContextPath()%>/resources/scripts/controllers/ContentController.js"></script>
    <script src="<%=request.getContextPath()%>/resources/scripts/controllers/LinkController.js"></script>
    <script src="<%=request.getContextPath()%>/resources/scripts/controllers/ProjectController.js"></script>
    <script src="<%=request.getContextPath()%>/resources/scripts/controllers/SkillController.js"></script>
    <script src="<%=request.getContextPath()%>/resources/scripts/controllers/SideMenuController.js"></script>
    <!-- Angular Filters -->
    <script src="<%=request.getContextPath()%>/resources/scripts/filters/StartFrom.js"></script>
    <!-- Angular Services -->
    <script src="<%=request.getContextPath()%>/resources/scripts/services/ContentService.js"></script>
    <script src="<%=request.getContextPath()%>/resources/scripts/services/LinkService.js"></script>
    <script src="<%=request.getContextPath()%>/resources/scripts/services/ProjectService.js"></script>
    <script src="<%=request.getContextPath()%>/resources/scripts/services/SkillService.js"></script>




</head>

<body>

<!-- Side Menu -->
<div ng-include="'<%=request.getContextPath()%>/resources/views/sideMenu.html'"></div>
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
<div ng-include="'<%=request.getContextPath()%>/resources/views/siteIntro.html'"></div>
<!-- /Intro -->

<!-- Content Categories -->
<div ng-include="'<%=request.getContextPath()%>/resources/views/contentCategories.html'"></div>
<!-- /Content Categories -->

<!-- Callout -->
<div class="callout">
    <div class="vert-text">
        <h1>Making your vision reality</h1>
    </div>
</div>
<!-- /Callout -->

<!-- Portfolio -->
<div ng-include="'<%=request.getContextPath()%>/resources/views/projectPortfolio.html'"></div>
<!-- /Portfolio -->

<!-- Skills -->
<div ng-include="'<%=request.getContextPath()%>/resources/views/skillMatrix.html'"></div>
<!-- /Skills -->


<!-- Links -->
<div ng-include="'<%=request.getContextPath()%>/resources/views/links.html'"></div>
<!-- /Links -->

<!-- Footer -->
<div ng-include="'<%=request.getContextPath()%>/resources/views/globalFooter.html'"></div>
<!-- /Footer -->

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