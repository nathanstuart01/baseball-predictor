$(document).ready(function (){
  var gameInfo;
  var teamData;
  var rawWinDifference;
  var totalWarDifference;
  var gamesData = [];
  var awayData =[];

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
        console.log(teamData);
        awayTeamsMatcher();
        homeTeamsMatcher();
        gamesDataCreator();
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

    function awayTeamsMatcher() {
      var awayTeams = teamData;
      var awayGames = gameInfo;
      var x;
      var y;
      var i;
      var l;

        for (x = 0, y = awayGames.length; x < y; x ++) {
          for (i = 0, l = awayTeams.length; i < l; i++) {
            if ( awayTeams[i].name === awayGames[x].away_team ) {
                awayData.push(awayGames[x].id, awayTeams[i].name, awayTeams[i].total_war);
             }
          }
        }
    };

    function homeTeamsMatcher() {
      var homeTeams = teamData;
      var homeGames = gameInfo;
      var homeData =[];
      var a;
      var b;
      var c;
      var d;

        for (a = 0, b =homeGames.length; a < b; a ++) {
          for (c = 0, d = homeTeams.length; c < d; c++) {
            if ( homeTeams[c].name === homeGames[a].home_team ) {
                homeData.push(homeGames[a].id, homeTeams[c].name, homeTeams[c].total_war);
             }
          }
        }

    function gamesDataCreator() {
      console.log(awayData);
    };

    };

    // need to take the data that I have parsed in my console, somehow pass it to the function warcalculator
    // need to assign a variable value to each away and home team value
    // is there a game to pass things to war calculator based on game id
    // push results to an away and home team game array??
    //let the function warcalculator calculate the values and thne spit it out onto the list items for each individual game

  });
