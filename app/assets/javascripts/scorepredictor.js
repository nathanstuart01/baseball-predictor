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
                    gamesData.push(teams[i].name, teams[i].total_war);
                    console.log(gamesData);
                 }
              }
            }

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
         for (var c = 0; c < gamesData.length; c = c +4) {
// alternate way to acheieve same result, see belwo
//            allGamesData.push(new Game(gamesData[c], gamesData[c +1], gamesData[c +2], gamesData[c +3] ))
            allGamesData.push(
              {"teamOne": gamesData[c],
              "teamOneWar": gamesData[c +1],
              "teamTwo": gamesData[c +2],
              "teamTwoWar": gamesData[c +3] }
              )
         }
         console.log(allGamesData);
         warCalculator();
     }

      function warCalculator() {

        for ( var c = 0; c < allGamesData.length; c ++) {

            var teamInfo1 = allGamesData[c]["teamOne"];
            var teamInfo1War = allGamesData[c]["teamOneWar"];
            var teamInfo2 = allGamesData[c]["teamTwo"];
            var teamInfo2War = allGamesData[c]["teamTwoWar"];
            var list = $('#predictedWinner');
            var parent = list.parent();

               if (teamInfo1War > teamInfo2War) {
                  console.log(teamInfo1, teamInfo1War);
                  names.push(teamInfo1);
                  wars.push(teamInfo1War);
                    }  else  {
                  console.log(teamInfo2, teamInfo2War);
                  names.push(teamInfo2);
                  wars.push(teamInfo2War);
                 }
               }
               console.log(names);
               console.log(wars);
               winnerAdder();


              //      $(this).append('<li>' + names[x] + '</li>'); something with this is whats next
              //perhaps make a new function that is called that appends the list items after they are added to the array


     }

     function winnerAdder() {
       for (var c = 0; c <names.length; c ++) {
         $('.predictedWinner').append(names[c]);
       }
     }
             // need to make a new id each time, that is tied to my list item in rails
             // need to figure out how to only add one value for each team to its corresponding list item,
             // perhaps make each game an id css element, base that on games length,
             //then append each game based on the id
        //loop through games object
        //each game gets the x value from the loop
        // take team 1 war and subtract team 2 war from it
        // if result is less than 0, multiply result by -1
        // take result and send it to a case statement,
        // each result will be a different variable tied to the game
        // results will change, 0-5 difference, 55% chance of winning, 6-10, 60% chance of winning, 11-20 65% chance of winning, 21-25 70% chance of winning or better, 26+ 75% or greater chance of winning
        // append the text statement to another list item showing eachs win probability




  });
