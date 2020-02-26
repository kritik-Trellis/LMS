$(function() {
    $('a.trigger').on('click', function() {
        $('.SiteHeader').toggleClass('is-open');
    });
});