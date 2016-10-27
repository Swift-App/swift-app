$(function() {
  $('#editor').morrigan_editor( {
    iframeStyles: '/assets/iframe.css',
    width:'770px',
    height:'550px'
  } );
});

$(".scroll-top").on("click", function(){
	window.scrollTo(0,0);
})