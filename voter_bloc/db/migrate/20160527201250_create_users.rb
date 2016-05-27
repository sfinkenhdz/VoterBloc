class CreateUsers < ActiveRecord::Migration
  def change
    create_table  :users do |t|
      t.string    :email
      t.string    :first_name
      t.string    :last_name
      t.string    :username
      t.string    :password_digest
      t.string    :full_address
      t.integer   :voter_registration_status

      t.timestamps null: false
    end
  end
end

