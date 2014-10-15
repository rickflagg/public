<%--
  Author: Rick Flagg
  Date: 10/8/14
  Time: 4:26 AM
  Email: rick.flagg@gmail.com
  Website: rickflagg.net
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="skills" ng-controller="SkillsController">

    <div class="row">
        <div class="col-md-12 text-center">
            <h2>Skill Graphs</h2>
            <hr>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4" ng-repeat="(key, value) in skills">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">{{key}}</h3>
                </div>
                <div class="panel-body">
                      <div ng-repeat="matrix in value">
                          <div>
                              <h5>{{matrix.name}}</h5>
                          </div>

                          <div class="progress">
                              <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="{{matrix.rating}}" aria-valuemin="0" aria-valuemax="100" style="width: {{matrix.rating}}%">
                                   {{matrix.rating}}% Mastery
                              </div>
                          </div>
                </div>

            </div>
        </div>
    </div>
</div>