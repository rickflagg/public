<%--
  Author: Rick Flagg
  Date: 10/8/14
  Time: 4:26 AM
  Email: rick.flagg@gmail.com
  Website: rickflagg.net
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="links" ng-controller="LinksController">

    <div class="row">
        <div class="col-md-12 text-center">
            <h2>Links</h2>
            <hr>
        </div>
    </div>

    <div class="row">

        <div class="col-md-4" ng-repeat="(key, value) in links">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">{{key}}</h3>
                </div>
                <div class="panel-body">

                    <div class="list-group" ng-repeat="link in value">
                        <a href="{{link.url}}" class="list-group-item" target="_blank">
                            <h4 class="list-group-item-heading">{{link.name}}</h4>
                            <p class="list-group-item-text">{{link.description}}</p>
                        </a>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>