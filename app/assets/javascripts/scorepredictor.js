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
              let newUlElement = document.createElement("h4");
              let newContent = document.createTextNode(gameInfoAwayTeam + ' @ ' + gameInfoHomeTeam);
              currentDiv.appendChild(newUlElement);
              newUlElement.append(newContent);

              let currentDiv2 = document.getElementById("firstPitchInformation2");
              let newUlElement2 = document.createElement("h4");
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
              let newUlElement3 = document.createElement("h4");
              let newContent3 = document.createTextNode(team1);
              let newContent4 = document.createTextNode(team2);
              let newContent5 = document.createTextNode(neitherTeam);

              if (team1War > team2War) {
                currentDiv3.appendChild(newUlElement3);
                newUlElement3.append(newContent3);
              }
              else if (team2War > team1War) {
                currentDiv3.appendChild(newUlElement3);
                newUlElement3.append(newContent4);
              }
              else {
                currentDiv3.appendChild(newUlElement3);
                newUlElement3.append(newContent5);
              }
            }
            winCalculator();
          }

          function winCalculator() {

            for (let a = 0; a < allGamesData.length; a ++) {
              let team1War = allGamesData[a]["teamOneWar"];
              let team2War = allGamesData[a]["teamTwoWar"];
              let currentDiv3 = document.getElementById("percentChanceWinner2");
              let newUlElement3 = document.createElement("h4");
              let newContent3 = document.createTextNode(team1War);
              let newContent4 = document.createTextNode(team2War);
              let newContent55 = document.createTextNode("55% Chance of Winning");
              let newContent60 = document.createTextNode("60% Chance of Winning");
              let newContent65 = document.createTextNode("65% Chance of Winning");
              let newContent70 = document.createTextNode("70% Chance of Winning");
              let newContent75 = document.createTextNode("75% Chance of Winning");
              let newContent80 = document.createTextNode("80% Chance of Winning");
              let newContent85 = document.createTextNode("85% Chance of Winning");
              let newContent90 = document.createTextNode("90% Chance of Winning");
              let newContent99 = document.createTextNode("99% Chance of Winning");
              let push = document.createTextNode("Both Teams Equal Chance of Winning");

              let warDifferencesValues = eval(team1War - team2War);
              let warAbsoluteValues = Math.abs(warDifferencesValues);
              let warAbsoluteValuesRounded = Math.round(warAbsoluteValues * 10 ) / 10;
              console.log(warAbsoluteValuesRounded);

              if (warAbsoluteValuesRounded > 0.00 && warAbsoluteValuesRounded <= 5.99) {
                currentDiv3.appendChild(newUlElement3);
                newUlElement3.append(newContent55);
              } else if (warAbsoluteValuesRounded >= 6.00 && warAbsoluteValuesRounded <= 10.99) {
                currentDiv3.appendChild(newUlElement3);
                newUlElement3.append(newContent60);
              } else if (warAbsoluteValuesRounded >= 11.00 && warAbsoluteValuesRounded <= 15.99) {
                currentDiv3.appendChild(newUlElement3);
                newUlElement3.append(newContent65);
              } else if (warAbsoluteValuesRounded >= 16.00 && warAbsoluteValuesRounded <= 20.99) {
                currentDiv3.appendChild(newUlElement3);
                newUlElement3.append(newContent70);
              } else if (warAbsoluteValuesRounded >= 21.00 && warAbsoluteValuesRounded <= 25.99) {
                currentDiv3.appendChild(newUlElement3);
                newUlElement3.append(newContent75);
              } else if (warAbsoluteValuesRounded >= 26.00 && warAbsoluteValuesRounded <= 30.99) {
                currentDiv3.appendChild(newUlElement3);
                newUlElement3.append(newContent80);
              } else if (warAbsoluteValuesRounded >= 31.00 && warAbsoluteValuesRounded <= 35.99) {
                currentDiv3.appendChild(newUlElement3);
                newUlElement3.append(newContent85);
              } else if (warAbsoluteValuesRounded >= 36.00 && warAbsoluteValuesRounded <= 40.99) {
                currentDiv3.appendChild(newUlElement3);
                newUlElement3.append(newContent90);
              } else if (warAbsoluteValuesRounded >= 41) {
                currentDiv3.appendChild(newUlElement3);
                newUlElement3.append(newContent99);
              } else {
                currentDiv3.appendChild(newUlElement3);
                newUlElement3.append(push);
              }
            }
          }

  });
