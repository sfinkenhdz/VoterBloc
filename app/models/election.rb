class Election < ActiveRecord::Base
  has_many :participations
  has_many :votes
end

