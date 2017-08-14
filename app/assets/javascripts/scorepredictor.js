$(document).ready(function (){

  var gameInfo;
  var teamData;
  var gamesData = [];
  var awayData =[];
  var homeData =[];
  var totalWarDifference;
  var rawWarDifference;

  var AllGames = {
      gameNumber: 1,
      awayTeam: "Seattle Mariners",
      awayWar: 16.7,
      homeTeam: "Los Angeles Angels",
      homeWar: 20,
      totalWar: function(war1, war2) {
          rawlWarDifference = war1 - war2
          totalWarDifference = rawWarDifference * -1;
        //  if (rawWarDifference < 0) {
        //    totalWarDifference = rawWarDifference * -1
        //  } else {
        //    totalWarDifference = rawWarDifference
        //  }
        console.log(totalWarDifference);
      }
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
              console.log(AllGames.totalWar(AllGames.awayWar, AllGames.homeWar));
            // call Allgames Object Here  console.log(;
            } else {
              alert("Game data loading...");
            }
          }



// create an object that has each game as a string
// populate each game key with an away team, home team, id, and total war score for each one
// loop through the object, and pass the game numbers total war scores to the war calculator function
// have the war calcualtor calculate the results and send the results to a case statement
// have the case statement determine a predicted winnner based on the total war score calculation difference
// have the case statement pass the total war difference predictiton to each game and display a string with the percent chance for that team winning the game




  });
