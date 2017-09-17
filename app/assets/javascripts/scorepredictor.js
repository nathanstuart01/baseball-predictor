$(document).ready(function (){

  var gameInfo;
  var teamData;
  var gamesData = [];
  var allGamesData = [];

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
                if ( games[x].away_team === teams[i].name || games[x].home_team === teams[i].name ) {
                    gamesData.push(teams[i].name, teams[i].total_war, new Date(games[x].game_info).toLocaleTimeString());
                 }
              }
            }
            console.log(gamesData);
            if(typeof callback === "function") {
              callback();
            }
        }

        function allGames() {


         for (var c = 0; c < gamesData.length; c = c +6) {

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
        console.log(gameInfo);
        for ( c = 0; c < gameInfo.length; c ++ )  {
            var homeTeam = gameInfo[c]["home_team"];
            var awayTeam = gameInfo[c]["away_team"];
            var gameInfo = gameInfo[c]["game_info"];

            $('.gameInformation').append('<li>' + awayTeam + '@' + homeTeam + '</li>');

            for ( var c = 0; c < allGamesData.length; c ++) {

              var teamInfo1 = allGamesData[c]["teamOne"];
              var teamInfo1War = allGamesData[c]["teamOneWar"];
              var teamInfo2 = allGamesData[c]["teamTwo"];
              var teamInfo2War = allGamesData[c]["teamTwoWar"];

                if (teamInfo1War > teamInfo2War) {

                console.log(teamInfo1, teamInfo1War);
                $('.predictedWinner').append('<li>' + teamInfo1 + '</li>');

                }  else  {

                console.log(teamInfo2, teamInfo2War);
                $('.predictedWinner').append('<li>' + teamInfo2 + '</li>');
                }


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
