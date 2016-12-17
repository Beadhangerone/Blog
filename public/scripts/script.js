$(document).ready(function(){
	if ( $("#search-field").attr("value") ){
        $("#search-form").show()
    }
})

$(document).ready(function(){
    $("#search-fader").click(function(){
        $("#search-form").slideToggle(70);
    });
});