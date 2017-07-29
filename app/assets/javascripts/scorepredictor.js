$(document).ready(function (){

      $.ajax({
      url: "/games",
      type: "GET",
      dataType: "JSON",
      data: {}
   }).done(function(games) {
       var gameInfo = games;
   //  $(".info").append(teamData[0].name, teamData[0].total_war);
       console.log(gameInfo[0].away_team, gameInfo[0].home_team);
       }).fail(function(data) {
       console.log("Data Did Not Load");
     });

    $.ajax({
    url: "/teams",
    type: "GET",
    dataType: "JSON",
    data: {}
    }).done(function(teams) {
      var teamData = teams;
    // $(".war").append(teamData[0].name);
    console.log(teamData[0].name, teamData[0].total_war);
      }).fail(function(data) {
        console.log("Data Did Not Load");
      });
  });
