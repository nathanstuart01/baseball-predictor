$(document).ready(function(){
  $('teamData').on('load', function(){
    $.ajax({
        type: "GET",
        dataType: "json",
        url: "/teams",
        success: function(data){}
        console.log(teams[0])
      });
    });
});
