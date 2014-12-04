// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function () {
    $('#rewards-button').submit(function (event) {
        event.preventDefault();
        var rewardValue = $('#button').val();

        // STANDARD - works all the time!
        $.ajax({
            url: '/pledges?reward_id=' + rewardValue,
            type: 'GET',
            dataType: 'script'
        }).done(function (data) {
            $('#projects').html(data);
        }).fail(function (error) {
            alert("request failed!");
        });
    });
});