<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Author: Rick Flagg
  Date: 10/8/14
  Time: 4:26 AM
  Email: rick.flagg@gmail.com
  Website: rickflagg.net
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="portfolio" class="portfolio" ng-controller="ProjectController">

    <div class="container">

        <div class="row">
            <div class="col-md-4 col-md-offset-4 text-center">
                <h2>Application Portfolio</h2>
                <hr>
            </div>
        </div>

        <div class="row" ng-repeat="project in projects | startFrom: currentPage*pageSize | limitTo:pageSize">

            <div id="paged-content-{{($index + 1)}}" >
                <div class="panel panel-default">

                    <div class="panel-heading">
                        {{project.name}}
                    </div>

                    <div class="panel-body">
                        <div class="media">
                            <a class="pull-left" href="http://rickflagg.net">
                                <img class="media-object img-circle" width="64" height="64" src="<%=request.getContextPath()%>/resources/img/beach1.jpg" alt="RickFlagg.net background">
                            </a>
                            <div class="media-body">

                                <dl class="dl-horizontal">

                                    <dt>Client:</dt>
                                    <dd>{{project.client.name}}</dd>

                                    <dt>Timeframe</dt>
                                    <dd>{{project.formattedProjectTimeSpan}}</dd>

                                    <dt>Description:</dt>
                                    <dd>{{project.description}}</dd>

                                    <dt>Roles:</dt>
                                    <dd>{{project.delimitedRoles}}</dd>

                                    <dt>Languages</dt>
                                    <dd>
                                        <span ng-repeat="language in project.programmingLanguages">
                                            <a href="{{language.referenceUrl}}">{{language.name}}</a>
                                        </span>
                                    </dd>

                                    <dt>Database Platform</dt>
                                    <dd>
                                        <a href="{{project.databasePlatform.referenceUrl}}">{{project.databasePlatform.name}}</a>
                                    </dd>

                                    <dt>Design Patterns</dt>
                                    <dd>
                                        <span ng-repeat="pattern in project.designPatterns">
                                            <a href="{{pattern.referenceUrl}}">{{pattern.name}}</a>
                                        </span>
                                    </dd>

                                    <dt>Toolkits</dt>
                                    <dd>
                                        <span ng-repeat="toolkit in project.programmingToolKits">
                                            <a href="{{toolkit.referenceUrl}}">{{toolkit.name}}</a>
                                        </span>
                                    </dd>

                                    <dt>Lifecycle</dt>
                                    <dd>{{project.softwareLifecycle.name}}</dd>


                                </dl>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </div>

        <div class="row">
            <div class="col-md-12">
            <ul class="pager">

                <li><button class="btn btn-default" ng-disabled="currentPage == 0" ng-click="currentPage=currentPage-1" id="btnPrevious">Previous</button></li>
                {{currentPage+1}}/{{numberOfPages()}}
                <li><button class="btn btn-default" ng-disabled="currentPage >= projects.length/pageSize - 1" ng-click="currentPage=currentPage+1" id="btnNext">Next</button></li>

            </ul>
        </div>
        </div>

    </div>
</div>

<script type="text/javascript">
    /*
    (function(){

        //Set the initial page index
        var pageIndex = 0;

        console.write($("[id^=paged-content-]"));

        //Set the max number of paged records
        var maxPages = ($("[id^=paged-content-]").length - 1);

        //Hide all the content pages except the first
        $("[id^=paged-content]").each(function (index, tag) {
            if (index > 0) {
                $(tag).hide();
            }
        });

        //Disable the Previous Link
        $('#lnkPrevious').parent().addClass("disabled");

        //Disable the Next Link if we only have one record
        if (pageIndex === maxPages) {
            $('#lnkNext').parent().addClass("disabled");
        }

        $('#lnkPrevious').click(function () {

            $("[id^=paged-content]").eq(pageIndex).hide();
            pageIndex = (pageIndex -1);
            $("[id^=paged-content]").eq(pageIndex).show();

            syncNavigation();

        });

        $('#lnkNext').click(function () {

            $("[id^=paged-content]").eq(pageIndex).hide();
            pageIndex = (pageIndex +1);
            $("[id^=paged-content]").eq(pageIndex).show();

            syncNavigation();

        });

        function syncNavigation() {
            if (maxPages === pageIndex) {
                $('#lnkNext').parent().addClass("disabled");
                $('#lnkPrevious').parent().removeClass("disabled");
            }
            else if (pageIndex === 0) {
                $('#lnkPrevious').parent().addClass("disabled");
                $('#lnkNext').parent().removeClass("disabled");
            }
            else {
                $('#lnkNext').parent().removeClass("disabled");
                $('#lnkPrevious').parent().removeClass("disabled");
            }
        }

    })();
    */

</script>
