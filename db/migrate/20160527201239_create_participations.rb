class CreateParticipations < ActiveRecord::Migration
  def change
    create_table  :participations do |t|
      t.integer   :team_id
      t.integer   :election_id

      t.timestamps null: false
    end
  end
end
