class CreateElections < ActiveRecord::Migration
  def change
    create_table  :elections do |t|
      t.date      :date
      t.string    :description

      t.timestamps null: false
    end
  end
end
