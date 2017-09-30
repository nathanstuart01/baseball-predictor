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
           for (let a = 0; a < gameInfo.length; a ++ ) {
             let gameInfoAwayTeam = gameInfo[a]["away_team"];
              let gameInfoHomeTeam = gameInfo[a]["home_team"];
              let gameInfoTime = gameInfo[a]["game_info"];

              let currentDiv = document.getElementById("gameInformation2");
              let newUlElement = document.createElement("ul");
              let newContent = document.createTextNode(gameInfoAwayTeam + ' @ ' + gameInfoHomeTeam);
              currentDiv.appendChild(newUlElement);
              newUlElement.append(newContent);

              let currentDiv2 = document.getElementById("firstPitchInformation2");
              let newUlElement2 = document.createElement("ul");
              let newContent2 = document.createTextNode(new Date(gameInfoTime).toLocaleTimeString());
              currentDiv2.appendChild(newUlElement2);
              newUlElement2.append(newContent2);
                  }
              gameWinnerPredictor();
              }

          function gameWinnerPredictor() {
            for (let a = 0; a < allGamesData.length; a ++) {
              let team1 = allGamesData[a]["teamOne"];
              let team2 = allGamesData[a]["teamTwo"];
              let neitherTeam ='Push';
              let team1War = allGamesData[a]["teamOneWar"];
              let team2War = allGamesData[a]["teamTwoWar"];
              let currentDiv3 = document.getElementById("predictedWinner2");
              let newUlElement3 = document.createElement("ul");
              let newContent3 = document.createTextNode(team1);
              let newContent4 = document.createTextNode(team2);
              let newContent5 = document.createTextNode(team2);

              if (team1War > team2War) {
                currentDiv3.appendChild(newUlElement3);
                newUlElement3.append(newContent3);
              } if ( team1War === team2War) {
                currentDiv3.appendChild(newUlElement3);
                newUlElement3.append(neitherTeam);
              }
              else {
                currentDiv3.appendChild(newUlElement3);
                newUlElement3.append(newContent4);
              }
            }

            winCalculator();
          }

          function winCalculator() {
            //setup something simliar to gameWinnerPredictor
            // assign values and based on the difference betweeen war scores, append the different variable values
            // let percent1 = 'Even, if wars equal%'
            // let percent2 = '55%, if war only 1-5 greater'
            // let percent3 = '60%, if war only 6-10 greater'
            // let percent4 = '65%, if war only 11-15 greater'
            // let percent5 = '70%, if war only 16-20 greater'
            // let percent6 = '75%, if war only 21-25 greater'
            // let percent7 = '80%, if war only 26-30 greater'
            // let percent8 = '85%, if war only 31-35 greater'
            // let percent9 = '90%, if war only 36-40 greater'
            // let percent10 = '99%, if war only 41 or greater'
          }
  });
