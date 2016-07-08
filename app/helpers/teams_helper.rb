module TeamsHelper

  def locations
    [["Chicago, IL"],
    ["Evanston, IL"]]
  end

  def descriptions
    ["IL General Election -- Nov 1, 2016",
    "Chicago Mayoral -- Aug 15, 2016" ]
  end

private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    p params
    params.require(:team).permit(:name, :membership_goal, :location, elections_attributes: [:date, :description])
  end

end
