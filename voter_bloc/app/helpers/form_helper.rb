module FormHelper

  def setup_team(team)
    team.elections ||= Team.new
    team.elections.build
    team
  end

end