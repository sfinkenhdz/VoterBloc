class TeamsController < ApplicationController
  include TeamsHelper

  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.save
    redirect_to "/"
  end

  def show
    @team = Team.find(params[:id])
  end

end
