// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


// "/pledges?project_id=20&reward_id=44"


// when the DOM loads
$(document).ready(function () {
    // gets rewards-form (class) from show.html.erb (reward form)
    $('.rewards-form').submit(function (event) {
        // prevent the pledeges/create.html.erb from loading after pressing button
        event.preventDefault();
        // STANDARD - works all the time!
        var myurl = $(this).attr('action');
        $.ajax({
            url: myurl, 

            type: 'POST',
            dataType: 'script'
        }).done(function (data) {
            $('#projects').html(data);
        }).fail(function (error) {
            alert("project.js request failed!");
        });
    	// END OF STANDARD AJAX REQUEST
    });

    //$(window).scroll(function() {
    //    if ($(window).scrollTop() > $(document).height() - $(window).height() - 25)
    //        console.log($('.pagination span.next').children().attr('href'));
    //        $.getScript($('.pagination span.next').children().attr('href'));
    //});

});

$(document).on('ready page:load', function() {
    if ($('.pagination').length) {
        $(window).scroll(function() {
            var url = $('.pagination span.next').children().attr('href');
            if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
                $('.pagination').text("Fetching more products...");
                return $.getScript(url);
            }
        });
    }
});
$(function(){ $(document).foundation(); });
