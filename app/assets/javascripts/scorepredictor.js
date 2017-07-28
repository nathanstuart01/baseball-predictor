$(document).ready(function (){
  $.ajax({
      url: "/teams",
      type: "GET",
      dataType: "JSON",
      data: {}
    }).done(function(data) {
      $(".war").append(data[0].total_war);
          console.log(data);
      }).fail(function(data) {
        console.log(data);
      });
});
