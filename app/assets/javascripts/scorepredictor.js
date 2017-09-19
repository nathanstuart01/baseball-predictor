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
         gameDisplayer();
     }

      function gameDisplayer() {

      var newDiv = document.createElement("div");
      var newContent = document.createTextNode("Hi there and greetings!");
      newDiv.appendChild(newContent); //add the text node to the newly created div.

      var currentDiv = document.getElementById("gameInformation");
      document.body.insertBefore(newDiv, currentDiv);
    }

    //    for (var a = 0; a < gameInfo.length; a ++ ) {
    //      var gameInfoAwayTeam = gameInfo[a]["away_team"];
    //      var gameInfoHomeTeam = gameInfo[a]["home_team"];
    //      var gameInfoTime = gameInfo[a]["game_info"];
    //      $('.gameInformation').append('<li>' + gameInfoAwayTeam + '@' + gameInfoHomeTeam + '</li>');

    //          }

    //        }

      function warCalculator() {
        for (var b = 0; b < allGamesData.length; b ++) {
          var teamInfo1 = allGamesData[b]["teamOne"];
          var teamInfo2 = allGamesData[b]["teamTwo"];
          var teamWar1 = allGamesData[b]["teamOneWar"];
          var teamWar2 = allGamesData[b]["teamTwoWar"];
          var p = $('.gameInformation');
        document.body.appendChild('<li>' + teamInfo1 + '</li>');

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
