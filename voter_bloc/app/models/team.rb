class Team < ActiveRecord::Base
  has_many :comments
  has_many :invitations
  has_many :memberships
  has_many :participations
  has_many :elections, through: :participations
  accepts_nested_attributes_for :elections
  belongs_to :organizer, class_name: "User"

  def percent_to_goal
    @members = self.memberships.count
    @percent = @members/self.membership_goal
  end
end

