$(document).ready(function (){
  var gameInfo;
  var teamData;
  var rawWinDifference;
  var totalWarDifference;


  function warCalculator(totalWar1, totalWar2) {
    rawWinDifference = totalWar1 - totalWar2;

      if (rawWinDifference < 0) {
        totalWarDifference = rawWinDifference * -1
      } else {
        totalWarDifference = rawWinDifference * 1
      }
        $(".war").append(totalWarDifference);
      };

      $.ajax({
      url: "/games",
      type: "GET",
      dataType: "JSON",
      data: {}
   }).done(function(games) {
       gameInfo = games;
       console.log(gameInfo);
       }).fail(function(data) {
       console.log("Data Did Not Load");
     });

    $.ajax({
    url: "/teams",
    type: "GET",
    dataType: "JSON",
    data: {}
    }).done(function(teams) {
      teamData = teams;
      warCalculator(teamData[2].total_war, teamData[3].total_war)
      console.log(teamData);
      }).fail(function(data) {
        console.log("Data Did Not Load");
      });

  });
