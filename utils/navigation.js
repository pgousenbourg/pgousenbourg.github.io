	
// Navigation

$( "#link-about" ).click(function() {
	$( ".tab" ).hide();
	$( "#sec-about" ).show();
	$( "li.active" ).removeClass('active');
	$( "#nav-about" ).addClass('active');
});
$( "#link-research" ).click(function() {
	$( ".tab" ).hide();
	$( "#sec-research" ).show();
	$( "li.active" ).removeClass('active');
	$( "#nav-research" ).addClass('active');
});
$( "#link-publications" ).click(function() {
	$( ".tab" ).hide();
	$( "#sec-publications" ).show();
	$( "li.active" ).removeClass('active');
	$( "#nav-publications" ).addClass('active');
});
$( "#link-teaching" ).click(function() {
	$( ".tab" ).hide();
	$( "#sec-teaching" ).show();
	$( "li.active" ).removeClass('active');
	$( "#nav-teaching" ).addClass('active');
});
$( "#link-nt" ).click(function() {
	$( ".tab" ).hide();
	$( "#sec-nt" ).show();
	$( "li.active" ).removeClass('active');
	$( "#nav-nt" ).addClass('active');
});
$( "#link-contact" ).click(function() {
	$( ".tab" ).hide();
	$( "#sec-contact" ).show();
	$( "li.active" ).removeClass('active');
	$( "#nav-contact" ).addClass('active');
});


// Javascript to reach the anchor

function gotoAnchor()
{
	var hash = window.location.hash;
	console.log(hash)
	switch(hash)
	{
		case "#about" :
			$("#link-about").click();
			break;
			
		case "#research" :
			$("#link-research").click();
			break;
		
		case "#publications" :
			$("#link-publications").click();
			break;
		
		case "#teaching" :
			$("#link-teaching").click();
			break;
		
		case "#nt" :
			$("#link-nt").click();
			break;
		
		case "#contact" :
			$("#link-contact").click();
			break;
		
		default :
			 $("#link-about").click();
	}
};

// Don't forget to call the function, otherwise it has no sense :D

gotoAnchor();
