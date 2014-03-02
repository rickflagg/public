/**
 * Created with IntelliJ IDEA.
 * User: rflagg
 * Date: 5/25/13
 * Time: 2:19 PM
 * To change this template use File | Settings | File Templates.
 */

var PaginationService = (function () {

    function getCurrentPage($target){
        return parseInt($target.children("li.active").children("a").html());
    }

    function setRequestedPage(page)
    {
        $("#pageRequested").val(page);
    }

    function wirePagination($target){

        $target.children("li[data-previous-page]").children("a").click(function(e){
            alert('Previous page called ....');
            e.preventDefault();
            setRequestedPage((getCurrentPage($target) -1));
            $("#frmPager").submit();
        });

        $target.children("li[data-next-page]").children("a").click(function(e){
            alert('Next page called ....');
            e.preventDefault();
            setRequestedPage((getCurrentPage($target) +1));
            $("#frmPager").submit();
        });


        $target.children("li[data-page]").click(function(e){
            alert('Data page called ....');
            e.preventDefault();
            setRequestedPage(parseInt(this.innerText));
            $("#frmPager").submit();

        });



    }

    return {wirePagination: wirePagination}

} ());



var NavigationService = (function () {

    function setGlobalNavigationItemActive($nav){

        //inactivate all the existing primary navigation
        $('li [data-primary-navigation]').each(function(){
           this.removeClass('active');
        });

        $nav.addClass('active');

    }

    return{
        setGlobalNavigationItemActive: setGlobalNavigationItemActive
    }

} ());


var EventService = (function(){

    function wireIndexPageEvents(){

    }

    return {
        wireIndexPageEvents: wireIndexPageEvents
    }

}());


var CalendarService = (function(){

    function wireCalendarEvents(){
        $('#closeModal').click(function () {
            $('#calEvent').modal('hide');
        });
    }

    function formatCalendar(){
        $('#calendar').fullCalendar({
            // put your options and callbacks here
            events: [
                {
                    id: 1,
                    title: 'IMS Refactoring',
                    start: '2013-06-12',
                    end: '2013-06-15',
                    backgroundColor: 'green'
                },
                {
                    id: 2,
                    title: 'Personal Event',
                    start: '2013-06-14',
                    backgroundColor: 'blue'
                }
                // etc...
            ],
            color: 'yellow',   // an option!
            textColor: 'black', // an option!
            eventClick: function (event, jsEvent, view) {
                $('#calEvent').modal('show');
            }
        })

    }

    return {
        wireCalendarEvents: wireCalendarEvents,
        formatCalendar: formatCalendar
    }

}());