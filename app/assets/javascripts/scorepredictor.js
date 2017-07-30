$(document).ready(function (){
  var gameInfo;
  var teamData;

      $.ajax({
      url: "/games",
      type: "GET",
      dataType: "JSON",
      data: {}
   }).done(function(games) {
       gameInfo = games;
       console.log(gameInfo[0].away_team, gameInfo[0].home_team);
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
      console.log(teamData[0].name, teamData[0].total_war);
      }).fail(function(data) {
        console.log("Data Did Not Load");
      });

      function warCalculator(totalWar1, totalWar2) {
        var rawWinDifference = totalWar1 - totalWar2
        var totalWarDifference

          if (rawWinDifference < 0) {
            totalWarDifference = rawWinDifference * -1
          } else {
            totalWarDifference = rawWinDifference * 1
          }
        document.getElementsByClassName("war").innerHTML = totalWarDifference;
      };

        // Get the modal
var modal = document.getElementById('warResults');

// Get the button that opens the modal
var btn = document.getElementById("warCalculationButton");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("closeModal")[0];

// When the user clicks on the button, open the modal
btn.onclick = function() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

  });
