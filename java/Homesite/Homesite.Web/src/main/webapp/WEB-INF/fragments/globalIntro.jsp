<%--
  Author: Rick Flagg
  Date: 10/8/14
  Time: 4:26 AM
  Email: rick.flagg@gmail.com
  Website: rickflagg.net
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Intro -->
<div id="about" class="intro" ng-controller="GlobalContentController">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3 text-center">
                <h2>Who am I?</h2>
                <p class="lead">
                    {{introText}}
                <p>
                    <!--
                    <p class="lead">
                        You can view my complete credentials in the following formats: <a href="{{ url_for('static', filename='rflagg_2014.docx') }}" target="_blank">(doc)</a> <a href="{{ url_for('static', filename='rflagg_2014.pdf') }}" target="_blank" >(pdf)</a>
                    </p>
                    -->
            </div>
        </div>
    </div>
</div>
<!-- /Intro -->
