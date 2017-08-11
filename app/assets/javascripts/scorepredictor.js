$(document).ready(function (){

  var gameInfo;
  var teamData;
  var rawWinDifference;
  var totalWarDifference;
  var gamesData = [];
  var awayData =[];
  var homeData =[];

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
        if (teamData.length === 30) {
          awayTeamsMatcher(homeTeamsMatcher);
        } else {
          alert("Data Loading...");
        }
    }).fail(function(data) {
        console.log("Data Did Not Load");
      });

      function awayTeamsMatcher(callback) {
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
                    console.log(awayData);
                 }
              }
            }

            if(typeof callback === "function") {
              callback();
            }
        }


        function homeTeamsMatcher() {
          var homeTeams = teamData;
          var homeGames = gameInfo;
          var a;
          var b;
          var c;
          var d;

            for (a = 0, b =homeGames.length; a < b; a ++) {
              for (c = 0, d = homeTeams.length; c < d; c++) {
                if ( homeTeams[c].name === homeGames[a].home_team ) {
                    homeData.push(homeGames[a].id, homeTeams[c].name, homeTeams[c].total_war);
                    console.log(homeData);
                 }
              }
            }
            if (homeData.length === awayData.length) {
                pushDataIntoGamesArray(awayData);
            } else {
              alert("Game data loading...");
            }
          }

        function pushDataIntoGamesArray(arr1) {
          for (var e = 0, len = 1; e < len; e++) {
            gamesData.push(awayData);
          }
          console.log(awayData);
        }

  });
