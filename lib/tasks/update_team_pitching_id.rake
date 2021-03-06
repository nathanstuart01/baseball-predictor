namespace :update_team_pitching_id do

  desc "Update Team Pitching War IDs to Match Team IDs"
  task update_team_pitching_id_in_db: :environment do
    PitchingStat.update(2, team_id:3)
    PitchingStat.update(3, team_id:28)
    PitchingStat.update(4, team_id:29)
    PitchingStat.update(5, team_id:10)
    PitchingStat.update(6, team_id:2)
    PitchingStat.update(7, team_id:12)
    PitchingStat.update(8, team_id:27)
    PitchingStat.update(9, team_id:4)
    PitchingStat.update(10, team_id:22)
    PitchingStat.update(11, team_id:21)
    PitchingStat.update(12, team_id:24)
    PitchingStat.update(13, team_id:6)
    PitchingStat.update(14, team_id:25)
    PitchingStat.update(15, team_id:14)
    PitchingStat.update(16, team_id:8)
    PitchingStat.update(17, team_id:13)
    PitchingStat.update(18, team_id:9)
    PitchingStat.update(19, team_id:30)
    PitchingStat.update(20, team_id:19)
    PitchingStat.update(21, team_id:5)
    PitchingStat.update(22, team_id:15)
    PitchingStat.update(23, team_id:11)
    PitchingStat.update(24, team_id:16)
    PitchingStat.update(25, team_id:1)
    PitchingStat.update(26, team_id:7)
    PitchingStat.update(27, team_id:23)
    PitchingStat.update(28, team_id:17)
    PitchingStat.update(29, team_id:20)
    PitchingStat.update(30, team_id:18)
  end
end
