class Vote < ActiveRecord::Base
  belongs_to :election
  belongs_to :voter, class_name: "User"
end

