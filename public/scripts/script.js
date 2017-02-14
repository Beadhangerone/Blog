
$(document).ready(function(){
	if ( $("#search-field").attr("value") ){
        $("#search-form").show()
    }
})

$(document).ready(function(){
    $("#search-fader").click(function(){
        $("#search-form").slideToggle(600);
    });
});

$(document).ready(function(){

    $(".post-text-fader").click(function(){
		var fader = $(this)
    	var target = $($(this).attr("target"))

		function change_chevron(){
			if (target.attr("expanded") == 'true'){
	    		target.attr("expanded", 'false')
	    		fader.html("<span class='glyphicon glyphicon-chevron-down'></span>")
	    	}else{
	    		target.attr("expanded", 'true')
	    		fader.html("<span class='glyphicon glyphicon-chevron-up'></span>")
	    	}
		}

		setTimeout(change_chevron, 750)
      target.slideToggle(700);
    });
});


//smileys
var input = $('#post_text')
var smiley_btn = $('.emotion')

smiley_btn.click(function() {
    var caret_pos = $('#post_text')[0].selectionStart;
    var input_value = input.val();
    var txt_to_add = $(this).text();
    input.val(input_value.substring(0, caret_pos) + txt_to_add + input_value.substring(caret_pos) );
    input.focus();
    input.selectionStart = input.selectionEnd = caret_pos+1
});