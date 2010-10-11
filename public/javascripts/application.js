// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function() {
    $('#micropost_content').each(function() {
        check($(this));

        $(this).keyup(function() {
            check($(this));
        });
    });
});

function check(mp) {
    var limit = parseInt(mp.attr('maxlength'), 10) || 0;
    counter = $('.actions #counter');


    var length = mp.val().length;
    if (length >= limit) {
        mp.val(mp.val().substring(0, limit))
        length = limit;
    };

    submit_button = $('.actions #micropost_submit');

    if (length == 0) {
        submit_button.attr('disabled', 'disabled')
    }
    else {
        submit_button.removeAttr('disabled')
    };

    counter.html(limit - length);
}