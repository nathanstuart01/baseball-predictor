$(document).ready(function (){

  var gameInfo;
  var teamData;
  var gamesData = [];
  var allGamesData = [];
  var names = [];
  var wars = [];

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
          teamsMatcher(allGames);
        } else {
          alert("Data Loading...");
        }
    }).fail(function(data) {
        console.log("Data Did Not Load");
      });

      function teamsMatcher(callback) {
          var teams = teamData;
          var games = gameInfo;
          var x;
          var i;

            for (x = 0; x < games.length; x ++) {
              for (i = 0; i < teams.length; i++) {
                if ( teams[i].name === games[x].away_team || teams[i].name === games[x].home_team ) {
                    gamesData.push(teams[i].name, teams[i].total_war, new Date(games[x].game_info).toLocaleTimeString());
                 }
              }
            }
            console.log(gamesData);
            if(typeof callback === "function") {
              callback();
            }
        }

// alternate way to acheieve same games array result, create an object protoype

//        function Game(team1, team1War, team2, team2War) {
//            this.teamOne = team1;
//            this.teamOneWar = team1War;
//            this.teamTwo = team2;
//            this.teamTwoWar = team2War;
//        }

        function allGames() {
          var lewis;

         for (var c = 0; c < gamesData.length; c = c +6) {
// alternate way to acheieve same result, see belwo
//            allGamesData.push(new Game(gamesData[c], gamesData[c +1], gamesData[c +2], gamesData[c +3] ))
            allGamesData.push(
              {
              "gameInfo": gamesData[c +5],
              "teamOne": gamesData[c],
              "teamOneWar": gamesData[c +1],
              "teamTwo": gamesData[c +3],
              "teamTwoWar": gamesData[c +4]
             }
              )
         }
         console.log(allGamesData);
         warCalculator();
     }

      function warCalculator() {

                  for ( a = 0; a < gameInfo.length; a ++ ) {

                    var gameInfoAwayTeam = gameInfo[a]["away_team"];
                    var gameInfoHomeTeam = gameInfo[a]["home_team"];
                    var gameInfoTime = gameInfo[a]["game_info"];

                    $('.gameInfoClass').append('<li>' + gameInfoAwayTeam + ' @ ' + gameInfoHomeTeam + '</li>');
                        }

                  for ( var c = 0; c < allGamesData.length; c ++) {
                            var teamInfo1 = allGamesData[c]["teamOne"];
                            var teamInfo1War = allGamesData[c]["teamOneWar"];
                            var teamInfo2 = allGamesData[c]["teamTwo"];
                            var teamInfo2War = allGamesData[c]["teamTwoWar"];

                               if (teamInfo1War > teamInfo2War) {
                                  console.log(teamInfo1, teamInfo1War);
                                  $('.predictedWinner').prepend('<li>' + teamInfo1 + '</li>');
                                    }  else  {
                                  console.log(teamInfo2, teamInfo2War);
                                  $('.predictedWinner').prepend('<li>' + teamInfo2 + '</li>');
                                    }
                                  }
                                }



        //each game gets the x value from the loop
        // take team 1 war and subtract team 2 war from it
        // if result is less than 0, multiply result by -1
        // take result and send it to a case statement,
        // each result will be a different variable tied to the game
        // results will change, 0-5 difference, 55% chance of winning, 6-10, 60% chance of winning, 11-20 65% chance of winning, 21-25 70% chance of winning or better, 26+ 75% or greater chance of winning
        // append the text statement to another list item showing eachs win probability




  });
