// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
<<<<<<< HEAD

$(document).ready(function () {
    $('#rewards-button').submit(function (event) {
        event.preventDefault();
        var rewardValue = $('#button').val();

        // STANDARD - works all the time!
        $.ajax({
            url: '/pledges?reward_id=' + rewardValue,
=======
// "/pledges?project_id=20&reward_id=44"

$(document).ready(function () {
    $('.rewards-form').submit(function (event) {
        event.preventDefault();

        // STANDARD - works all the time!
        var myurl = $(this).attr('action');
        $.ajax({
            url: myurl, //'/pledges?reward_id=' + rewardValue,
>>>>>>> origin/mchau
            type: 'POST',
            dataType: 'script'
        }).done(function (data) {
            $('#projects').html(data);
        }).fail(function (error) {
            alert("request failed!");
        });
<<<<<<< HEAD
=======
    	// $.getScript('/pledges?reward_id=' + rewardValue);
    	alert('Went through projects.js');
>>>>>>> origin/mchau
    });
});