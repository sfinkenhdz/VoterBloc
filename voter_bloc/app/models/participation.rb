class Participation < ActiveRecord::Base
  belongs_to :election
  belongs_to :team

  attr_accessor :election_id
end
