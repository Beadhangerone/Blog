$(document).ready(function(){
	setInterval(function() {
	    var xmlHttp = new XMLHttpRequest()
	    xmlHttp.open( "GET", 'http://doodle-blog.herokuapp.com', true )
	    xmlHttp.send( null )
	}, 30000)
})

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

