$(document).ready(function (){

  var gameInfo;
  var teamData;
  var gamesData = [];

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
                    gamesData.push(teams[i].name, teams[i].total_war);
                    console.log(gamesData);
                 }
              }
            }

            if(typeof callback === "function") {
              callback();
            }
        }

        function Games(teamOne, teamOneWar, teamTwo, teamTwoWar) {
            this.teamOne = teamOne;
            this.teamOneWar = teamOneWar;
            this.teamTwo = teamTwo;
            this.teamTwoWar = teamTwoWar;
        }


        function allGames() {
          var gamesDataz = {};
          for (var l =0; l < gameInfo.length; l ++) {
          gamesDataz[l] = new Games();
          console.log(gamesDataz[0][3]);
          }
        }




// create an object that has each game as a string
// populate each game key with an away team, home team, id, and total war score for each one
// loop through the object, and pass the game numbers total war scores to the war calculator function
// have the war calcualtor calculate the results and send the results to a case statement
// have the case statement determine a predicted winnner based on the total war score calculation difference
// have the case statement pass the total war difference predictiton to each game and display a string with the percent chance for that team winning the game




  });
