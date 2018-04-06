$(function(){
  $("#home-map .close").on("click", function(e){
    e.stopPropagation();
    $(this).closest(".overlay").addClass("collapsed").find("h2,p,.close").slideToggle();
  });
  $("#home-map .overlay").on("click", function(){
    if ($(this).hasClass("collapsed")) {
      $(this).removeClass("collapsed");
      setTimeout(function(){
        $("#home-map .overlay").find("h2,p,.close").slideToggle();
      },500);
    }
  });
});