$(document).ready(function(){
	if ( $("#search-field").attr("value") ){
        $("#search-form").show()
    }
})

$(document).ready(function(){
    $("#search-fader").click(function(){
        $("#search-form").slideToggle(700);
    });
});

$(document).ready(function(){
    $(".post-text-fader").click(function(){
    	var target = $($(this).attr("target"))    	
        target.slideToggle(700);
    });
});

