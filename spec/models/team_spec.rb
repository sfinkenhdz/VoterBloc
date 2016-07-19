require 'rails_helper'
require 'spec_helper'

RSpec.describe Team, type: :model do

  let(:team) {Team.create(id: 1, organizer_id: 1, name: "Fighting Turtles", location: "Chicago", membership_goal: 6)}
  let(:membership1) {Membership.create(user_id: 1, team_id: 1)}
  let(:membership2) {Membership.create(user_id: 2, team_id: 1)}
  let(:membership3) {Membership.create(user_id: 3, team_id: 1)}

  describe 'percent_to_goal' do
    it 'returns the percent of members a team has, compared to the team membership goal' do
      team.memberships << membership1
      team.memberships << membership2
      team.memberships << membership3
      expect(team.percent_to_goal).to eq(50)
    end
  end

  describe 'self.team_size' do
    it 'returns a nested array of teams grouped by team size' do
    expect(team.class.team_size.length).to eq(4)
    end
    it 'places teams into the correct size array' do
    expect(team.class.team_size[0].length).to eq(1)
    end
  end
