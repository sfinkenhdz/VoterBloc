class Team < ActiveRecord::Base
  has_many :comments
  has_many :invitations
  has_many :memberships
  has_many :participations
  has_many :elections, through: :participations
  accepts_nested_attributes_for :elections
  belongs_to :organizer, class_name: "User"

  def percent_to_goal
    @members = self.memberships.count.to_f
    @percent = (@members/self.membership_goal.to_f) * 100
  end

  def self.team_size
    @small = []
    @med = []
    @large = []
    @xlarge = []
    @sorted_teams = []

    teams = Team.all

    teams.each do |team|
      case team.membership_goal
      when (1..25)
        @small << team
      when (26..50)
        @med << team
      when (51..99)
        @large << team
      else
        @xlarge << team
      end
    end
      @sorted_teams << @small
      @sorted_teams << @med
      @sorted_teams << @large
      @sorted_teams << @xlarge
  end
end



