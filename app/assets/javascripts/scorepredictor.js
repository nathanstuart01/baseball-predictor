$(document).ready(function (){
  var gameInfo;
  var teamData;
  var rawWinDifference;
  var totalWarDifference;

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
      //warCalculator(teamData[2].total_war, teamData[3].total_war)
      gameInfoWarMatcher()
      console.log(teamData);
      }).fail(function(data) {
        console.log("Data Did Not Load");
      });

      function warCalculator(totalWar1, totalWar2) {
        rawWinDifference = totalWar1 - totalWar2;

          if (rawWinDifference < 0) {
            totalWarDifference = rawWinDifference * -1
          } else {
            totalWarDifference = rawWinDifference * 1
          }
        };

      function gameInfoWarMatcher() {
            var games = gameInfo;
            var teams = teamData;
            var homeWarScore;
            var x = games.length;
            var z = teams.length;

            for (home_team in games ) {
            if (games[0].home_team === teams[4].name) {
              console.log("match");
            } else {
              console.log("no match");
              }
            }

          };
          //loop through all the game data
          //while looping when game data home team matches team name
          // grab the team names war total
          // put that war total as a value to be calculated in the war calculator as total war 1
          // repeat for the away team
  });
