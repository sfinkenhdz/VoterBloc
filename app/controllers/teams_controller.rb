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

  def index
    # includes => fewer db queries
    @teams = Team.all
    # @teams = Team.includes(:elections, :memberships).team_size
  end

end
