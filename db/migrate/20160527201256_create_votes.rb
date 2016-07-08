class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer   :voter_id
      t.integer   :election_id

      t.timestamps null: false
    end
  end
end

