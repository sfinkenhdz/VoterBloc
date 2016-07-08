class CreateTeams < ActiveRecord::Migration
  def change
    create_table  :teams do |t|
      t.integer   :organizer_id
      t.string    :name
      t.string    :location
      t.integer   :membership_goal

      t.timestamps null: false
    end
  end
end

