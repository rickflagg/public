/**
 * Created by flaggr on 12/20/13.
 */

(function($){

    jQuery.fn.pcarousel = function(options){


        var defaults = {
            datasource: undefined,
            selectedIndex: 0,
            techImageDir: "images/tech"
        }

        var opt = jQuery.extend(defaults, options);

        return this.each(function(){

            var self = jQuery(this);
            var data = null;
            var selectedIndex = 0;
            var recordCount = 0;

            initialize();


            function initialize(){

                //Clear previous html
                self.html("");

                //Get the data
                data = getData(opt);

                if(selectedIndex == undefined){
                    selectedIndex = opt.selectedIndex;
                }

                if(data != null && data.length > 0)
                {
                    recordCount = data.length;

                    for(var i = 0; i < data.length; i++){
                        var record = data[i];
                        self.append(constructProjectMarkup(record, i));
                    }

                    self.append(constructPagerMarkup(recordCount));
                }


            }

            function getData(opt){

                var retval;

                if(opt.datasource === undefined){
                    retval = fauxDatasource();
                }
                else{

                    $.ajax({
                        url: opt.datasource,
                        type: 'get',
                        dataType: 'json',
                        async: false,
                        success: function(data) {
                            retval = data;
                        }
                    });



                }

                return retval;
            }

            function navigatePrevious(){
                selectedIndex--;
                initialize();
            }

            function navigateNext(){
                selectedIndex++;
                initialize();
            }

            function constructPagerMarkup(recordCount){

                var $pagerRowDiv = $('<div class="row"></div>');
                var $pagerColumnDiv = $('<div class="col-md-6 col-md-offset-2"></div>');
                var $pagerList = $('<ul class="pager"></ul>')
                var $previousPaginationListItem = $('<li class="previous"></li>');
                var $nextPaginationListItem = $('<li class="next"></li>');
                var $previousPaginationLink = $('<a href="javascript:void(0)">&larr; Newer</a>');
                var $nextPaginationLink = $('<a href="javascript:void(0)">Older &rarr;</a>')

                if(selectedIndex == 0){
                    $previousPaginationListItem.addClass("disabled");
                }
                else{
                    $previousPaginationLink.click(function(){
                        navigatePrevious();
                    });
                }

                if(selectedIndex == (recordCount - 1)){
                    $nextPaginationListItem.addClass("disabled");
                } else {
                    $nextPaginationLink.click(function(){
                        navigateNext();
                    });
                }

                //Append the elements
                $previousPaginationListItem.append($previousPaginationLink);
                $nextPaginationListItem.append($nextPaginationLink);

                $pagerList.append($previousPaginationListItem);
                $pagerList.append($nextPaginationListItem);

                $pagerColumnDiv.append($pagerList);
                $pagerRowDiv.append($pagerColumnDiv);

                return $pagerRowDiv;
            }

            function constructProjectMarkup(record, recordIndex){


                var $projectDivRoot = $('<div class="col-md-12"></div>');
                var $projectDivPanel =   $('<div class="panel panel-default"></div>');
                var $projectDivHeader = $('<div class="panel-heading text-left"></div>');
                var $projectDivBody = $('<div class="panel-body"></div>');

                var $projectHeading = $('<h3></h3>');
                var $projectDescription = $('<dl><dt>Project Description:</dt><dd></dd></dl>');
                var $projectTimeframe = $('<dl><dt>Project Timeframe</dt><dd></dd></dl>');
                var $projectOrganization = $('<dl><dt>Project Organization</dt><dd></dd></dl>');
                var $projectClient = $('<dl><dt>Project Client</dt><dd></dd></dl>');
                var $projectRoles = $('<dl><dt>Project Roles</dt><dd></dd></dl>')
                var $projectNotables = $('<dl><dt>Project Notables</dt><dd></dd></dl>');

                $projectNotables.children("dd").text(record.notable);
                $projectRoles.children("dd").text(formatRoles(record.roles));
                $projectClient.children("dd").text(record.client.name);
                $projectOrganization.children("dd").text(record.organization.name);
                $projectTimeframe.children("dd").text(formatDateRange(record.start_date, record.end_date));

                if(record.description != null){
                    $projectDescription.children("dd").text(record.description);
                }

                if(record.name != null){
                    $projectHeading.text(record.name);
                }

                $projectDivBody.append($projectHeading);
                $projectDivBody.append($projectDescription);
                $projectDivBody.append($projectTimeframe);
                $projectDivBody.append($projectOrganization);
                $projectDivBody.append($projectClient);
                $projectDivBody.append($projectRoles);
                $projectDivBody.append($projectNotables);
                $projectDivBody.append(formatTechnologies(record.technologies));

                $projectDivPanel.append($projectDivHeader);
                $projectDivPanel.append($projectDivBody);

                $projectDivRoot.append($projectDivPanel);

                if(recordIndex != selectedIndex){
                   $projectDivRoot.hide();
                }

                return $projectDivRoot;

            }

            function fauxDatasource(){
                return [{"id":1,"active":true,"name":"Outreach Job Forum","description":"The Outreach tool allows users to send email messages to single group, to the selected regions or states within a particular group and to multiple groups. The tool also allows user to view email logs after sending email messages and reviewing data currency report, and allows admin users to manage data, including contacts information, user accounts and source data of email groups","startDate":1382971856943,"endDate":null,"organization":{"id":3,"active":null,"name":"Sourcecast","dateCreated":null,"sortOrder":-1,"whoCreated":null,"whoEdited":null,"dateEdited":null},"client":{"id":3,"active":true,"name":"Sourcecast","dateCreated":null,"sortOrder":-1,"whoCreated":null,"whoEdited":null,"dateEdited":null},"url":"http://divercityoutreach.com/","notable":"Finalized application developement and pushed to production environment","technologies":[{"id":1,"active":true,"name":"C#","iconPath":"c-sharp.png","url":"http://en.wikipedia.org/wiki/C_Sharp_(programming_language)","dateCreated":null,"sortOrder":-1,"whoCreated":null,"whoEdited":null,"dateEdited":null},{"id":2,"active":true,"name":"CSS","iconPath":"css.png","url":"http://en.wikipedia.org/wiki/CSS","dateCreated":null,"sortOrder":-1,"whoCreated":null,"whoEdited":null,"dateEdited":null},{"id":4,"active":true,"name":"JQuery","iconPath":"jquery.png","url":"http://en.wikipedia.org/wiki/JQuery","dateCreated":null,"sortOrder":-1,"whoCreated":null,"whoEdited":null,"dateEdited":null}],"roles":[{"id":1,"active":true,"name":"Technical Lead","dateCreated":null,"sortOrder":-1,"whoCreated":null,"whoEdited":null,"dateEdited":null}],"shortFormattedEndDate":null,"shortFormattedStartDate":"10/28/2013","dateCreated":null,"sortOrder":-1,"whoCreated":null,"whoEdited":null,"dateEdited":null},{"id":2,"active":true,"name":"Federal Audit Clearing House Processing","description":"The Federal Audit Clearing House Processing application allows quality assurance auditors to review submitted audit information in relation to grants over $500K and to provide QA indicators for specific records. The system contains automatic email notifications at specific points in the workflow to notify staff and auditee/auditors of problems with a specific audit. The application contains complex workflow based on user levels and status flags to implement a queuing mechanism so that certain statuses are only viewed by specific levels of users.","startDate":1352389857046,"endDate":1382971857046,"organization":{"id":1,"active":null,"name":"NetStar","dateCreated":null,"sortOrder":-1,"whoCreated":null,"whoEdited":null,"dateEdited":null},"client":{"id":2,"active":true,"name":"U.S Census Bureau, Governments Division","dateCreated":null,"sortOrder":-1,"whoCreated":null,"whoEdited":null,"dateEdited":null},"url":null,"notable":"Due to the massive amount of data that is collected/managed, a native implementation (WinForms) was selected as the UI to provide a responsive interface and workflow.","technologies":[{"id":null,"active":false,"name":null,"iconPath":null,"url":null,"dateCreated":null,"sortOrder":-1,"whoCreated":null,"whoEdited":null,"dateEdited":null}],"roles":[{"id":null,"active":false,"name":null,"dateCreated":null,"sortOrder":-1,"whoCreated":null,"whoEdited":null,"dateEdited":null}],"shortFormattedEndDate":"10/28/2013","shortFormattedStartDate":"11/08/2012","dateCreated":null,"sortOrder":-1,"whoCreated":null,"whoEdited":null,"dateEdited":null},{"id":3,"active":true,"name":"Federal Audit Clearing House Education Processing","description":"Implemented change requests on an existing WinForms application to incorporate additional audit data collected for audit years 2013 and beyond. Based on audit year association, user interface elements are dynamically rendered with the appropriate data elements.","startDate":1359733857051,"endDate":1367333457051,"organization":{"id":1,"active":null,"name":"NetStar","dateCreated":null,"sortOrder":-1,"whoCreated":null,"whoEdited":null,"dateEdited":null},"client":{"id":2,"active":true,"name":"U.S Census Bureau, Governments Division","dateCreated":null,"sortOrder":-1,"whoCreated":null,"whoEdited":null,"dateEdited":null},"url":null,"notable":"I leveraged extensions methods to add required functionality to the existing implementation. I Introduced unit-testing to allow regression testing of my implementation and performed refactoring to clarify problematic areas in the code base.","technologies":[{"id":null,"active":false,"name":null,"iconPath":null,"url":null,"dateCreated":null,"sortOrder":-1,"whoCreated":null,"whoEdited":null,"dateEdited":null}],"roles":[{"id":null,"active":false,"name":null,"dateCreated":null,"sortOrder":-1,"whoCreated":null,"whoEdited":null,"dateEdited":null}],"shortFormattedEndDate":"04/30/2013","shortFormattedStartDate":"02/01/2013","dateCreated":null,"sortOrder":-1,"whoCreated":null,"whoEdited":null,"dateEdited":null}];            }

            function formatTechnologies(techs){

                $technologyDL = $('<dl><dt>Technologies</dt><dd></dd></dl>');
                $technologyUL = $('<ul class="list-inline"></ul>');

                if(techs != undefined && techs != null && techs.length > 0)
                {
                    for(var i = 0; i < techs.length; i++)
                    {
                        if(techs[i].icon_path != null)
                        {

                            var $techLi = $('<li></li>');
                            var $techAnchor = $('<a></a>');
                            var $techImage = $('<img class="techImg" />')

                            $techImage.attr("src",opt.techImageDir + "/" + techs[i].icon_path);


                            $techAnchor.attr("href", techs[i].url);

                            $techAnchor.append($techImage);
                            $techLi.append($techAnchor);

                            $technologyUL.append($techLi);

                        }
                    }
                }

                $technologyDL.children("dd").append($technologyUL);

                return $technologyDL;
            }

            function formatRoles(roles){

                var retval = [];

                if(roles != undefined && roles != null && roles.length > 0){
                    for(var i = 0; i < roles.length; i++){
                        retval.push(roles[i].name);
                    }
                }

                return retval.join(", ");
            }

            function formatMonthName(date){
                months = ["January","February","March","April","May","June","July","August","September","October","November","December"];
                return months[date.getMonth()];
            }

            function formatDateRange(startDate, endDate){
                var startLabel = null;
                var endLabel = null;
                var returnLabel = "";

                console.log(endDate);

                if(startDate != undefined || startDate != null){
                    startDate = new Date(startDate);
                    startLabel = formatMonthName(startDate) + " " + startDate.getFullYear().toString();
                }

                if(endDate != undefined  || endDate != null){
                    endDate = new Date(endDate);
                    endLabel = formatMonthName(endDate) + " " + endDate.getFullYear().toString();
                }

                if(startLabel != null){
                    returnLabel = startLabel + " - ";
                }

                if(endLabel != null){
                    returnLabel = returnLabel + endLabel;
                }

                return returnLabel;

            }

        });


    }

})(jQuery)
