


function totalWarCalculator() {
  var batting = document.getElementById("battingWar").value;
  var pitching = document.getElementById("pitchingWar").value;
  var result = (battingWar + pitchingWar);

  document.getElementById("totalWar").innerHTML = 'Total War:' + result;
}
