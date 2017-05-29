class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :ku_id
      t.string :email
      t.boolean :admin
      t.string :moderator_for
    end
  end
end
