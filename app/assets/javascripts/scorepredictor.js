$(document).ready(function (){

  var gameInfo;
  var teamData;
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
        if (teamData.length === 30) {
          awayTeamsMatcher(allGames);
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
                if ( awayTeams[i].name === awayGames[x].away_team || awayTeams[i].name === awayGames[x].home_team ) {
                    awayData.push(awayGames[x].id, awayTeams[i].name, awayTeams[i].total_war);
                    console.log(awayData);
                 }
              }
            }

            if(typeof callback === "function") {
              callback();
            }
        }

        function Games(gameNumber, awayTeam, awayWar, homeTeam, homeWar) {
            this.gameNumber = gameNumber;
            this.awayTeam = awayTeam;
            this.awayWar = awayWar;
            this.homeTeam = homeTeam;
            this.homeWar = homeWar;
        }

        var gameOne = new Games(1, "Mariners", 16.7, "Orioles", 20.0);
        var gameTwo = new Games(2, "yankees", 16.7, "rangers", 20.0);

        function allGames() {
          var gamesData = [];
          gamesData.push(gameOne, gameTwo)
          console.log(awayData);
          console.log(gamesData[0].awayTeam, gamesData[1].homeTeam);
          // push the game one and game two into an array, they are both objects
        }




// create an object that has each game as a string
// populate each game key with an away team, home team, id, and total war score for each one
// loop through the object, and pass the game numbers total war scores to the war calculator function
// have the war calcualtor calculate the results and send the results to a case statement
// have the case statement determine a predicted winnner based on the total war score calculation difference
// have the case statement pass the total war difference predictiton to each game and display a string with the percent chance for that team winning the game




  });
