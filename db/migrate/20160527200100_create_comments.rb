class CreateComments < ActiveRecord::Migration
  def change
    create_table  :comments do |t|
      t.integer   :commenter_id
      t.integer   :team_id
      t.text      :body

      t.timestamps null: false
    end
  end
end

