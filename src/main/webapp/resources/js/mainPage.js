/**
 * 
 */
//current position
var pos = 0;
var pos2 = 0;
//number of slides
var totalSlides = $('#slider-wrap ul li').length;
//get the slide width
var sliderWidth = $('#slider-wrap').width();



$(document).ready(function(){
  var flag = true;
	
  totalSlides = $('#slider-wrap ul li').length;
  sliderWidth = $('#slider-wrap').width();
  console.log(totalSlides)
  
  //set width to be 'x' times the number of slides
  $('#slider-wrap ul#slider').width(sliderWidth*totalSlides);
  
    //next slide  
  $('#next').click(function(){
    slideRight();
  });
  
  //previous slide
  $('#previous').click(function(){
    slideLeft();
  });
  
  //automatic slider
  var autoSlider = setInterval(slideRight, 3000);
  
  //for each slide 
  $.each($('#slider-wrap ul li'), function() { 

     //create a pagination
     var li = document.createElement('li');
     $('#pagination-wrap ul').append(li);    
  });
  
  //counter
  countSlides();
  
  //pagination
  pagination();
  
  
  //hide/show controls/btns when hover
	
	$('#moveProject').click(function(){
		console.log('img1');
		console.log(pos);
		var link=$('#slider-wrap ul li:eq('+pos+') a').attr('href');
		console.log(link);
		
		$(location).attr("href", link);
    });
	
  	$('#slider-wrap').hover(
    	function(){ $(this).addClass('active'); clearInterval(autoSlider);}, 
    	function(){ $(this).removeClass('active'); autoSlider = setInterval(slideRight, 3000);
    });
  	
    $('#pagination-wrap ul li').click(function(){
    	var index= $('#pagination-wrap ul li').index(this);
    	slideChoice(index)
    });
  	
  

});//DOCUMENT READY
function slideChoice(index){	
	pos=index
	$('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));
	
	 countSlides();
	 pagination();
}
function slideChoice2(index){
	pos2=index
	pagination2();
}

function slideLeft(){
  pos--;
  if(pos==-1){ pos = totalSlides-1; }
  $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));  
  
  //*> optional
  countSlides();
  pagination();
}

function slideRight(){
  pos++;
  if(pos==totalSlides){ pos = 0; }
  $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos)); 
  
  //*> optional 
  countSlides();
  pagination();
}

function countSlides(){
  $('#counter').html(pos+1 + ' / ' + totalSlides);
}

function pagination(){
  $('#pagination-wrap ul li').removeClass('active');
  $('#pagination-wrap ul li:eq('+pos+')').addClass('active');
}