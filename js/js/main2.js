(function ($) {

    $(".toggle-password").click(function () {

        $(this).toggleClass("zmdi-eye zmdi-eye-off");
       
        var input = $($(this).attr("toggle"));
        if (input.attr("type") == "password") {
            input.attr("type", "text");
            $(this).css('color', 'red');
        } else {
            input.attr("type", "password");
            $(this).css('color', 'mediumspringgreen');
        }
    });

    $(".toggle-password2").click(function () {

        $(this).toggleClass("zmdi-eye zmdi-eye-off");

        var input = $($(this).attr("toggle"));
        if (input.attr("type") == "password") {
            input.attr("type", "text");
            $(this).css('color', 'red');
        } else {
            input.attr("type", "password");
            $(this).css('color', 'mediumspringgreen');
        }
    });

})(jQuery);