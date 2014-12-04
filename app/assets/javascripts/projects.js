// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

// "/pledges?project_id=20&reward_id=44"

$(document).ready(function () {
    $('.rewards-form').submit(function (event) {
        event.preventDefault();

        // STANDARD - works all the time!
        var myurl = $(this).attr('action');
        $.ajax({
            url: myurl, //'/pledges?reward_id=' + rewardValue,
            type: 'POST',
            dataType: 'script'
        }).done(function (data) {
            $('#projects').html(data);
        }).fail(function (error) {
            alert("request failed!");
        });
    	// $.getScript('/pledges?reward_id=' + rewardValue);
    	alert('Went through projects.js');

    });
});