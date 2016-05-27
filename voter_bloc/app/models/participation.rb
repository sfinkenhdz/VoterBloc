class Participation < ActiveRecord::Base
  belongs_to :election
  belongs_to :team
end

